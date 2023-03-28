import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { createReadStream, unlink } from 'fs';
import mysqldump from 'mysqldump';
import { join } from 'path';
import { AwsService } from '../aws/aws.service';

@Injectable()
export class SharedService {

  constructor(private readonly awsService: AwsService) { }

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
      setTimeout(() => {
        unlink(fileLocation, (err) => {
          if (err) {
            throw err;
          }
          console.log("Delete File successfully.");
        });
      }, 3000)
      return data;
    } catch (error) {
      throw new HttpException("Error to backup bd", HttpStatus.UNPROCESSABLE_ENTITY);
    }
  }
}
