import { Injectable } from '@nestjs/common';
import { CreateFeatureFlagUserDto } from './dto/create-feature-flag-user.dto';
import { UpdateFeatureFlagUserDto } from './dto/update-feature-flag-user.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { FeatureFlagUser } from './entities/feature-flag-user.entity';

@Injectable()
export class FeatureFlagUserService {

  constructor(
    @InjectRepository(FeatureFlagUser)
    private repository: Repository<FeatureFlagUser>,
  ) { }

  create(createFeatureFlagUserDto: CreateFeatureFlagUserDto) {
    return this.repository.save(createFeatureFlagUserDto);
  }

  findAll() {
    return this.repository.find();
  }

  findOne(id: string) {
    return this.repository.find({ where: { usuarioId: id } });
  }

  update(id: string, updateFeatureFlagUserDto: UpdateFeatureFlagUserDto) {
    return this.repository.update(id, updateFeatureFlagUserDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
