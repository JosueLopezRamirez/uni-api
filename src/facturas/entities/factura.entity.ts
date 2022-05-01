import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';
import { BaseEntity } from 'src/utils/base.entity';
import { FacturaItem } from 'src/factura-item/entities/factura-item.entity';
import { Estatico } from 'src/estaticos/entities/estatico.entity';
import { HistorialFactura } from 'src/historial-facturas/entities/historial-factura.entity';

@Entity()
export class Factura extends BaseEntity {
  @Column()
  fecha: Date;

  @Column({ name: 'empresaId' })
  empresaId: string;

  @ManyToOne(() => Estatico, (entidad) => entidad.facturas)
  estatico: Estatico;

  @OneToMany(() => FacturaItem, (facturaItem) => facturaItem.factura)
  facturasItems: FacturaItem[];

  @OneToMany(() => HistorialFactura, (entidad) => entidad.factura)
  historial: HistorialFactura[];
}
