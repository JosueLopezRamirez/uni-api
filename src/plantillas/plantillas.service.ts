import { InjectRepository } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { CreatePlantillaDto } from './dto/create-plantilla.dto';
import { UpdatePlantillaDto } from './dto/update-plantilla.dto';
import { Repository } from 'typeorm';
import { Plantilla } from './entities/plantilla.entity';

@Injectable()
export class PlantillasService {
  constructor(
    @InjectRepository(Plantilla)
    private repository: Repository<Plantilla>,
  ) {}

  create(createPlantillaDto: CreatePlantillaDto) {
    return this.repository.save(createPlantillaDto);
  }

  findAll() {
    return this.repository.find();
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id);
  }

  update(id: string, updatePlantillaDto: UpdatePlantillaDto) {
    return this.repository.update(id, updatePlantillaDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
