import { Dinamico } from 'src/dinamicos/entities/dinamico.entity';
import { Empresa } from 'src/empresas/entities/empresa.entity';
import { Estatico } from 'src/estaticos/entities/estatico.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Entity, ManyToOne, OneToMany } from 'typeorm';

@Entity()
export class Documento extends BaseEntity {
  @ManyToOne(() => Empresa, (entidad) => entidad.documentos)
  empresa: Empresa;

  @OneToMany(() => Estatico, (entidad) => entidad.documento)
  documentosEstaticos: Estatico[];

  @OneToMany(() => Dinamico, (entidad) => entidad.documento)
  documentosDinamicos: Dinamico[];
}
