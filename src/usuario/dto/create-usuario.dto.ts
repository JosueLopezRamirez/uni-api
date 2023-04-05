import { IsEmail, IsNotEmpty, IsOptional } from 'class-validator';

export class CreateUsuarioDto {
  @IsNotEmpty()
  nombre: string;

  @IsEmail()
  correo: string;

  @IsNotEmpty()
  password: string;

  @IsNotEmpty()
  rolId: string;
}

export class FilterOptionsDto {
  rolId?: string;
  activo?: boolean;
}
