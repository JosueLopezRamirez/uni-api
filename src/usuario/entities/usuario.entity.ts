import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';
import { BaseEntity } from '../../utils/base.entity';
import { Role } from '../../roles/entities/role.entity';
import { HistorialComprobanteDiario } from '../../historial-comprobante-diario/entities/historial-comprobante-diario.entity';
import { FeatureFlagUser } from '../../feature-flag-user/entities/feature-flag-user.entity';

@Entity()
export class Usuario extends BaseEntity {
  @Column()
  nombre: string;

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

  @OneToMany(() => HistorialComprobanteDiario, (entidad) => entidad.usuario)
  historial: HistorialComprobanteDiario[];

  @OneToMany(() => FeatureFlagUser, (entidad) => entidad.usuario)
  featureFlagUser: FeatureFlagUser[]
}
