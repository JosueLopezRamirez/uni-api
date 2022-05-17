import { HttpException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DetalleFacturaDto } from './dto/create-factura.dto';
import { Factura } from './entities/factura.entity';
import { getConnection, Repository } from 'typeorm';
import { Documento } from 'src/documento/entities/documento.entity';
import { Estatico } from 'src/estaticos/entities/estatico.entity';
import { FacturaItem } from 'src/factura-item/entities/factura-item.entity';
import { HistorialFactura } from 'src/historial-facturas/entities/historial-factura.entity';

@Injectable()
export class FacturasService {
  constructor(
    @InjectRepository(Factura)
    private repository: Repository<Factura>,
  ) {}

  async create(detalleFactura: DetalleFacturaDto, usuarioId: string) {
    const rows = detalleFactura.facturaItems;
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();
    try {
      const documentoCreado = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Documento)
        .values({ empresaId: detalleFactura.factura.empresaId })
        .execute();
      const estatico = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Estatico)
        .values({ documentoId: documentoCreado.identifiers[0].id })
        .execute();
      //
      const facturaCreado = await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(Factura)
        .values({
          fecha: detalleFactura.factura.fecha,
          nombre: detalleFactura.factura.nombre,
          estaticoId: estatico.identifiers[0].id,
        })
        .execute();

      console.log({ identifiers: facturaCreado.identifiers });

      const nuevas = rows
        .filter((row) => row.isNewRow)
        .map((row) => ({
          ...row,
          facturaId: facturaCreado.identifiers[0].id,
        }));
      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(FacturaItem)
        .values(nuevas)
        .execute();

      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(HistorialFactura)
        .values({
          facturaId: facturaCreado.identifiers[0].id,
          usuarioId: usuarioId,
        })
        .execute();
      await queryRunner.commitTransaction();
      return { id: facturaCreado.identifiers[0].id };
    } catch (err) {
      console.log('err', err);
      await queryRunner.rollbackTransaction();
      throw new HttpException('Error al salvar el detalle de factura', 404);
    } finally {
      await queryRunner.release();
    }
  }

  findAll() {
    const connection = getConnection();
    return connection
      .getRepository(Factura)
      .createQueryBuilder('factura')
      .innerJoinAndSelect('factura.estatico', 'estatico')
      .innerJoinAndSelect('estatico.documento', 'documento')
      .innerJoinAndSelect('documento.empresa', 'empresa')
      .getMany();
  }

  findOne(id: string) {
    return this.repository.findOneOrFail(id, {
      relations: ['facturasItems', 'estatico', 'estatico.documento'],
    });
  }

  async bulkUpdate(actualizar: any[]) {
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    let promises = actualizar.map((update) => {
      const param = { id: update.id };
      delete update.id;
      return queryRunner.manager
        .getRepository(FacturaItem)
        .update(param, update);
    });
    await Promise.all(promises);
  }

  async update(
    id: string,
    detalleFactura: DetalleFacturaDto,
    usuarioId: string,
  ) {
    const rows = detalleFactura.facturaItems;
    const connection = getConnection();
    const queryRunner = connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction();

    const nuevas = rows
      .filter((row) => row.isNewRow)
      .map((row) => ({
        ...row,
        facturaId: id,
      }));

    try {
      await queryRunner.manager
        .createQueryBuilder()
        .update(Factura)
        .set({
          fecha: detalleFactura.factura.fecha,
          nombre: detalleFactura.factura.nombre,
        })
        .where('id = :id', { id })
        .execute();

      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(FacturaItem)
        .values(nuevas)
        .execute();

      const actualizar = rows
        .filter((row) => !row.isNewRow)
        .map((row) => ({
          ...row,
          facturaId: id,
        }));
      await this.bulkUpdate(actualizar);

      await queryRunner.manager
        .createQueryBuilder()
        .insert()
        .into(HistorialFactura)
        .values({
          facturaId: id,
          usuarioId: usuarioId,
        })
        .execute();
      await queryRunner.commitTransaction();
      return { id };
    } catch (err) {
      console.log('err', err);
      await queryRunner.rollbackTransaction();
      throw new HttpException('Error al actualizar la factura', 404);
    } finally {
      await queryRunner.release();
    }
  }

  remove(id: string) {
    return this.repository.softDelete(id);
  }
}
