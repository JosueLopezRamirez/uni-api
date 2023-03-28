import { HttpException, Injectable } from '@nestjs/common';
import { UsuarioService } from '../usuario/usuario.service';
import { LoginDto } from './dto/login';
import { JwtService } from '@nestjs/jwt';
import { Usuario } from '../usuario/entities/usuario.entity';
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
      usuario,
      access_token: this.jwtService.sign(payload),
    };
  }

  async validarUsuario(loginDto: LoginDto) {
    const usuario = await this.usuariosService.buscarPorCorreo(loginDto.correo);
    const passwordCorrecta = bcrypt.compareSync(
      loginDto.password,
      usuario.data.password,
    );
    console.log('passwordCorrecta', passwordCorrecta);
    if (usuario && passwordCorrecta) {
      return this.login(usuario.data);
    }
    throw new HttpException(
      {
        message: 'Contraseña o correo incorrectos',
      },
      404,
    );
  }
}
