import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FacturaItemService } from './factura-item.service';
import { CreateFacturaItemDto } from './dto/create-factura-item.dto';
import { UpdateFacturaItemDto } from './dto/update-factura-item.dto';

@Controller('factura-item')
export class FacturaItemController {
  constructor(private readonly facturaItemService: FacturaItemService) {}

  @Post()
  create(@Body() createFacturaItemDto: CreateFacturaItemDto) {
    return this.facturaItemService.create(createFacturaItemDto);
  }

  @Get()
  findAll() {
    return this.facturaItemService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.facturaItemService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateFacturaItemDto: UpdateFacturaItemDto) {
    return this.facturaItemService.update(+id, updateFacturaItemDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.facturaItemService.remove(+id);
  }
}
