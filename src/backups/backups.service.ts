import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateBackupDto } from './dto/create-backup.dto';
import { UpdateBackupDto } from './dto/update-backup.dto';
import { Backup } from './entities/backup.entity';

@Injectable()
export class BackupsService {
  
  constructor(
    @InjectRepository(Backup)
    private repository: Repository<Backup>,
  ) { }

  create(createBackupDto: CreateBackupDto) {
    return this.repository.save(createBackupDto);
  }

  findAll() {
    return this.repository.find();
  }

  findOne(id: number) {
    return this.repository.findOneOrFail(id);
  }

  update(id: number, updateBackupDto: UpdateBackupDto) {
    return this.repository.update(id, updateBackupDto);
  }

  remove(id: number) {
    return this.repository.softDelete(id);
  }
}
