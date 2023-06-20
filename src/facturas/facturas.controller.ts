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
import { FacturasService } from './facturas.service';
import { CreateFacturaDto, DetalleFacturaDto } from './dto/create-factura.dto';
import { UpdateFacturaDto } from './dto/update-factura.dto';
import { Request } from 'express';
import { JwtService } from '@nestjs/jwt';

@Controller('facturas')
export class FacturasController {
  constructor(
    private readonly facturasService: FacturasService,
    private jwtService: JwtService,
  ) { }

  @Post()
  create(@Body() detalleFactura: DetalleFacturaDto, @Req() req: Request) {
    const token = req.headers.authorization;
    const decoded = this.jwtService.decode(token);
    const usuarioId = decoded.sub;
    return this.facturasService.create(detalleFactura, usuarioId);
  }

  @Get()
  findAll(@Query() query) {
    return this.facturasService.findAll(parseInt(query.skip), parseInt(query.take), query.empresa);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.facturasService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() detalleFactura: DetalleFacturaDto,
    @Req() req: Request,
  ) {
    const token = req.headers.authorization;
    const decoded = this.jwtService.decode(token);
    const usuarioId = decoded.sub;
    return this.facturasService.update(id, detalleFactura, usuarioId);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.facturasService.remove(id);
  }
}
