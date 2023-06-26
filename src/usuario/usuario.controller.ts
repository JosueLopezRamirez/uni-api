import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Query,
} from '@nestjs/common';
import { UsuarioService } from './usuario.service';
import { CreateUsuarioDto, FilterOptionsDto } from './dto/create-usuario.dto';
import { UpdateUsuarioDto } from './dto/update-usuario.dto';
import * as bcrypt from 'bcrypt';

@Controller('usuario')
export class UsuarioController {
  constructor(private readonly usuarioService: UsuarioService) { }

  @Post()
  async create(@Body() createUsuarioDto: CreateUsuarioDto) {
    const passwordEncrypted = bcrypt.hashSync(createUsuarioDto.password, 10);
    const { password, ...result } = await this.usuarioService.create({
      ...createUsuarioDto,
      password: passwordEncrypted,
    });

    return result;
  }

  @Get('/')
  find(@Query() query) {
    return this.usuarioService.findAll(parseInt(query.skip), parseInt(query.take), query.text);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.usuarioService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateUsuarioDto: UpdateUsuarioDto) {
    return this.usuarioService.update(id, updateUsuarioDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.usuarioService.remove(id);
  }
}
