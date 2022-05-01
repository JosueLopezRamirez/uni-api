import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { EstaticosService } from './estaticos.service';
import { CreateEstaticoDto } from './dto/create-estatico.dto';
import { UpdateEstaticoDto } from './dto/update-estatico.dto';

@Controller('estaticos')
export class EstaticosController {
  constructor(private readonly estaticosService: EstaticosService) {}

  @Post()
  create(@Body() createEstaticoDto: CreateEstaticoDto) {
    return this.estaticosService.create(createEstaticoDto);
  }

  @Get()
  findAll() {
    return this.estaticosService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.estaticosService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateEstaticoDto: UpdateEstaticoDto) {
    return this.estaticosService.update(+id, updateEstaticoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.estaticosService.remove(+id);
  }
}
