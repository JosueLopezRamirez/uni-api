import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreatePermisoDto } from './dto/create-permiso.dto';
import { UpdatePermisoDto } from './dto/update-permiso.dto';
import { Permiso } from './entities/permiso.entity';

@Injectable()
export class PermisosService {
  constructor(
    @InjectRepository(Permiso)
    private repository: Repository<Permiso>,
  ) {}

  create(createPermisoDto: CreatePermisoDto) {
    return this.repository.save(createPermisoDto);
  }

  findAll() {
    return this.repository.find();
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id);
  }

  update(id: string, updatePermisoDto: UpdatePermisoDto) {
    return this.repository.update(id, updatePermisoDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
