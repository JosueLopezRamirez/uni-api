import { Factura } from '../../facturas/entities/factura.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';

@Entity()
export class FacturaItem extends BaseEntity {

  @Column()
  numeroFactura: string;

  @Column()
  descripcion: string;

  @Column({ nullable: true })
  ventasExoneradas: number;

  @Column({ nullable: true })
  ventasExentas: number;

  @Column({ nullable: true })
  ventasGrabadas: number;

  @Column({ name: 'facturaId' })
  facturaId: string;

  @ManyToOne(() => Factura, (Factura) => Factura.facturasItems)
  factura: Factura;
}
