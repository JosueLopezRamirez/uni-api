import { HttpException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Documento } from '../documento/entities/documento.entity';
import { Fila } from '../filas/entities/fila.entity';
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
    const { empresaId, filas, ...rest } = createDinamicoDto;
    try {
      const documentoCreado = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Documento)
        .values({ empresaId: empresaId })
        .execute();

      const dinamico = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Dinamico)
        .values({
          documentoId: documentoCreado.identifiers[0].id,
          ...rest,
        })
        .execute();

      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Fila)
        .values(
          filas.map((item) => ({
            valor: JSON.stringify(item),
            dinamicoId: dinamico.identifiers[0].id,
          })),
        )
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
      relations: ['documento', 'documento.empresa', 'plantilla', 'filas'],
    });
  }

  async update(id: string, updateDinamicoDto: UpdateDinamicoDto) {
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();

    const nuevas = updateDinamicoDto.filas
      .filter((row) => row.isNewRow)
      .map((row) => ({
        ...row,
        dinamicoId: id,
      }));

    const viejas = updateDinamicoDto.filas
      .filter((row) => !row.isNewRow)
      .map((row) => ({
        ...row,
        dinamicoId: id,
      }));
    try {
      await queryRunner.manager
        .createQueryBuilder()
        .update(Dinamico)
        .set({
          nombre: updateDinamicoDto.nombre,
          fecha: updateDinamicoDto.fecha,
        })
        .where('id = :id', { id })
        .execute();

      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Fila)
        .values(
          nuevas.map((item) => ({
            valor: JSON.stringify(item),
            dinamicoId: id,
          })),
        )
        .execute();
      await this.bulkUpdate(viejas);
      await queryRunner.commitTransaction();
      return { id };
    } catch {
      await queryRunner.rollbackTransaction();
      throw new HttpException('Error al salvar el documento', 404);
    } finally {
      await queryRunner.release();
    }
  }

  async bulkUpdate(actualizar: any[]) {
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    let promises = actualizar.map((update) => {
      const param = { id: update.id };
      delete update.id;
      return queryRunner.manager
        .getRepository(Fila)
        .update(param, { valor: JSON.stringify(update) });
    });
    await Promise.all(promises);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
