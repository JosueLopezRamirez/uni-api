import { ComprobanteDiario } from 'src/comprobante-diario/entities/comprobante-diario.entity';
import { Usuario } from 'src/usuario/entities/usuario.entity';
import { BaseEntity } from 'src/utils/base.entity';
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
