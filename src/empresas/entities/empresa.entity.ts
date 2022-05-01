import { ComprobanteDiario } from 'src/comprobante-diario/entities/comprobante-diario.entity';
import { Documento } from 'src/documento/entities/documento.entity';
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

  @OneToMany(() => Documento, (entidad) => entidad.empresa)
  documentos: Documento[];
}
