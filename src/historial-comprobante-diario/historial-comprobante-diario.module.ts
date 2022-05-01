import { Module } from '@nestjs/common';
import { HistorialComprobanteDiarioService } from './historial-comprobante-diario.service';
import { HistorialComprobanteDiarioController } from './historial-comprobante-diario.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { HistorialComprobanteDiario } from './entities/historial-comprobante-diario.entity';

@Module({
  imports: [TypeOrmModule.forFeature([HistorialComprobanteDiario])],
  controllers: [HistorialComprobanteDiarioController],
  providers: [HistorialComprobanteDiarioService],
})
export class HistorialComprobanteDiarioModule {}
