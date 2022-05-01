import { PartialType } from '@nestjs/mapped-types';
import { CreateHistorialFacturaDto } from './create-historial-factura.dto';

export class UpdateHistorialFacturaDto extends PartialType(CreateHistorialFacturaDto) {}
