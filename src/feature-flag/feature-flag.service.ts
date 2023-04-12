import { Injectable } from '@nestjs/common';
import { CreateFeatureFlagDto } from './dto/create-feature-flag.dto';
import { UpdateFeatureFlagDto } from './dto/update-feature-flag.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { FeatureFlag } from './entities/feature-flag.entity';
import { Repository } from 'typeorm';

@Injectable()
export class FeatureFlagService {

  constructor(
    @InjectRepository(FeatureFlag)
    private repository: Repository<FeatureFlag>,
  ) { }

  create(createFeatureFlagDto: CreateFeatureFlagDto) {
    return this.repository.save(createFeatureFlagDto);
  }

  async findAll() {
    return this.repository.find();
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id);
  }

  update(id: string, updateFeatureFlagDto: UpdateFeatureFlagDto) {
    return this.repository.update(id, updateFeatureFlagDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
