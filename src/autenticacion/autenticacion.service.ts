import { Injectable } from '@nestjs/common';
import { UsuarioService } from 'src/usuario/usuario.service';
import { LoginDto } from './dto/login';
import { JwtService } from '@nestjs/jwt';
import { Usuario } from 'src/usuario/entities/usuario.entity';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AutenticacionService {
  constructor(
    private usuariosService: UsuarioService,
    private jwtService: JwtService,
  ) {}

  login(usuario: Usuario) {
    const payload = { usuario: usuario.nombre, sub: usuario.id };
    return {
      access_token: this.jwtService.sign(payload),
    };
  }

  async validarUsuario(loginDto: LoginDto) {
    const usuario = await this.usuariosService.buscarPorCorreo(loginDto.correo);
    const passwordCorrecta = bcrypt.compareSync(
      loginDto.password,
      usuario.data.password,
    );
    if (usuario && passwordCorrecta) {
      return this.login(usuario.data);
    }
    return null;
  }
}
