import { PartialType } from '@nestjs/mapped-types';
import { CreateFacturaItemDto } from './create-factura-item.dto';

export class UpdateFacturaItemDto extends PartialType(CreateFacturaItemDto) {}
