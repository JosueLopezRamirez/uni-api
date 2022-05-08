import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ComprobanteDiarioItemService } from './comprobante-diario-item.service';
import { CreateComprobanteDiarioItemDto } from './dto/create-comprobante-diario-item.dto';
import { UpdateComprobanteDiarioItemDto } from './dto/update-comprobante-diario-item.dto';

@Controller('comprobante-diario-item')
export class ComprobanteDiarioItemController {
  constructor(
    private readonly comprobanteDiarioItemService: ComprobanteDiarioItemService,
  ) {}

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
