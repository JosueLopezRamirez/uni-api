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

  async findAll(skip = 1, take = 10) {
    const [result, count] = await this.repository.findAndCount({
      take,
      skip: (skip - 1) * take
    });
    return { data: result, count }
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
