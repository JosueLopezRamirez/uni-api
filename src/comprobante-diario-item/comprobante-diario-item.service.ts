import { Injectable } from '@nestjs/common';
import { CreateComprobanteDiarioItemDto } from './dto/create-comprobante-diario-item.dto';
import { UpdateComprobanteDiarioItemDto } from './dto/update-comprobante-diario-item.dto';
import { ComprobanteDiarioItem } from './entities/comprobante-diario-item.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class ComprobanteDiarioItemService {

  constructor(
    @InjectRepository(ComprobanteDiarioItem)
    private repository: Repository<ComprobanteDiarioItem>,
  ) { }

  create(createComprobanteDiarioItemDto: CreateComprobanteDiarioItemDto) {
    return 'This action adds a new comprobanteDiarioItem';
  }

  findAll() {
    return `This action returns all comprobanteDiarioItem`;
  }

  findOne(id: string) {
    return `This action returns a #${id} comprobanteDiarioItem`;
  }

  update(
    id: string,
    updateComprobanteDiarioItemDto: UpdateComprobanteDiarioItemDto,
  ) {
    return `This action updates a #${id} comprobanteDiarioItem`;
  }

  remove(id: string) {
    return `This action removes a #${id} comprobanteDiarioItem`;
  }

  byParentId(id: string) {
    return this.repository.find({ where: { comprobanteDiarioId: id } });
  }
}
