import { Module } from '@nestjs/common';
import { BackupsService } from './backups.service';
import { BackupsController } from './backups.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Backup } from './entities/backup.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Backup])],
  controllers: [BackupsController],
  providers: [BackupsService],
  exports: [BackupsService]
})
export class BackupsModule {}
