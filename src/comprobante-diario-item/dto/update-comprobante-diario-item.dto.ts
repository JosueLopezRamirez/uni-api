import { PartialType } from '@nestjs/mapped-types';
import { CreateComprobanteDiarioItemDto } from './create-comprobante-diario-item.dto';

export class UpdateComprobanteDiarioItemDto extends PartialType(CreateComprobanteDiarioItemDto) {}
