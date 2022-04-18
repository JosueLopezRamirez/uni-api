import { Injectable } from '@nestjs/common';
import { CreateComprobanteDiarioItemDto } from './dto/create-comprobante-diario-item.dto';
import { UpdateComprobanteDiarioItemDto } from './dto/update-comprobante-diario-item.dto';

@Injectable()
export class ComprobanteDiarioItemService {
  create(createComprobanteDiarioItemDto: CreateComprobanteDiarioItemDto) {
    return 'This action adds a new comprobanteDiarioItem';
  }

  findAll() {
    return `This action returns all comprobanteDiarioItem`;
  }

  findOne(id: number) {
    return `This action returns a #${id} comprobanteDiarioItem`;
  }

  update(id: number, updateComprobanteDiarioItemDto: UpdateComprobanteDiarioItemDto) {
    return `This action updates a #${id} comprobanteDiarioItem`;
  }

  remove(id: number) {
    return `This action removes a #${id} comprobanteDiarioItem`;
  }
}
