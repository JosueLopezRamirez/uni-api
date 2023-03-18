import { MigrationInterface, QueryRunner } from 'typeorm';
import { Role } from '../roles/entities/role.entity';
import { Usuario } from '../usuario/entities/usuario.entity';
import * as bcrypt from 'bcrypt';
import { v4 as uuidV4 } from 'uuid';

export class seedTables1679176398523 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    // seed role table
    await queryRunner.manager
      .createQueryBuilder()
      .insert()
      .into(Role)
      .values([
        { id: '9cf17f36-1924-4a19-a556-79b5c59f2d99', nombre: 'Administrador' },
        { id: '0c479969-1356-44cf-93b7-0adf9ff9332d', nombre: 'Usuario' },
      ])
      .execute();
    // seed usuario table
    await queryRunner.manager
      .createQueryBuilder()
      .insert()
      .into(Usuario)
      .values([
        {
          id: 'a14e0116-2132-403e-92f3-d6a01e1c6b5c',
          nombre: 'Ingrid',
          apellidoPaterno: 'Trujillo',
          rolId: '9cf17f36-1924-4a19-a556-79b5c59f2d99',
          correo: 'ingrid@gmail.com',
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

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.manager
      .createQueryBuilder()
      .delete()
      .from(Usuario)
      .execute();
    await queryRunner.manager
      .createQueryBuilder()
      .delete()
      .from(Role)
      .execute();
  }
}
