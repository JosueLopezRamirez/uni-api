import { Injectable } from '@nestjs/common';
import { CreateFilaDto } from './dto/create-fila.dto';
import { UpdateFilaDto } from './dto/update-fila.dto';

@Injectable()
export class FilasService {
  create(createFilaDto: CreateFilaDto) {
    return 'This action adds a new fila';
  }

  findAll() {
    return `This action returns all filas`;
  }

  findOne(id: string) {
    return `This action returns a #${id} fila`;
  }

  update(id: string, updateFilaDto: UpdateFilaDto) {
    return `This action updates a #${id} fila`;
  }

  remove(id: string) {
    return `This action removes a #${id} fila`;
  }
}
