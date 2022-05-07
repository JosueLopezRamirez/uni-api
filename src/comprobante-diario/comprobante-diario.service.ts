import { HttpException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ComprobanteDiarioItem } from 'src/comprobante-diario-item/entities/comprobante-diario-item.entity';
import { Documento } from 'src/documento/entities/documento.entity';
import { Estatico } from 'src/estaticos/entities/estatico.entity';
import { HistorialComprobanteDiario } from 'src/historial-comprobante-diario/entities/historial-comprobante-diario.entity';
import { getConnection, Repository } from 'typeorm';
import { DetalleComprobanteDto } from './dto/create-comprobante-diario.dto';
import { UpdateComprobanteDiarioDto } from './dto/update-comprobante-diario.dto';
import { ComprobanteDiario } from './entities/comprobante-diario.entity';

@Injectable()
export class ComprobanteDiarioService {
  constructor(
    @InjectRepository(ComprobanteDiario)
    private repository: Repository<ComprobanteDiario>,
  ) {}

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
      const nuevas = rows
        .filter((row) => row.isNewRow)
        .map((row) => ({
          ...row,
          comprobanteDiarioId: comprobanteCreado.identifiers[0].id,
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
          comprobanteDiarioId: comprobanteCreado.identifiers[0].id,
          usuarioId: usuarioId,
        })
        .execute();
      await queryRunner.commitTransaction();
      return { id: comprobanteCreado.identifiers[0].id };
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

  findAll() {
    const connection = getConnection();
    return connection
      .getRepository(ComprobanteDiario)
      .createQueryBuilder('comprobanteDiario')
      .innerJoinAndSelect('comprobanteDiario.estatico', 'estatico')
      .innerJoinAndSelect('estatico.documento', 'documento')
      .innerJoinAndSelect('documento.empresa', 'empresa')
      .getMany();
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id, {
      relations: ['comprobanteDiarioItem'],
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
      await queryRunner.manager
        .createQueryBuilder()
        .update(ComprobanteDiario)
        .set({
          fecha: detalleComprobanteDiario.comprobante.fecha,
          nombre: detalleComprobanteDiario.comprobante.nombre,
        })
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
