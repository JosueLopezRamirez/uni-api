import { PartialType } from '@nestjs/mapped-types';
import { CreateHistorialComprobanteDiarioDto } from './create-historial-comprobante-diario.dto';

export class UpdateHistorialComprobanteDiarioDto extends PartialType(CreateHistorialComprobanteDiarioDto) {}
