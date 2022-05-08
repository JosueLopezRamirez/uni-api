import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { FilasService } from './filas.service';
import { CreateFilaDto } from './dto/create-fila.dto';
import { UpdateFilaDto } from './dto/update-fila.dto';

@Controller('filas')
export class FilasController {
  constructor(private readonly filasService: FilasService) {}

  @Post()
  create(@Body() createFilaDto: CreateFilaDto) {
    return this.filasService.create(createFilaDto);
  }

  @Get()
  findAll() {
    return this.filasService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.filasService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateFilaDto: UpdateFilaDto) {
    return this.filasService.update(id, updateFilaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.filasService.remove(id);
  }
}
