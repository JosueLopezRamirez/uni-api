import { Injectable } from '@nestjs/common';
import { S3 } from 'aws-sdk'

@Injectable()
export class AwsService {

    private readonly _s3: S3;
    private readonly _bucketName: string;

    constructor() {
        this._bucketName = process.env.AWS_STORAGE_BUCKET_NAME ?? 'bucket',
            this._s3 = new S3({
                accessKeyId: process.env.AWS_ACCESS_KEY_ID ?? 'AKIAZC6IZHCWJYSAQF5D',
                secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY ?? '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',
                endpoint: process.env.AWS_ENDPOINT_URL ?? 'http://localhost:4566',
                s3ForcePathStyle: true,
                region: process.env.AWS_REGION ?? 'ap-southeast-1',
                logger: console
            });
        this._s3.createBucket({ Bucket: 'bucket' },
            (err, data) => { console.log(err, data) });
    }

    async uploadS3(file, name): Promise<UploadDto> {
        const s3 = this.getS3();
        const s3Params = {
            Bucket: this._bucketName,
            Key: String(name),
            Body: file,
        };

        const data = await this.uploadToS3(s3, s3Params)
        return data;
    }

    async uploadToS3(s3: S3, s3Params): Promise<UploadDto> {
        return new Promise((resolve, reject) => {
            s3.upload(s3Params, (err, data) => {
                if (err) {
                    // Logger.error(err);
                    reject(err);
                }
                resolve(data);
            });
        });
    }

    getS3() {
        return this._s3;
    }

    getBucketName() {
        return this._bucketName;
    }

    createBucket() {
        this.getS3().createBucket({ Bucket: 'bucket' },
            (err, data) => { console.log(err, data) });
    }

    uploadDbBackup = () => {

    }
}
