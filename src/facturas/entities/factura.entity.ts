import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';
import { BaseEntity } from '../../utils/base.entity';
import { FacturaItem } from '../../factura-item/entities/factura-item.entity';
import { Estatico } from '../../estaticos/entities/estatico.entity';
import { HistorialFactura } from '../../historial-facturas/entities/historial-factura.entity';

@Entity()
export class Factura extends BaseEntity {
  @Column()
  fecha: Date;

  @Column()
  nombre: string;

  @Column({ name: 'estaticoId' })
  estaticoId: string;

  @ManyToOne(() => Estatico, (entidad) => entidad.facturas)
  estatico: Estatico;

  @OneToMany(() => FacturaItem, (facturaItem) => facturaItem.factura)
  facturasItems: FacturaItem[];

  @OneToMany(() => HistorialFactura, (entidad) => entidad.factura)
  historial: HistorialFactura[];
}
