import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Req,
  Query,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Request } from 'express';
import { ComprobanteDiarioService } from './comprobante-diario.service';
import { DetalleComprobanteDto } from './dto/create-comprobante-diario.dto';
import { UpdateComprobanteDiarioDto } from './dto/update-comprobante-diario.dto';

@Controller('comprobante-diario')
export class ComprobanteDiarioController {
  constructor(
    private readonly comprobanteDiarioService: ComprobanteDiarioService,
    private jwtService: JwtService,
  ) {}

  @Post()
  create(
    @Body() detalleComprobanteDiario: DetalleComprobanteDto,
    @Req() req: Request,
  ) {
    const token = req.headers.authorization;
    const decoded = this.jwtService.decode(token);
    const usuarioId = decoded.sub;
    return this.comprobanteDiarioService.create(
      detalleComprobanteDiario,
      usuarioId,
    );
  }

  @Get()
  findAll(@Query() query) {
    return this.comprobanteDiarioService.findAll(parseInt(query.skip), parseInt(query.take));
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.comprobanteDiarioService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() detalleComprobanteDiario: DetalleComprobanteDto,
    @Req() req: Request,
  ) {
    const token = req.headers.authorization;
    const decoded = this.jwtService.decode(token);
    const usuarioId = decoded.sub;
    return this.comprobanteDiarioService.update(
      id,
      detalleComprobanteDiario,
      usuarioId,
    );
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.comprobanteDiarioService.remove(id);
  }
}
