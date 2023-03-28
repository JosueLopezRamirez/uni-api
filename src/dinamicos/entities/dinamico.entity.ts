import { Documento } from '../../documento/entities/documento.entity';
import { Fila } from '../../filas/entities/fila.entity';
import { Plantilla } from '../../plantillas/entities/plantilla.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';

@Entity()
export class Dinamico extends BaseEntity {
  @Column({ name: 'documentoId' })
  documentoId: string;

  @Column({ name: 'plantillaId' })
  plantillaId: string;

  @Column()
  nombre: string;

  @Column()
  fecha: Date;

  @ManyToOne(() => Documento, (entidad) => entidad.documentosDinamicos)
  documento: Documento;

  @ManyToOne(() => Plantilla, (entidad) => entidad.dinamicos)
  plantilla: Plantilla;

  @OneToMany(() => Fila, (entidad) => entidad.dinamico)
  filas: Fila[];
}
