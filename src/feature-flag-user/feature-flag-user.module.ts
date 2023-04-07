import { Module } from '@nestjs/common';
import { FeatureFlagUserService } from './feature-flag-user.service';
import { FeatureFlagUserController } from './feature-flag-user.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { FeatureFlag } from '../feature-flag/entities/feature-flag.entity';

@Module({
  imports: [TypeOrmModule.forFeature([FeatureFlag])],
  controllers: [FeatureFlagUserController],
  providers: [FeatureFlagUserService]
})
export class FeatureFlagUserModule {}
