import { HttpException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Documento } from 'src/documento/entities/documento.entity';
import { Estatico } from 'src/estaticos/entities/estatico.entity';
import { getConnection, Repository } from 'typeorm';
import { CreateDinamicoDto } from './dto/create-dinamico.dto';
import { UpdateDinamicoDto } from './dto/update-dinamico.dto';
import { Dinamico } from './entities/dinamico.entity';

@Injectable()
export class DinamicosService {
  constructor(
    @InjectRepository(Dinamico)
    private repository: Repository<Dinamico>,
  ) {}

  async create(createDinamicoDto: CreateDinamicoDto) {
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();
    try {
      const documentoCreado = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Documento)
        .values({ empresaId: createDinamicoDto.empresaId })
        .execute();
      delete createDinamicoDto.empresaId;
      const dinamico = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Dinamico)
        .values({
          documentoId: documentoCreado.identifiers[0].id,
          ...createDinamicoDto,
        })
        .execute();
      await queryRunner.commitTransaction();
      return { id: dinamico.identifiers[0].id };
    } catch {
      await queryRunner.rollbackTransaction();
      throw new HttpException('Error al salvar el documento', 404);
    } finally {
      await queryRunner.release();
    }
  }

  findAll() {
    return this.repository.find({
      relations: ['documento', 'documento.empresa', 'plantilla'],
    });
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id, {
      relations: ['documento', 'documento.empresa'],
    });
  }

  async update(id: string, updateDinamicoDto: UpdateDinamicoDto) {
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();
    try {
      await queryRunner.manager
        .createQueryBuilder()
        .update(Dinamico)
        .set({
          nombre: updateDinamicoDto.nombre,
          fecha: updateDinamicoDto.fecha,
          // columnas: updateDinamicoDto.columnas,
        })
        .where('id = :id', { id })
        .execute();
      await queryRunner.commitTransaction();
      return { id };
    } catch {
      await queryRunner.rollbackTransaction();
      throw new HttpException('Error al salvar el documento', 404);
    } finally {
      await queryRunner.release();
    }
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
