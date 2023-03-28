import { Dinamico } from '../../dinamicos/entities/dinamico.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';

@Entity()
export class Fila extends BaseEntity {
  @Column({ type: 'text' })
  valor: string;

  @Column({ name: 'dinamicoId' })
  dinamicoId: string;

  @ManyToOne(() => Dinamico, (entidad) => entidad.filas)
  dinamico: Dinamico;
}
