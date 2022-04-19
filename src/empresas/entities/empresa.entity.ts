import { ComprobanteDiario } from 'src/comprobante-diario/entities/comprobante-diario.entity';
import { Factura } from 'src/facturas/entities/factura.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, OneToMany } from 'typeorm';

@Entity()
export class Empresa extends BaseEntity {
  @Column()
  nombre: string;

  @Column({ nullable: true })
  descripcion: string;

  @Column({ unique: true })
  ruc: string;

  @Column({ unique: true })
  telefono: string;

  @OneToMany(
    () => ComprobanteDiario,
    (comprobantesDiario) => comprobantesDiario.empresa,
  )
  comprobantesDiario: ComprobanteDiario[];

  @OneToMany(() => Factura, (factura) => factura.empresa)
  facturas: Factura[];
}
