import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';
import { BaseEntity } from 'src/utils/base.entity';
import { Empresa } from 'src/empresas/entities/empresa.entity';
import { FacturaItem } from 'src/factura-item/entities/factura-item.entity';

@Entity()
export class Factura extends BaseEntity {
  @Column()
  fecha: Date;

  @Column({ name: 'empresaId' })
  empresaId: string;

  @ManyToOne(() => Empresa, (empresa) => empresa.facturas)
  empresa: Empresa;

  @OneToMany(() => FacturaItem, (facturaItem) => facturaItem.factura)
  facturasItems: FacturaItem[];
}
