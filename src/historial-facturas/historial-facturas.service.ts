import { Injectable } from '@nestjs/common';
import { CreateHistorialFacturaDto } from './dto/create-historial-factura.dto';
import { UpdateHistorialFacturaDto } from './dto/update-historial-factura.dto';

@Injectable()
export class HistorialFacturasService {
  create(createHistorialFacturaDto: CreateHistorialFacturaDto) {
    return 'This action adds a new historialFactura';
  }

  findAll() {
    return `This action returns all historialFacturas`;
  }

  findOne(id: string) {
    return `This action returns a #${id} historialFactura`;
  }

  update(id: string, updateHistorialFacturaDto: UpdateHistorialFacturaDto) {
    return `This action updates a #${id} historialFactura`;
  }

  remove(id: string) {
    return `This action removes a #${id} historialFactura`;
  }
}
