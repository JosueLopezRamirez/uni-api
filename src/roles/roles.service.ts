import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateRoleDto } from './dto/create-role.dto';
import { UpdateRoleDto } from './dto/update-role.dto';
import { Role } from './entities/role.entity';

export interface CreateRolResponse {
  data?: Role;
  error?: any;
}

@Injectable()
export class RolesService {
  constructor(
    @InjectRepository(Role)
    private repository: Repository<Role>,
  ) { }

  async create(createRoleDto: CreateRoleDto): Promise<CreateRolResponse> {
    try {
      const data = await this.repository.save(createRoleDto);
      return { data };
    } catch (error) {
      return { error };
    }
  }

  findAll() {
    return this.repository.find();
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id);
  }

  update(id: string, updateRoleDto: UpdateRoleDto) {
    return this.repository.update(id, updateRoleDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
