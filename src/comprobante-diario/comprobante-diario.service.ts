import { HttpException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ComprobanteDiarioItem } from '../comprobante-diario-item/entities/comprobante-diario-item.entity';
import { Documento } from '../documento/entities/documento.entity';
import { Estatico } from '../estaticos/entities/estatico.entity';
import { HistorialComprobanteDiario } from '../historial-comprobante-diario/entities/historial-comprobante-diario.entity';
import { getConnection, Repository } from 'typeorm';
import { DetalleComprobanteDto } from './dto/create-comprobante-diario.dto';
import { ComprobanteDiario } from './entities/comprobante-diario.entity';

@Injectable()
export class ComprobanteDiarioService {
  constructor(
    @InjectRepository(ComprobanteDiario)
    private repository: Repository<ComprobanteDiario>,
  ) { }

  async create(
    detalleComprobanteDiario: DetalleComprobanteDto,
    usuarioId: string,
  ) {
    const rows = detalleComprobanteDiario.comprobanteItems;
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();
    try {
      const documentoCreado = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Documento)
        .values({ empresaId: detalleComprobanteDiario.comprobante.empresaId })
        .execute();
      const estatico = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Estatico)
        .values({ documentoId: documentoCreado.identifiers[0].id })
        .execute();
      //
      const comprobanteCreado = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(ComprobanteDiario)
        .values({
          fecha: detalleComprobanteDiario.comprobante.fecha,
          nombre: detalleComprobanteDiario.comprobante.nombre,
          estaticoId: estatico.identifiers[0].id,
        })
        .execute();

      const comprobanteId = comprobanteCreado.identifiers[0].id;

      const nuevas = rows
        .filter((row) => row.isNewRow)
        .map((row) => ({
          ...row,
          comprobanteDiarioId: comprobanteId,
        }));
      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(ComprobanteDiarioItem)
        .values(nuevas)
        .execute();

      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(HistorialComprobanteDiario)
        .values({
          comprobanteDiarioId: comprobanteId,
          usuarioId: usuarioId,
        })
        .execute();
      await queryRunner.commitTransaction();
      return { id: comprobanteId };
    } catch (err) {
      console.log('err', err);
      await queryRunner.rollbackTransaction();
      throw new HttpException('Error al salvar el comprobante de diario', 404);
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
        .getRepository(ComprobanteDiarioItem)
        .update(param, update);
    });
    await Promise.all(promises);
  }

  async findAll(skip = 1, take = 10) {
    const connection = getConnection();
    let query = connection
      .getRepository(ComprobanteDiario)
      .createQueryBuilder('comprobanteDiario')
      .innerJoinAndSelect('comprobanteDiario.estatico', 'estatico')
      .innerJoinAndSelect('estatico.documento', 'documento')
      .innerJoinAndSelect('documento.empresa', 'empresa')
    if (take) {
      query.take(take)
    }

    if (skip) {
      query.skip((skip - 1) * take)
    }
    const [result, count] = await query.getManyAndCount();
    return { data: result, count }
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id, {
      relations: [
        'comprobanteDiarioItem',
        'estatico',
        'estatico.documento',
        'estatico.documento.empresa',
      ],
    });
  }

  async update(
    id: string,
    detalleComprobanteDiario: DetalleComprobanteDto,
    usuarioId: string,
  ) {
    const rows = detalleComprobanteDiario.comprobanteItems;
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();
    try {
      const documento = await this.findOne(id);
      await queryRunner.manager
        .createQueryBuilder()
        .update(ComprobanteDiario)
        .set({
          fecha: detalleComprobanteDiario.comprobante.fecha,
          nombre: detalleComprobanteDiario.comprobante.nombre,
        })
        .where('id = :id', { id })
        .execute();

      await queryRunner.manager
        .createQueryBuilder()
        .update(Documento)
        .set({
          empresaId: detalleComprobanteDiario.comprobante.empresaId,
        })
        .where('id = :id', { id: documento.estatico.documentoId })
        .execute();

      const nuevas = rows
        .filter((row) => row.isNewRow)
        .map((row) => ({
          ...row,
          comprobanteDiarioId: id,
        }));
      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(ComprobanteDiarioItem)
        .values(nuevas)
        .execute();

      const actualizar = rows
        .filter((row) => !row.isNewRow)
        .map((row) => ({
          ...row,
          comprobanteDiarioId: id,
        }));
      await this.bulkUpdate(actualizar);

      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(HistorialComprobanteDiario)
        .values({
          comprobanteDiarioId: id,
          usuarioId: usuarioId,
        })
        .execute();
      await queryRunner.commitTransaction();
      return { id };
    } catch (err) {
      console.log('err', err);
      await queryRunner.rollbackTransaction();
      throw new HttpException(
        'Error al actualizar el comprobante de diario',
        404,
      );
    } finally {
      await queryRunner.release();
    }
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
