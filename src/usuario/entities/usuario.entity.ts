import { Column, Entity, ManyToOne } from 'typeorm';
import { BaseEntity } from 'src/utils/base.entity';
import { Role } from 'src/roles/entities/role.entity';

@Entity()
export class Usuario extends BaseEntity {
  @Column()
  nombre: string;

  @Column()
  apellidoPaterno: string;

  @Column()
  apellidoMaterno: string;

  @Column({ unique: true })
  correo: string;

  @Column()
  password: string;

  @Column({ name: 'rolId' })
  rolId: string;

  @Column({ default: true })
  activo: boolean;

  @ManyToOne(() => Role, (rol) => rol.usuarios)
  rol: Role;
}
