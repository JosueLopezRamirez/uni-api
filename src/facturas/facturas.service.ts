import { HttpException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DetalleFacturaDto } from './dto/create-factura.dto';
import { Factura } from './entities/factura.entity';
import { getConnection, Repository } from 'typeorm';
import { Documento } from '../documento/entities/documento.entity';
import { Estatico } from '../estaticos/entities/estatico.entity';
import { FacturaItem } from '../factura-item/entities/factura-item.entity';
import { HistorialFactura } from '../historial-facturas/entities/historial-factura.entity';
import * as handlebars from "handlebars";
import fs from "fs";
import { join } from 'path';
import day from "dayjs";

@Injectable()
export class FacturasService {
  constructor(
    @InjectRepository(Factura)
    private repository: Repository<Factura>,
  ) { }

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

  async findAll(skip = 1, take = 10, empresa = null, text = "") {
    const connection = getConnection();
    let query = connection
      .getRepository(Factura)
      .createQueryBuilder('factura')
      .innerJoinAndSelect('factura.estatico', 'estatico')
      .innerJoinAndSelect('estatico.documento', 'documento')
      .innerJoinAndSelect('documento.empresa', 'empresa')

    if (empresa) {
      query.where('empresa.id = :id', { id: empresa })
    }
    if (text) {
      query.orWhere("factura.nombre like :text", { text: `%${text}%` })
      query.orWhere("empresa.nombre like :text", { text: `%${text}%` })
    }
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
      relations: ['facturasItems', 'estatico', 'estatico.documento', 'estatico.documento.empresa'],
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

  async generateReport(id: string) {

    const data = await this.findOne(id);

    const items = data.facturasItems.map((item => {
      const ventas = item.ventasExentas + item.ventasExoneradas + item.ventasGrabadas;
      const iva = item.ventasGrabadas * 0.15;
      const total = ventas + iva;
      return {
        numeroFactura: item.numeroFactura,
        descripcion: item.descripcion,
        // ventasExentas: item.ventasExentas,
        // ventasExoneradas: item.ventasExoneradas,
        // ventasGrabadas: item.ventasGrabadas,
        ventas: ventas.toFixed(2),
        iva: iva.toFixed(2),
        total: total.toFixed(2),
      }
    }));

    // Define the invoice data
    const invoiceData = {
      // comprobanteDiario: data.nombre,
      invoiceDate: day(data.createdAt).format("MM/DD/YYYY"),
      customerName: data.estatico.documento.empresa.nombre,
      customerRuc: data.estatico.documento.empresa.ruc,
      customerPhone: data.estatico.documento.empresa.telefono,
      items: [...items],
    };

    // Read the Handlebars template file
    const templateFile = fs.readFileSync(join(process.cwd(), './templates/facturas.hbs'), 'utf-8');

    // Compile the Handlebars template
    const template = handlebars.compile(templateFile);

    // Render the template with the data
    return template(invoiceData);
  }
}
