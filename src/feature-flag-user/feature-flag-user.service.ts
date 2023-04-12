import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { BulkFeatureUserDto, CreateFeatureFlagUserDto } from './dto/create-feature-flag-user.dto';
import { UpdateFeatureFlagUserDto } from './dto/update-feature-flag-user.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, getConnection } from 'typeorm';
import { FeatureFlagUser } from './entities/feature-flag-user.entity';
import { v4 } from 'uuid';

@Injectable()
export class FeatureFlagUserService {

  constructor(
    @InjectRepository(FeatureFlagUser)
    private repository: Repository<FeatureFlagUser>,
  ) { }

  create(createFeatureFlagUserDto: CreateFeatureFlagUserDto) {
    return this.repository.save(createFeatureFlagUserDto);
  }

  findAll() {
    return this.repository.find();
  }

  async bulkCreate(bulkFeatureUserDto: BulkFeatureUserDto) {
    const { usuarioId, featureFlagIds } = bulkFeatureUserDto;
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();
    try {
      const builder = queryRunner.manager.createQueryBuilder();
      await builder.delete().from(FeatureFlagUser).where("usuarioId = :usuarioId", { usuarioId }).execute();

      const features = featureFlagIds.map(item => ({ id: v4(), usuarioId, featureFlagId: item }));
      await builder.insert().into(FeatureFlagUser).values(features).execute();

      await queryRunner.commitTransaction();
      return { message: "success" };
    } catch (error) {
      await queryRunner.rollbackTransaction();
      throw new HttpException('Error al agregar features al usuario', HttpStatus.UNPROCESSABLE_ENTITY);
    } finally {
      await queryRunner.release();
    }
  }

  findOne(id: string) {
    return this.repository.find({ where: { usuarioId: id } });
  }

  update(id: string, updateFeatureFlagUserDto: UpdateFeatureFlagUserDto) {
    return this.repository.update(id, updateFeatureFlagUserDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
