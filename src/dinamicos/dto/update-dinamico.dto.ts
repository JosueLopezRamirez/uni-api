import { PartialType } from '@nestjs/mapped-types';
import { CreateDinamicoDto } from './create-dinamico.dto';

export class UpdateDinamicoDto extends PartialType(CreateDinamicoDto) {}
