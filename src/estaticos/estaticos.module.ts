import { Module } from '@nestjs/common';
import { EstaticosService } from './estaticos.service';
import { EstaticosController } from './estaticos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Estatico } from './entities/estatico.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Estatico])],
  controllers: [EstaticosController],
  providers: [EstaticosService],
})
export class EstaticosModule {}
