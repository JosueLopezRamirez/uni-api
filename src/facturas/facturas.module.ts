import { Module } from '@nestjs/common';
import { FacturasService } from './facturas.service';
import { FacturasController } from './facturas.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Factura } from './entities/factura.entity';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [
    TypeOrmModule.forFeature([Factura]),
    JwtModule.register({
      secret: 'secret',
      signOptions: { expiresIn: '24h' },
    }),
  ],
  controllers: [FacturasController],
  providers: [FacturasService],
})
export class FacturasModule {}
