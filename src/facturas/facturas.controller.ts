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
  Res,
} from '@nestjs/common';
import { FacturasService } from './facturas.service';
import { DetalleFacturaDto } from './dto/create-factura.dto';
import { Request, Response } from 'express';
import { JwtService } from '@nestjs/jwt';
import pdf from "html-pdf";

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
    return this.facturasService.findAll(parseInt(query.skip), parseInt(query.take), query.empresa, query.text);
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

  @Get("/generate-report/:id")
  async generateReport(@Param('id') id: string, @Res() res: Response) {
    const pdfFile = await this.facturasService.generateReport(id);

    pdf.create(pdfFile).toBuffer((err, buffer) => {
      if (err) {
        // some code
      } else {
        res.setHeader('Content-Type', 'application/pdf');
        res.setHeader('Content-Disposition', 'attachment; filename=invoice.pdf');

        res.send(buffer);
      }
    });
  }
}
