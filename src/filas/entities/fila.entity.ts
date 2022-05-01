import { Dinamico } from 'src/dinamicos/entities/dinamico.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';

@Entity()
export class Fila extends BaseEntity {
  @Column()
  valor: string;

  @ManyToOne(() => Dinamico, (entidad) => entidad.filas)
  dinamico: Dinamico;
}
