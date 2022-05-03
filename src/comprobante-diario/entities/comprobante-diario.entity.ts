import { ComprobanteDiarioItem } from 'src/comprobante-diario-item/entities/comprobante-diario-item.entity';
import { Empresa } from 'src/empresas/entities/empresa.entity';
import { Estatico } from 'src/estaticos/entities/estatico.entity';
import { HistorialComprobanteDiario } from 'src/historial-comprobante-diario/entities/historial-comprobante-diario.entity';
import { BaseEntity } from 'src/utils/base.entity';
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
