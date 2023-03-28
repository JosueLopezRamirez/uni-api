import { ComprobanteDiario } from '../../comprobante-diario/entities/comprobante-diario.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';

@Entity()
export class ComprobanteDiarioItem extends BaseEntity {
  @Column()
  numeroCuenta: string;

  @Column()
  descripcion: string;

  @Column({ nullable: true })
  parcial: number;

  @Column({ nullable: true })
  debito: number;

  @Column({ name: 'comprobanteDiarioId' })
  comprobanteDiarioId: string;

  @ManyToOne(
    () => ComprobanteDiario,
    (comprobanteDiario) => comprobanteDiario.comprobanteDiarioItem,
  )
  comprobanteDiario: ComprobanteDiario;
}
