import { Usuario } from 'src/usuario/entities/usuario.entity';
import { Permiso } from 'src/permisos/entities/permiso.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, OneToMany } from 'typeorm';

@Entity('rol')
export class Role extends BaseEntity {
  @Column()
  nombre: string;

  @OneToMany(() => Usuario, (usuario) => usuario.rol)
  usuarios: Usuario[];

  @OneToMany(() => Permiso, (permiso) => permiso.rol)
  permisos: Permiso[];
}
