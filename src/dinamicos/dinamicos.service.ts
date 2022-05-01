import { Injectable } from '@nestjs/common';
import { CreateDinamicoDto } from './dto/create-dinamico.dto';
import { UpdateDinamicoDto } from './dto/update-dinamico.dto';

@Injectable()
export class DinamicosService {
  create(createDinamicoDto: CreateDinamicoDto) {
    return 'This action adds a new dinamico';
  }

  findAll() {
    return `This action returns all dinamicos`;
  }

  findOne(id: number) {
    return `This action returns a #${id} dinamico`;
  }

  update(id: number, updateDinamicoDto: UpdateDinamicoDto) {
    return `This action updates a #${id} dinamico`;
  }

  remove(id: number) {
    return `This action removes a #${id} dinamico`;
  }
}
