import { Module } from '@nestjs/common';
import { FilasService } from './filas.service';
import { FilasController } from './filas.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Fila } from './entities/fila.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Fila])],
  controllers: [FilasController],
  providers: [FilasService],
})
export class FilasModule {}
