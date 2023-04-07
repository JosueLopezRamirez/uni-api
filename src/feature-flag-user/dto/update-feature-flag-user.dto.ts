import { PartialType } from '@nestjs/mapped-types';
import { CreateFeatureFlagUserDto } from './create-feature-flag-user.dto';

export class UpdateFeatureFlagUserDto extends PartialType(CreateFeatureFlagUserDto) {}
