import {
  Controller,
  Get,
  Post,
  Res,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ComprobanteDiarioItemService } from './comprobante-diario-item.service';
import { CreateComprobanteDiarioItemDto } from './dto/create-comprobante-diario-item.dto';
import { UpdateComprobanteDiarioItemDto } from './dto/update-comprobante-diario-item.dto';
import { Response } from 'express';

@Controller('comprobante-diario-item')
export class ComprobanteDiarioItemController {
  constructor(
    private readonly comprobanteDiarioItemService: ComprobanteDiarioItemService,
  ) { }

  @Post()
  create(
    @Body() createComprobanteDiarioItemDto: CreateComprobanteDiarioItemDto,
  ) {
    return this.comprobanteDiarioItemService.create(
      createComprobanteDiarioItemDto,
    );
  }

  @Get()
  findAll() {
    return this.comprobanteDiarioItemService.findAll();
  }

  @Get('/parent/:id')
  async findbyParentId(@Param('id') id: string, @Res() res: Response) {
    const data = await this.comprobanteDiarioItemService.byParentId(id);
    res.status(200).send({ data: [...data] })
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.comprobanteDiarioItemService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateComprobanteDiarioItemDto: UpdateComprobanteDiarioItemDto,
  ) {
    return this.comprobanteDiarioItemService.update(
      id,
      updateComprobanteDiarioItemDto,
    );
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.comprobanteDiarioItemService.remove(id);
  }
}
