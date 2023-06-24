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
import { JwtService } from '@nestjs/jwt';
import { Request, Response } from 'express';
import { ComprobanteDiarioService } from './comprobante-diario.service';
import { DetalleComprobanteDto } from './dto/create-comprobante-diario.dto';
import pdf from "html-pdf";

@Controller('comprobante-diario')
export class ComprobanteDiarioController {
  constructor(
    private readonly comprobanteDiarioService: ComprobanteDiarioService,
    private jwtService: JwtService,
  ) { }

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
    return this.comprobanteDiarioService.findAll(parseInt(query.skip), parseInt(query.take), query.empresa);
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


  @Get("/generate-report/:id")
  async generateReport(@Param('id') id: string, @Res() res: Response) {
    const pdfFile = await this.comprobanteDiarioService.generateReport(id);

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
