import { Documento } from 'src/documento/entities/documento.entity';
import { Fila } from 'src/filas/entities/fila.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';

@Entity()
export class Dinamico extends BaseEntity {
  @Column({ name: 'documentoId' })
  documentoId: string;

  @Column()
  nombre: string;

  @Column()
  fecha: Date;

  @Column()
  columnas: string;

  @ManyToOne(() => Documento, (entidad) => entidad.documentosDinamicos)
  documento: Documento;

  @OneToMany(() => Fila, (entidad) => entidad.dinamico)
  filas: Fila[];
}
