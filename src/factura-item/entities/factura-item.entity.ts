import { Factura } from 'src/facturas/entities/factura.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';

@Entity()
export class FacturaItem extends BaseEntity {
  @Column()
  fecha: Date;

  @Column()
  numeroFactura: string;

  @Column()
  descripcion: string;

  @Column()
  ventasExoneradas: number;

  @Column()
  ventasExentas: number;

  @Column()
  ventasGrabadas: number;

  @ManyToOne(() => Factura, (Factura) => Factura.facturasItems)
  factura: Factura;
}
