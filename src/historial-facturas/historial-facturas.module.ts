import { Module } from '@nestjs/common';
import { HistorialFacturasService } from './historial-facturas.service';
import { HistorialFacturasController } from './historial-facturas.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { HistorialFactura } from './entities/historial-factura.entity';

@Module({
  imports: [TypeOrmModule.forFeature([HistorialFactura])],
  controllers: [HistorialFacturasController],
  providers: [HistorialFacturasService],
})
export class HistorialFacturasModule {}
