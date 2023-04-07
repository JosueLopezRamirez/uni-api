import { Usuario } from '../../usuario/entities/usuario.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, OneToMany } from 'typeorm';

@Entity('rol')
export class Role extends BaseEntity {
  @Column({ unique: true })
  nombre: string;

  @OneToMany(() => Usuario, (usuario) => usuario.rol)
  usuarios: Usuario[];
}
