import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateEmpresaDto } from './dto/create-empresa.dto';
import { UpdateEmpresaDto } from './dto/update-empresa.dto';
import { Empresa } from './entities/empresa.entity';

@Injectable()
export class EmpresasService {
  constructor(
    @InjectRepository(Empresa)
    private repository: Repository<Empresa>,
  ) {}

  create(createEmpresaDto: CreateEmpresaDto) {
    return this.repository.save(createEmpresaDto);
  }

  findAll() {
    return this.repository.find({
      relations: ['comprobantesDiario', 'facturas'],
    });
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id);
  }

  update(id: string, updateEmpresaDto: UpdateEmpresaDto) {
    return this.repository.update(id, updateEmpresaDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
