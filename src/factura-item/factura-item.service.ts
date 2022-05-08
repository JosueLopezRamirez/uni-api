import { Injectable } from '@nestjs/common';
import { CreateFacturaItemDto } from './dto/create-factura-item.dto';
import { UpdateFacturaItemDto } from './dto/update-factura-item.dto';

@Injectable()
export class FacturaItemService {
  create(createFacturaItemDto: CreateFacturaItemDto) {
    return 'This action adds a new facturaItem';
  }

  findAll() {
    return `This action returns all facturaItem`;
  }

  findOne(id: string) {
    return `This action returns a #${id} facturaItem`;
  }

  update(id: string, updateFacturaItemDto: UpdateFacturaItemDto) {
    return `This action updates a #${id} facturaItem`;
  }

  remove(id: string) {
    return `This action removes a #${id} facturaItem`;
  }
}
