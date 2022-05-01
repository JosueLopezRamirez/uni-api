import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { HistorialComprobanteDiarioService } from './historial-comprobante-diario.service';
import { CreateHistorialComprobanteDiarioDto } from './dto/create-historial-comprobante-diario.dto';
import { UpdateHistorialComprobanteDiarioDto } from './dto/update-historial-comprobante-diario.dto';

@Controller('historial-comprobante-diario')
export class HistorialComprobanteDiarioController {
  constructor(private readonly historialComprobanteDiarioService: HistorialComprobanteDiarioService) {}

  @Post()
  create(@Body() createHistorialComprobanteDiarioDto: CreateHistorialComprobanteDiarioDto) {
    return this.historialComprobanteDiarioService.create(createHistorialComprobanteDiarioDto);
  }

  @Get()
  findAll() {
    return this.historialComprobanteDiarioService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.historialComprobanteDiarioService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateHistorialComprobanteDiarioDto: UpdateHistorialComprobanteDiarioDto) {
    return this.historialComprobanteDiarioService.update(+id, updateHistorialComprobanteDiarioDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.historialComprobanteDiarioService.remove(+id);
  }
}
