import { Injectable } from '@nestjs/common';
import { CreateEstaticoDto } from './dto/create-estatico.dto';
import { UpdateEstaticoDto } from './dto/update-estatico.dto';

@Injectable()
export class EstaticosService {
  create(createEstaticoDto: CreateEstaticoDto) {
    return 'This action adds a new estatico';
  }

  findAll() {
    return `This action returns all estaticos`;
  }

  findOne(id: number) {
    return `This action returns a #${id} estatico`;
  }

  update(id: number, updateEstaticoDto: UpdateEstaticoDto) {
    return `This action updates a #${id} estatico`;
  }

  remove(id: number) {
    return `This action removes a #${id} estatico`;
  }
}
