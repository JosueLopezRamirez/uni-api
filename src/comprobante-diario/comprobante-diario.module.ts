import { Module } from '@nestjs/common';
import { ComprobanteDiarioService } from './comprobante-diario.service';
import { ComprobanteDiarioController } from './comprobante-diario.controller';
import { ComprobanteDiario } from './entities/comprobante-diario.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ComprobanteDiarioItemModule } from 'src/comprobante-diario-item/comprobante-diario-item.module';

@Module({
  imports: [
    ComprobanteDiarioItemModule,
    TypeOrmModule.forFeature([ComprobanteDiario]),
  ],
  controllers: [ComprobanteDiarioController],
  providers: [ComprobanteDiarioService],
})
export class ComprobanteDiarioModule {}
