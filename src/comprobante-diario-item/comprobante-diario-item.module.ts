import { Module } from '@nestjs/common';
import { ComprobanteDiarioItemService } from './comprobante-diario-item.service';
import { ComprobanteDiarioItemController } from './comprobante-diario-item.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ComprobanteDiarioItem } from './entities/comprobante-diario-item.entity';

@Module({
  imports: [TypeOrmModule.forFeature([ComprobanteDiarioItem])],
  controllers: [ComprobanteDiarioItemController],
  providers: [ComprobanteDiarioItemService],
})
export class ComprobanteDiarioItemModule {}
