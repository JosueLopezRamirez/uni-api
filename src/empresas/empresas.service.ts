import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ILike, Repository } from 'typeorm';
import { CreateEmpresaDto } from './dto/create-empresa.dto';
import { UpdateEmpresaDto } from './dto/update-empresa.dto';
import { Empresa } from './entities/empresa.entity';

@Injectable()
export class EmpresasService {
  constructor(
    @InjectRepository(Empresa)
    private repository: Repository<Empresa>,
  ) { }

  create(createEmpresaDto: CreateEmpresaDto) {
    return this.repository.save(createEmpresaDto);
  }

  async findAll(skip = 1, take = 10, text = "") {
    const [result, count] = await this.repository.findAndCount({
      take,
      skip: (skip - 1) * take,
      where: [
        { nombre: ILike(`%${text}%`) },
        { ruc: ILike(`%${text}%`) },
        { telefono: ILike(`%${text}%`) },
      ],
    });
    return { data: result, count };
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
