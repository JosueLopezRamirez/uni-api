import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateHistorialComprobanteDiarioDto } from './dto/create-historial-comprobante-diario.dto';
import { UpdateHistorialComprobanteDiarioDto } from './dto/update-historial-comprobante-diario.dto';
import { HistorialComprobanteDiario } from './entities/historial-comprobante-diario.entity';

@Injectable()
export class HistorialComprobanteDiarioService {
  constructor(
    @InjectRepository(HistorialComprobanteDiario)
    private repository: Repository<HistorialComprobanteDiario>,
  ) {}

  create(
    createHistorialComprobanteDiarioDto: CreateHistorialComprobanteDiarioDto,
  ) {
    return 'This action adds a new historialComprobanteDiario';
  }

  findAll() {
    return this.repository.find();
  }

  findOne(id: string) {
    return this.repository.find({
      relations: ['usuario', 'comprobanteDiario'],
      where: { comprobanteDiarioId: id },
    });
  }

  update(
    id: string,
    updateHistorialComprobanteDiarioDto: UpdateHistorialComprobanteDiarioDto,
  ) {
    return `This action updates a #${id} historialComprobanteDiario`;
  }

  remove(id: string) {
    return `This action removes a #${id} historialComprobanteDiario`;
  }
}
