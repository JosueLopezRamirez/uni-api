import { ComprobanteDiario } from 'src/comprobante-diario/entities/comprobante-diario.entity';
import { Factura } from 'src/facturas/entities/factura.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, OneToMany } from 'typeorm';

@Entity()
export class Empresa extends BaseEntity {
  @Column()
  nombre: string;

  @Column()
  descripcion: string;

  @Column()
  ruc: string;

  @Column()
  telefono: string;

  @OneToMany(
    () => ComprobanteDiario,
    (comprobantesDiario) => comprobantesDiario.empresa,
  )
  comprobantesDiario: ComprobanteDiario[];

  @OneToMany(() => Factura, (factura) => factura.empresa)
  facturas: Factura[];
}
