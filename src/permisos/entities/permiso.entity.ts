import { Role } from '../../roles/entities/role.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, ManyToOne, PrimaryColumn } from 'typeorm';

@Entity()
export class Permiso extends BaseEntity {
  @Column({ nullable: false })
  pagina: string;

  @Column({ name: 'rolId' })
  rolId: string;

  @Column({ default: false })
  ver: boolean;

  @Column({ default: false })
  edicion: boolean;

  @Column({ default: false })
  borrado: boolean;

  @ManyToOne(() => Role, (rol) => rol.permisos)
  rol: Role;
}
