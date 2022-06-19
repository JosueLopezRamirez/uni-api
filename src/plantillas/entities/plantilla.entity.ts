import { Dinamico } from 'src/dinamicos/entities/dinamico.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, OneToMany } from 'typeorm';

@Entity()
export class Plantilla extends BaseEntity {
  @Column()
  nombre: string;

  @Column({ type: 'text' })
  columnas: string;

  @OneToMany(() => Dinamico, (entidad) => entidad.plantilla)
  dinamicos: Dinamico[];
}