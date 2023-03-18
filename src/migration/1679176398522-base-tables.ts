import {MigrationInterface, QueryRunner} from "typeorm";

export class baseTables1679176398522 implements MigrationInterface {
    name = 'baseTables1679176398522'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE \`fila\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`valor\` text NOT NULL, \`dinamicoId\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`plantilla\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`nombre\` varchar(255) NOT NULL, \`columnas\` text NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`dinamico\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`documentoId\` varchar(255) NOT NULL, \`plantillaId\` varchar(255) NOT NULL, \`nombre\` varchar(255) NOT NULL, \`fecha\` datetime NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`empresa\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`nombre\` varchar(255) NOT NULL, \`descripcion\` varchar(255) NULL, \`ruc\` varchar(255) NOT NULL, \`telefono\` varchar(255) NOT NULL, UNIQUE INDEX \`IDX_dc656dc24f6986afbfe84ebf13\` (\`ruc\`), UNIQUE INDEX \`IDX_3ab4bf8bb031ef45df7165a07f\` (\`telefono\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`documento\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`empresaId\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`factura_item\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`numeroFactura\` varchar(255) NOT NULL, \`descripcion\` varchar(255) NOT NULL, \`ventasExoneradas\` int NULL, \`ventasExentas\` int NULL, \`ventasGrabadas\` int NULL, \`facturaId\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`permiso\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`pagina\` varchar(255) NOT NULL, \`rolId\` varchar(255) NOT NULL, \`ver\` tinyint NOT NULL DEFAULT 0, \`edicion\` tinyint NOT NULL DEFAULT 0, \`borrado\` tinyint NOT NULL DEFAULT 0, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`rol\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`nombre\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`historial_comprobante_diario\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`comprobanteDiarioId\` varchar(255) NOT NULL, \`usuarioId\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`usuario\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`nombre\` varchar(255) NOT NULL, \`apellidoPaterno\` varchar(255) NOT NULL, \`apellidoMaterno\` varchar(255) NULL, \`correo\` varchar(255) NOT NULL, \`password\` varchar(255) NOT NULL, \`rolId\` varchar(255) NOT NULL, \`activo\` tinyint NOT NULL DEFAULT 1, UNIQUE INDEX \`IDX_349ecb64acc4355db443ca17cb\` (\`correo\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`historial_factura\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`facturaId\` varchar(255) NOT NULL, \`usuarioId\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`factura\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`fecha\` datetime NOT NULL, \`nombre\` varchar(255) NOT NULL, \`estaticoId\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`estatico\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`documentoId\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`comprobante_diario\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`nombre\` varchar(255) NULL, \`fecha\` datetime NOT NULL, \`estaticoId\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`comprobante_diario_item\` (\`id\` varchar(36) NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL, \`numeroCuenta\` varchar(255) NOT NULL, \`descripcion\` varchar(255) NOT NULL, \`parcial\` int NULL, \`debito\` int NULL, \`comprobanteDiarioId\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`fila\` ADD CONSTRAINT \`FK_e652922dc09c550f4888ee4f09d\` FOREIGN KEY (\`dinamicoId\`) REFERENCES \`dinamico\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`dinamico\` ADD CONSTRAINT \`FK_5814e80f47010559b5a5bd345e4\` FOREIGN KEY (\`documentoId\`) REFERENCES \`documento\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`dinamico\` ADD CONSTRAINT \`FK_3b43f2c2e7e5f96a49715ec73da\` FOREIGN KEY (\`plantillaId\`) REFERENCES \`plantilla\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`documento\` ADD CONSTRAINT \`FK_6619e8c6c8b5b1d8631ebe0f8fd\` FOREIGN KEY (\`empresaId\`) REFERENCES \`empresa\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` ADD CONSTRAINT \`FK_6d9e4410327e605ac464697bf7e\` FOREIGN KEY (\`facturaId\`) REFERENCES \`factura\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`permiso\` ADD CONSTRAINT \`FK_b55192c7fdc851e6c736eb95268\` FOREIGN KEY (\`rolId\`) REFERENCES \`rol\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` ADD CONSTRAINT \`FK_d1cd116b9674b47f8cba415684d\` FOREIGN KEY (\`comprobanteDiarioId\`) REFERENCES \`comprobante_diario\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` ADD CONSTRAINT \`FK_c51feb5d301aadad92ad3fba38c\` FOREIGN KEY (\`usuarioId\`) REFERENCES \`usuario\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`usuario\` ADD CONSTRAINT \`FK_611daf5befc024d9e0bd7bdf4da\` FOREIGN KEY (\`rolId\`) REFERENCES \`rol\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` ADD CONSTRAINT \`FK_76578223a872c0b82d97823f0d1\` FOREIGN KEY (\`facturaId\`) REFERENCES \`factura\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` ADD CONSTRAINT \`FK_44b850aa88ded8f766b87d69b04\` FOREIGN KEY (\`usuarioId\`) REFERENCES \`usuario\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`factura\` ADD CONSTRAINT \`FK_17ba7d1cdb3124bd7848961aa84\` FOREIGN KEY (\`estaticoId\`) REFERENCES \`estatico\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`estatico\` ADD CONSTRAINT \`FK_aa97ce017059b3cc024bba8db34\` FOREIGN KEY (\`documentoId\`) REFERENCES \`documento\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario\` ADD CONSTRAINT \`FK_27a2b029dab57295d56f24fcd13\` FOREIGN KEY (\`estaticoId\`) REFERENCES \`estatico\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` ADD CONSTRAINT \`FK_9ed0af5c5fa600cb2ff64d4d69c\` FOREIGN KEY (\`comprobanteDiarioId\`) REFERENCES \`comprobante_diario\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` DROP FOREIGN KEY \`FK_9ed0af5c5fa600cb2ff64d4d69c\``);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario\` DROP FOREIGN KEY \`FK_27a2b029dab57295d56f24fcd13\``);
        await queryRunner.query(`ALTER TABLE \`estatico\` DROP FOREIGN KEY \`FK_aa97ce017059b3cc024bba8db34\``);
        await queryRunner.query(`ALTER TABLE \`factura\` DROP FOREIGN KEY \`FK_17ba7d1cdb3124bd7848961aa84\``);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` DROP FOREIGN KEY \`FK_44b850aa88ded8f766b87d69b04\``);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` DROP FOREIGN KEY \`FK_76578223a872c0b82d97823f0d1\``);
        await queryRunner.query(`ALTER TABLE \`usuario\` DROP FOREIGN KEY \`FK_611daf5befc024d9e0bd7bdf4da\``);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` DROP FOREIGN KEY \`FK_c51feb5d301aadad92ad3fba38c\``);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` DROP FOREIGN KEY \`FK_d1cd116b9674b47f8cba415684d\``);
        await queryRunner.query(`ALTER TABLE \`permiso\` DROP FOREIGN KEY \`FK_b55192c7fdc851e6c736eb95268\``);
        await queryRunner.query(`ALTER TABLE \`factura_item\` DROP FOREIGN KEY \`FK_6d9e4410327e605ac464697bf7e\``);
        await queryRunner.query(`ALTER TABLE \`documento\` DROP FOREIGN KEY \`FK_6619e8c6c8b5b1d8631ebe0f8fd\``);
        await queryRunner.query(`ALTER TABLE \`dinamico\` DROP FOREIGN KEY \`FK_3b43f2c2e7e5f96a49715ec73da\``);
        await queryRunner.query(`ALTER TABLE \`dinamico\` DROP FOREIGN KEY \`FK_5814e80f47010559b5a5bd345e4\``);
        await queryRunner.query(`ALTER TABLE \`fila\` DROP FOREIGN KEY \`FK_e652922dc09c550f4888ee4f09d\``);
        await queryRunner.query(`DROP TABLE \`comprobante_diario_item\``);
        await queryRunner.query(`DROP TABLE \`comprobante_diario\``);
        await queryRunner.query(`DROP TABLE \`estatico\``);
        await queryRunner.query(`DROP TABLE \`factura\``);
        await queryRunner.query(`DROP TABLE \`historial_factura\``);
        await queryRunner.query(`DROP INDEX \`IDX_349ecb64acc4355db443ca17cb\` ON \`usuario\``);
        await queryRunner.query(`DROP TABLE \`usuario\``);
        await queryRunner.query(`DROP TABLE \`historial_comprobante_diario\``);
        await queryRunner.query(`DROP TABLE \`rol\``);
        await queryRunner.query(`DROP TABLE \`permiso\``);
        await queryRunner.query(`DROP TABLE \`factura_item\``);
        await queryRunner.query(`DROP TABLE \`documento\``);
        await queryRunner.query(`DROP INDEX \`IDX_3ab4bf8bb031ef45df7165a07f\` ON \`empresa\``);
        await queryRunner.query(`DROP INDEX \`IDX_dc656dc24f6986afbfe84ebf13\` ON \`empresa\``);
        await queryRunner.query(`DROP TABLE \`empresa\``);
        await queryRunner.query(`DROP TABLE \`dinamico\``);
        await queryRunner.query(`DROP TABLE \`plantilla\``);
        await queryRunner.query(`DROP TABLE \`fila\``);
    }

}
