import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FeatureFlagUserService } from './feature-flag-user.service';
import { BulkFeatureUserDto, CreateFeatureFlagUserDto } from './dto/create-feature-flag-user.dto';
import { UpdateFeatureFlagUserDto } from './dto/update-feature-flag-user.dto';

@Controller('feature-flag-user')
export class FeatureFlagUserController {
  constructor(private readonly featureFlagUserService: FeatureFlagUserService) {}

  @Post()
  create(@Body() createFeatureFlagUserDto: CreateFeatureFlagUserDto) {
    return this.featureFlagUserService.create(createFeatureFlagUserDto);
  }

  @Post("/bulk")
  bulkCreate(@Body() bulkFeatureUserDto: BulkFeatureUserDto) {
    return this.featureFlagUserService.bulkCreate(bulkFeatureUserDto);
  }

  @Get()
  findAll() {
    return this.featureFlagUserService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.featureFlagUserService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateFeatureFlagUserDto: UpdateFeatureFlagUserDto) {
    return this.featureFlagUserService.update(id, updateFeatureFlagUserDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.featureFlagUserService.remove(id);
  }
}
