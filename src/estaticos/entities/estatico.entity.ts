import { ComprobanteDiario } from 'src/comprobante-diario/entities/comprobante-diario.entity';
import { Documento } from 'src/documento/entities/documento.entity';
import { Factura } from 'src/facturas/entities/factura.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';

@Entity()
export class Estatico extends BaseEntity {
  @OneToMany(
    () => ComprobanteDiario,
    (comprobantesDiario) => comprobantesDiario.estatico,
  )
  comprobantesDiario: ComprobanteDiario[];

  @OneToMany(() => Factura, (factura) => factura.estatico)
  facturas: Factura[];

  @Column({ name: 'documentoId' })
  documentoId: string;

  @ManyToOne(() => Documento, (entidad) => entidad.documentosEstaticos)
  documento: Documento;
}
