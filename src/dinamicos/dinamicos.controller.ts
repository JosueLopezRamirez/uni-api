import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { DinamicosService } from './dinamicos.service';
import { CreateDinamicoDto } from './dto/create-dinamico.dto';
import { UpdateDinamicoDto } from './dto/update-dinamico.dto';

@Controller('dinamicos')
export class DinamicosController {
  constructor(private readonly dinamicosService: DinamicosService) {}

  @Post()
  create(@Body() createDinamicoDto: CreateDinamicoDto) {
    return this.dinamicosService.create(createDinamicoDto);
  }

  @Get()
  findAll() {
    return this.dinamicosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.dinamicosService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateDinamicoDto: UpdateDinamicoDto,
  ) {
    return this.dinamicosService.update(id, updateDinamicoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.dinamicosService.remove(id);
  }
}
