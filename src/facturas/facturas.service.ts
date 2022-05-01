import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateFacturaDto } from './dto/create-factura.dto';
import { UpdateFacturaDto } from './dto/update-factura.dto';
import { Factura } from './entities/factura.entity';

@Injectable()
export class FacturasService {
  constructor(
    @InjectRepository(Factura)
    private repository: Repository<Factura>,
  ) {}

  create(createFacturaDto: CreateFacturaDto) {
    return this.repository.save(createFacturaDto);
  }

  findAll() {
    return this.repository.find();
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id);
  }

  update(id: string, updateFacturaDto: UpdateFacturaDto) {
    return this.repository.update(id, updateFacturaDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
