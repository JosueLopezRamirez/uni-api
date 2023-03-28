import { ComprobanteDiario } from '../../comprobante-diario/entities/comprobante-diario.entity';
import { Usuario } from '../../usuario/entities/usuario.entity';
import { BaseEntity } from '../../utils/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';

@Entity()
export class HistorialComprobanteDiario extends BaseEntity {
  @Column({ name: 'comprobanteDiarioId' })
  comprobanteDiarioId: string;

  @Column({ name: 'usuarioId' })
  usuarioId: string;

  @ManyToOne(() => ComprobanteDiario, (entidad) => entidad.historial)
  comprobanteDiario: ComprobanteDiario;

  @ManyToOne(() => Usuario, (entidad) => entidad.historial)
  usuario: Usuario;
}
