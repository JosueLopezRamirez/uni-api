import { Role } from '../../roles/entities/role.entity';
import { Connection } from 'typeorm';
import { Factory, Seeder } from 'typeorm-seeding';
import { faker } from '@faker-js/faker';
import * as bcrypt from 'bcrypt';
import { v4 as uuidV4, v4 } from 'uuid';
import { Usuario } from '../../usuario/entities/usuario.entity';
import { Empresa } from '../../empresas/entities/empresa.entity';
import { Documento } from '../../documento/entities/documento.entity';
import { Estatico } from '../../estaticos/entities/estatico.entity';
import { ComprobanteDiario } from '../../comprobante-diario/entities/comprobante-diario.entity';
import { ComprobanteDiarioItem } from '../../comprobante-diario-item/entities/comprobante-diario-item.entity';
import { Factura } from '../../facturas/entities/factura.entity';
import { FacturaItem } from '../../factura-item/entities/factura-item.entity';

export class InitDbSeed implements Seeder {
    public async run(factory: Factory, connection: Connection): Promise<void> {
        await connection
            .createQueryBuilder()
            .insert()
            .into(Role)
            .values([
                { id: '9cf17f36-1924-4a19-a556-79b5c59f2d99', nombre: 'Administrador' },
                { id: '0c479969-1356-44cf-93b7-0adf9ff9332d', nombre: 'Usuario' },
            ])
            .execute();

        await connection
            .createQueryBuilder()
            .insert()
            .into(Usuario)
            .values([
                {
                    id: 'a14e0116-2132-403e-92f3-d6a01e1c6b5c',
                    nombre: 'Josue Lopez',
                    rolId: '9cf17f36-1924-4a19-a556-79b5c59f2d99',
                    correo: 'josue@gmail.com',
                    password: bcrypt.hashSync('123456', 10),
                    activo: true,
                },
                {
                    id: uuidV4(),
                    nombre: 'Fernanda',
                    rolId: '0c479969-1356-44cf-93b7-0adf9ff9332d',
                    correo: 'fernanda@gmail.com',
                    password: bcrypt.hashSync('fernanda123', 10),
                    activo: true,
                },
            ])
            .execute();

        for (const item of Array(10).fill('')) {
            const empresaId = v4();
            await connection
                .createQueryBuilder()
                .insert()
                .into(Empresa)
                .values({
                    id: empresaId,
                    nombre: faker.company.name(),
                    descripcion: faker.company.catchPhraseDescriptor(),
                    ruc: faker.random.numeric(13),
                    telefono: faker.phone.number(),
                })
                .execute();

            for (const item of Array(15).fill('')) {
                const comprobanteDiarioId = v4();
                const facturaId = v4();
                const documentoId = v4();
                const estaticoId = v4();

                await connection
                .createQueryBuilder()
                .insert()
                .into(Documento)
                .values({
                    empresaId,
                    id: documentoId,
                })
                .execute();

            await connection
                .createQueryBuilder()
                .insert()
                .into(Estatico)
                .values({
                    id: estaticoId,
                    documentoId,
                })
                .execute();

                await connection
                    .createQueryBuilder()
                    .insert()
                    .into(ComprobanteDiario)
                    .values({
                        estaticoId,
                        nombre: faker.finance.accountName(),
                        fecha: faker.date.past(),
                        id: comprobanteDiarioId,
                    })
                    .execute();

                await connection
                    .createQueryBuilder()
                    .insert()
                    .into(ComprobanteDiarioItem)
                    .values(
                        Array(45)
                            .fill('')
                            .map((item) => {
                                const amount = parseFloat(faker.finance.amount());

                                return {
                                    comprobanteDiarioId,
                                    numeroCuenta: faker.finance.account(),
                                    descripcion: faker.finance.transactionDescription(),
                                    debito: amount,
                                    parcial: amount
                                }
                            }),
                    )
                    .execute();

                await connection
                    .createQueryBuilder()
                    .insert()
                    .into(Factura)
                    .values({
                        estaticoId,
                        nombre: faker.finance.accountName(),
                        fecha: faker.date.past(),
                        id: facturaId,
                    })
                    .execute();

                await connection
                    .createQueryBuilder()
                    .insert()
                    .into(FacturaItem)
                    .values(
                        Array(45)
                            .fill('')
                            .map((item) => {
                                const amount = parseFloat(faker.finance.amount());
                                return {
                                    facturaId,
                                    numeroFactura: faker.finance.account(),
                                    descripcion: faker.finance.transactionDescription(),
                                    ventasExoneradas: amount,
                                    ventasExentas: amount,
                                    ventasGrabadas: amount
                                }
                            }),
                    )
                    .execute();
            }
        }

    }
}
