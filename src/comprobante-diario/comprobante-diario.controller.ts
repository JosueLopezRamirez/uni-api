import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ComprobanteDiarioService } from './comprobante-diario.service';
import {
  CreateComprobanteDiarioDto,
  DetalleComprobanteDto,
} from './dto/create-comprobante-diario.dto';
import { UpdateComprobanteDiarioDto } from './dto/update-comprobante-diario.dto';

@Controller('comprobante-diario')
export class ComprobanteDiarioController {
  constructor(
    private readonly comprobanteDiarioService: ComprobanteDiarioService,
  ) {}

  @Post()
  create(@Body() detalleComprobanteDiario: DetalleComprobanteDto) {
    return this.comprobanteDiarioService.create(detalleComprobanteDiario);
  }

  @Get()
  findAll() {
    return this.comprobanteDiarioService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.comprobanteDiarioService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateComprobanteDiarioDto: UpdateComprobanteDiarioDto,
  ) {
    return this.comprobanteDiarioService.update(id, updateComprobanteDiarioDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.comprobanteDiarioService.remove(id);
  }
}
