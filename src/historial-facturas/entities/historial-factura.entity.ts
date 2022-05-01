import { Factura } from 'src/facturas/entities/factura.entity';
import { Usuario } from 'src/usuario/entities/usuario.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Entity, ManyToOne } from 'typeorm';

@Entity()
export class HistorialFactura extends BaseEntity {
  @ManyToOne(() => Factura, (entidad) => entidad.historial)
  factura: Factura;

  @ManyToOne(() => Usuario, (entidad) => entidad.historial)
  usuario: Usuario;
}
