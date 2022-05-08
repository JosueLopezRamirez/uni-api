import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { HistorialFacturasService } from './historial-facturas.service';
import { CreateHistorialFacturaDto } from './dto/create-historial-factura.dto';
import { UpdateHistorialFacturaDto } from './dto/update-historial-factura.dto';

@Controller('historial-facturas')
export class HistorialFacturasController {
  constructor(
    private readonly historialFacturasService: HistorialFacturasService,
  ) {}

  @Post()
  create(@Body() createHistorialFacturaDto: CreateHistorialFacturaDto) {
    return this.historialFacturasService.create(createHistorialFacturaDto);
  }

  @Get()
  findAll() {
    return this.historialFacturasService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.historialFacturasService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateHistorialFacturaDto: UpdateHistorialFacturaDto,
  ) {
    return this.historialFacturasService.update(id, updateHistorialFacturaDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.historialFacturasService.remove(id);
  }
}
