import { ComprobanteDiarioItem } from '../../comprobante-diario-item/entities/comprobante-diario-item.entity';
import { Estatico } from '../../estaticos/entities/estatico.entity';
import { HistorialComprobanteDiario } from '../../historial-comprobante-diario/entities/historial-comprobante-diario.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';

@Entity()
export class ComprobanteDiario extends BaseEntity {
  @Column({ nullable: true })
  nombre: string;

  @Column()
  fecha: Date;

  @Column({ name: 'estaticoId' })
  estaticoId: string;

  @ManyToOne(() => Estatico, (entidad) => entidad.comprobantesDiario)
  estatico: Estatico;

  @OneToMany(
    () => HistorialComprobanteDiario,
    (entidad) => entidad.comprobanteDiario,
  )
  historial: HistorialComprobanteDiario[];

  @OneToMany(
    () => ComprobanteDiarioItem,
    (comprobanteDiarioItem) => comprobanteDiarioItem.comprobanteDiario,
  )
  comprobanteDiarioItem: ComprobanteDiarioItem[];
}
