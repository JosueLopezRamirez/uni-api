import { Role } from 'src/roles/entities/role.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';

@Entity()
export class Permiso extends BaseEntity {
  @Column()
  pagina: string;

  @Column({ default: false })
  ver: boolean;

  @Column({ default: false })
  edicion: boolean;

  @Column({ default: false })
  borrado: boolean;

  @Column({ name: 'rolId' })
  rolId: string;

  @ManyToOne(() => Role, (rol) => rol.permisos)
  rol: Role;
}
