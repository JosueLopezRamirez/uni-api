import { ComprobanteDiario } from 'src/comprobante-diario/entities/comprobante-diario.entity';
import { Usuario } from 'src/usuario/entities/usuario.entity';
import { BaseEntity } from 'src/utils/base.entity';
import { Entity, ManyToOne } from 'typeorm';

@Entity()
export class HistorialComprobanteDiario extends BaseEntity {
  @ManyToOne(() => ComprobanteDiario, (entidad) => entidad.historial)
  comprobanteDiario: ComprobanteDiario;

  @ManyToOne(() => Usuario, (entidad) => entidad.historial)
  usuario: Usuario;
}
