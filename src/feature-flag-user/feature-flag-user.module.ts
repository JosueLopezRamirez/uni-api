import { Module } from '@nestjs/common';
import { FeatureFlagUserService } from './feature-flag-user.service';
import { FeatureFlagUserController } from './feature-flag-user.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { FeatureFlagUser } from './entities/feature-flag-user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([FeatureFlagUser])],
  controllers: [FeatureFlagUserController],
  providers: [FeatureFlagUserService]
})
export class FeatureFlagUserModule {}
