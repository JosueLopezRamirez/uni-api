import { PartialType } from '@nestjs/mapped-types';
import { CreateEstaticoDto } from './create-estatico.dto';

export class UpdateEstaticoDto extends PartialType(CreateEstaticoDto) {}
