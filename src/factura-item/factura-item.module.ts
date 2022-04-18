import { Module } from '@nestjs/common';
import { FacturaItemService } from './factura-item.service';
import { FacturaItemController } from './factura-item.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { FacturaItem } from './entities/factura-item.entity';

@Module({
  imports: [TypeOrmModule.forFeature([FacturaItem])],
  controllers: [FacturaItemController],
  providers: [FacturaItemService],
})
export class FacturaItemModule {}
