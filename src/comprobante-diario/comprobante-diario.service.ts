import { HttpException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ComprobanteDiarioItem } from 'src/comprobante-diario-item/entities/comprobante-diario-item.entity';
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

  async create(detalleComprobanteDiario: DetalleComprobanteDto) {
    const rows = detalleComprobanteDiario.comprobanteItems;
    // const actualizar = rows.filter((row) => !row.isNewRow);
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();
    try {
      const comprobanteCreado = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(ComprobanteDiario)
        .values(detalleComprobanteDiario.comprobante)
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
      let query = { id: update.id };
      delete update.id;
      return queryRunner.manager
        .getRepository(ComprobanteDiarioItem)
        .update({ id: update.id }, update);
    });
    await Promise.all(promises);
  }

  findAll() {
    return this.repository.find({
      relations: ['comprobanteDiarioItem'],
    });
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id, {
      relations: ['comprobanteDiarioItem'],
    });
  }

  update(id: string, updateComprobanteDiarioDto: UpdateComprobanteDiarioDto) {
    return this.repository.update(id, updateComprobanteDiarioDto);
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
