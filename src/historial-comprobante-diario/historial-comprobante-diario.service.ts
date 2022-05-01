import { Injectable } from '@nestjs/common';
import { CreateHistorialComprobanteDiarioDto } from './dto/create-historial-comprobante-diario.dto';
import { UpdateHistorialComprobanteDiarioDto } from './dto/update-historial-comprobante-diario.dto';

@Injectable()
export class HistorialComprobanteDiarioService {
  create(createHistorialComprobanteDiarioDto: CreateHistorialComprobanteDiarioDto) {
    return 'This action adds a new historialComprobanteDiario';
  }

  findAll() {
    return `This action returns all historialComprobanteDiario`;
  }

  findOne(id: number) {
    return `This action returns a #${id} historialComprobanteDiario`;
  }

  update(id: number, updateHistorialComprobanteDiarioDto: UpdateHistorialComprobanteDiarioDto) {
    return `This action updates a #${id} historialComprobanteDiario`;
  }

  remove(id: number) {
    return `This action removes a #${id} historialComprobanteDiario`;
  }
}
