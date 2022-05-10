import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateHistorialFacturaDto } from './dto/create-historial-factura.dto';
import { UpdateHistorialFacturaDto } from './dto/update-historial-factura.dto';
import { HistorialFactura } from './entities/historial-factura.entity';

@Injectable()
export class HistorialFacturasService {
  constructor(
    @InjectRepository(HistorialFactura)
    private repository: Repository<HistorialFactura>,
  ) {}

  create(createHistorialFacturaDto: CreateHistorialFacturaDto) {
    return 'This action adds a new historialFactura';
  }

  findAll() {
    return `This action returns all historialFacturas`;
  }

  findOne(id: string) {
    return this.repository.find({
      relations: ['usuario', 'factura'],
      where: { facturaId: id },
    });
  }

  update(id: string, updateHistorialFacturaDto: UpdateHistorialFacturaDto) {
    return `This action updates a #${id} historialFactura`;
  }

  remove(id: string) {
    return `This action removes a #${id} historialFactura`;
  }
}
