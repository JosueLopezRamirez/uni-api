import { Documento } from '../../documento/entities/documento.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, OneToMany } from 'typeorm';

@Entity()
export class Empresa extends BaseEntity {
  @Column()
  nombre: string;

  @Column({ nullable: true })
  descripcion: string;

  @Column({ unique: true })
  ruc: string;

  @Column({ unique: true })
  telefono: string;

  @OneToMany(() => Documento, (entidad) => entidad.empresa)
  documentos: Documento[];
}
