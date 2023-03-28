import { Role } from '../roles/entities/role.entity';
import { Connection } from 'typeorm';
import { Factory, Seeder } from 'typeorm-seeding';
import * as bcrypt from 'bcrypt';
import { v4 as uuidV4 } from 'uuid';
import { Usuario } from '../usuario/entities/usuario.entity';

export class ServiceCreateSeed implements Seeder {
    public async run(factory: Factory, connection: Connection): Promise<void> {
        // Delete data from tables
        await connection.createQueryBuilder().delete().from(Usuario).execute();
        await connection.createQueryBuilder().delete().from(Role).execute();

        // insert data in tables
        await connection
            .createQueryBuilder()
            .insert()
            .into(Role)
            .values([
                { id: '9cf17f36-1924-4a19-a556-79b5c59f2d99', nombre: 'Administrador' },
                { id: '0c479969-1356-44cf-93b7-0adf9ff9332d', nombre: 'Usuario' },
            ]).execute();

        await connection
            .createQueryBuilder()
            .insert()
            .into(Usuario)
            .values([
                {
                    id: 'a14e0116-2132-403e-92f3-d6a01e1c6b5c',
                    nombre: 'Josue',
                    apellidoPaterno: 'Lopez',
                    rolId: '9cf17f36-1924-4a19-a556-79b5c59f2d99',
                    correo: 'josue@gmail.com',
                    password: bcrypt.hashSync('123456', 10),
                    activo: true,
                },
                {
                    id: uuidV4(),
                    nombre: 'Shoji',
                    apellidoPaterno: 'Delgado',
                    rolId: '0c479969-1356-44cf-93b7-0adf9ff9332d',
                    correo: 'shoji@gmail.com',
                    password: bcrypt.hashSync('123456', 10),
                    activo: true,
                },
                {
                    id: uuidV4(),
                    nombre: 'Michael',
                    apellidoPaterno: 'Garcia',
                    rolId: '0c479969-1356-44cf-93b7-0adf9ff9332d',
                    correo: 'michael@gmail.com',
                    password: bcrypt.hashSync('123456', 10),
                    activo: true,
                },
                {
                    id: uuidV4(),
                    nombre: 'Ulises',
                    apellidoPaterno: 'Soza',
                    rolId: '0c479969-1356-44cf-93b7-0adf9ff9332d',
                    correo: 'ulises@gmail.com',
                    password: bcrypt.hashSync('123456', 10),
                    activo: true,
                },
            ])
            .execute();
    }
}
