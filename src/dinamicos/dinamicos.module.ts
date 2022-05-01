import { Module } from '@nestjs/common';
import { DinamicosService } from './dinamicos.service';
import { DinamicosController } from './dinamicos.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Dinamico } from './entities/dinamico.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Dinamico])],
  controllers: [DinamicosController],
  providers: [DinamicosService],
})
export class DinamicosModule {}
