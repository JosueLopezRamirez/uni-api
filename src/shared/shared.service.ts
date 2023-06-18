import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { createReadStream, unlink } from 'fs';
import mysqldump from 'mysqldump';
import { join } from 'path';
import { BackupsService } from '../backups/backups.service';
import { AwsService } from '../aws/aws.service';
import * as mysql from "mysql2";
@Injectable()
export class SharedService {

  constructor(private readonly awsService: AwsService, private readonly backupsService: BackupsService) { }

  async dbBackup() {
    const name = `dumpfile-${Date.now()}.sql`;
    const fileLocation = `./temp/${name}`;
    await mysqldump({
      connection: {
        host: process.env.DATABASE_HOST,
        user: process.env.DATABASE_USERNAME,
        password: process.env.DATABASE_PASSWORD,
        database: process.env.DATABASE_NAME,
      },
      dumpToFile: fileLocation,
    });
    const file = createReadStream(join(process.cwd(), fileLocation));

    try {
      const data = await this.awsService.uploadS3(file, name);
      await this.backupsService.create({ name, url: data.Location })
      setTimeout(() => {
        unlink(fileLocation, (err) => {
          if (err) {
            throw err;
          }
          console.log("Delete File successfully.");
        });
      }, 300);
      return data;
    } catch (error) {
      throw new HttpException("Error to backup bd", HttpStatus.UNPROCESSABLE_ENTITY);
    }
  }

  async dbRestore(id: string) {
    const backup = await this.backupsService.findOne(id);
    const file = require('fs').createWriteStream(join(process.cwd(), './temp/restore.sql'));
    (await this.awsService.getFromS3(backup.name)).pipe(file);

    const dataSql = require('fs').readFileSync(join(process.cwd(), './temp/restore.sql'), 'utf8');

    const connection = mysql.createConnection({
      multipleStatements: true,
      host: process.env.DATABASE_HOST,
      database: process.env.DATABASE_NAME,
      port: parseInt(process.env.DATABASE_PORT, 10),
      user: process.env.DATABASE_USERNAME,
      password: process.env.DATABASE_PASSWORD,
    })

    const dropQuery = `
    SET FOREIGN_KEY_CHECKS = 0;

    SELECT CONCAT('TRUNCATE TABLE ', table_name, ';') AS sql_statement
    FROM information_schema.tables
    WHERE table_schema = '${process.env.DATABASE_NAME}';
  `;

    connection.query(dropQuery, (err, results) => {
      if (err) {
        console.error('Error dropping data:', err);
        return;
      }

      const truncateQueries = results[1];

      truncateQueries.forEach((query) => {
        connection.query(query.sql_statement, (err) => {
          if (err) {
            console.error('Error truncating table:', err);
            return;
          }
          console.log('Table truncated successfully:', query.sql_statement);
        });
      });

      connection.query('SET FOREIGN_KEY_CHECKS = 1;', (err) => console.log('ERROR ENABLING FOREIGN KEY CHECKS'));
      console.log('Data dropped successfully');
    });

    setTimeout(() => {
      connection.query(dataSql, (err) => { console.log(err ? err : 'restored database successfuly!') });
      connection.end();
    }, 3000)
  }
}
