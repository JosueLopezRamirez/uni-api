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
import { FeatureFlag } from '../../feature-flag/entities/feature-flag.entity';
import { FeatureFlagUser } from '../../feature-flag-user/entities/feature-flag-user.entity';

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
                    id: "915e2e99-7c70-4761-a407-75f4e733195f",
                    nombre: 'Fernanda',
                    rolId: '0c479969-1356-44cf-93b7-0adf9ff9332d',
                    correo: 'fernanda@gmail.com',
                    password: bcrypt.hashSync('123456', 10),
                    activo: true,
                },
                {
                    id: "713debe4-737a-457d-b06c-d88dcdd505d5",
                    nombre: 'Luis',
                    rolId: '0c479969-1356-44cf-93b7-0adf9ff9332d',
                    correo: 'luis@gmail.com',
                    password: bcrypt.hashSync('123456', 10),
                    activo: true,
                },
            ])
            .execute();

        await connection
            .createQueryBuilder()
            .insert()
            .into(FeatureFlag)
            .values([
                { id: "ec968710-290f-4054-b31b-dc3478a8ec56", name: "Modulo clientes" },
                { id: "5881dd7e-870a-4078-9699-869f05c7e153", name: "Visualizar clientes" },
                { id: "403488fe-2ab4-4781-bbfc-2829cc019811", name: "Crear clientes" },
                { id: "15982359-8228-4328-a483-5f61727f32bc", name: "Editar clientes" },
                { id: "f5cf4a65-8244-440b-82f6-daf7d7ffa816", name: "Borrar clientes" },
                { id: "4678f211-508c-4731-8da6-10f3acca120d", name: "Historial clientes" },

                { id: uuidV4(), name: "Modulo comprobantes" },
                { id: uuidV4(), name: "Visualizar comprobantes" },
                { id: uuidV4(), name: "Crear comprobantes" },
                { id: uuidV4(), name: "Editar comprobantes" },
                { id: uuidV4(), name: "Borrar comprobantes" },
                { id: uuidV4(), name: "Historial comprobantes" },

                { id: uuidV4(), name: "Modulo facturas" },
                { id: uuidV4(), name: "Visualizar facturas" },
                { id: uuidV4(), name: "Crear facturas" },
                { id: uuidV4(), name: "Editar facturas" },
                { id: uuidV4(), name: "Borrar facturas" },
                { id: uuidV4(), name: "Historial facturas" },
            ])
            .execute();

        await connection
            .createQueryBuilder()
            .insert()
            .into(FeatureFlagUser)
            .values([
                { featureFlagId: "ec968710-290f-4054-b31b-dc3478a8ec56", usuarioId: "915e2e99-7c70-4761-a407-75f4e733195f" },
                { featureFlagId: "403488fe-2ab4-4781-bbfc-2829cc019811", usuarioId: "915e2e99-7c70-4761-a407-75f4e733195f" },
                { featureFlagId: "ec968710-290f-4054-b31b-dc3478a8ec56", usuarioId: "713debe4-737a-457d-b06c-d88dcdd505d5" },
                { featureFlagId: "5881dd7e-870a-4078-9699-869f05c7e153", usuarioId: "713debe4-737a-457d-b06c-d88dcdd505d5" },
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
