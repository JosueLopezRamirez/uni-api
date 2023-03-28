import { Module } from '@nestjs/common';
import { SharedService } from './shared.service';
import { SharedController } from './shared.controller';
import { AwsModule } from '../aws/aws.module';
import { BackupsModule } from 'src/backups/backups.module';

@Module({
  imports: [BackupsModule,AwsModule],
  controllers: [SharedController],
  providers: [SharedService]
})
export class SharedModule {}
