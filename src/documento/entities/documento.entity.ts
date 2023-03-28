import { Dinamico } from '../../dinamicos/entities/dinamico.entity';
import { Empresa } from '../../empresas/entities/empresa.entity';
import { Estatico } from '../../estaticos/entities/estatico.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';

@Entity()
export class Documento extends BaseEntity {
  @Column({ name: 'empresaId' })
  empresaId: string;

  @ManyToOne(() => Empresa, (entidad) => entidad.documentos)
  empresa: Empresa;

  @OneToMany(() => Estatico, (entidad) => entidad.documento)
  documentosEstaticos: Estatico[];

  @OneToMany(() => Dinamico, (entidad) => entidad.documento)
  documentosDinamicos: Dinamico[];
}
