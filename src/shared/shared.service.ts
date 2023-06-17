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
    
    const dataSql = await require('fs').readFileSync(join(process.cwd(), './temp/restore.sql')).toString();
    
    console.log({ dataSql });
    
    const dataArr = dataSql.toString().split(';');

    console.log({ dataArr });

    // dataArr.forEach((query) => {
    //   if(query) {
    //     // Add the delimiter back to each query before you run them
    //     // In my case the it was `);`
    //     query += ');';
    //     db.run(query, (err) => {
    //        if(err) throw err;
    //     });
    //   }
    // });

    // const connection = mysql.createConnection({
    //   multipleStatements: true,
    //   host: process.env.DATABASE_HOST,
    //   database: process.env.DATABASE_NAME,
    //   port: parseInt(process.env.DATABASE_PORT, 10),
    //   user: process.env.DATABASE_USERNAME,
    //   password: process.env.DATABASE_PASSWORD,
    // })
    // connection.query(backup.url, (err) => { console.log(err ? err : 'restored!') });
  }
}
