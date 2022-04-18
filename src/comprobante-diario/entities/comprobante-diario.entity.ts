import { ComprobanteDiarioItem } from 'src/comprobante-diario-item/entities/comprobante-diario-item.entity';
import { Empresa } from 'src/empresas/entities/empresa.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';

@Entity()
export class ComprobanteDiario extends BaseEntity {
  @Column({ name: 'empresaId' })
  empresaId: string;

  @ManyToOne(() => Empresa, (empresa) => empresa.comprobantesDiario)
  empresa: Empresa;

  @OneToMany(
    () => ComprobanteDiarioItem,
    (comprobanteDiarioItem) => comprobanteDiarioItem.comprobanteDiario,
  )
  comprobanteDiarioItem: ComprobanteDiarioItem[];
}
