import { Factura } from 'src/facturas/entities/factura.entity';
import { Usuario } from 'src/usuario/entities/usuario.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';

@Entity()
export class HistorialFactura extends BaseEntity {
  @Column({ name: 'facturaId' })
  facturaId: string;

  @Column({ name: 'usuarioId' })
  usuarioId: string;

  @ManyToOne(() => Factura, (entidad) => entidad.historial)
  factura: Factura;

  @ManyToOne(() => Usuario, (entidad) => entidad.historial)
  usuario: Usuario;
}
