import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateDinamicoDto } from './dto/create-dinamico.dto';
import { UpdateDinamicoDto } from './dto/update-dinamico.dto';
import { Dinamico } from './entities/dinamico.entity';

@Injectable()
export class DinamicosService {
  constructor(
    @InjectRepository(Dinamico)
    private repository: Repository<Dinamico>,
  ) {}

  create(createDinamicoDto: CreateDinamicoDto) {
    return this.repository.save(createDinamicoDto);
  }

  findAll() {
    return this.repository.find({ relations: ['documento'] });
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id);
  }

  update(id: string, updateDinamicoDto: UpdateDinamicoDto) {
    return this.repository.update(id, updateDinamicoDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
