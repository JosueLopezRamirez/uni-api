import { ComprobanteDiario } from 'src/comprobante-diario/entities/comprobante-diario.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';

@Entity()
export class ComprobanteDiarioItem extends BaseEntity {
  @Column()
  numeroCuenta: string;

  @Column()
  descripcion: string;

  @Column()
  parcial: number;

  @Column()
  debito: number;

  @Column()
  haber: number;

  @Column({ name: 'comprobanteDiarioId' })
  comprobanteDiarioId: string;

  @ManyToOne(
    () => ComprobanteDiario,
    (comprobanteDiario) => comprobanteDiario.comprobanteDiarioItem,
  )
  comprobanteDiario: ComprobanteDiario;
}
