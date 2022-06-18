import {MigrationInterface, QueryRunner} from "typeorm";

export class BaseMigrations1655260256963 implements MigrationInterface {
    name = 'BaseMigrations1655260256963'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE \`fila\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`valor\` text NOT NULL, \`dinamicoId\` varchar(255) NOT NULL, \`dinamico_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`plantilla\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`nombre\` varchar(255) NOT NULL, \`columnas\` text NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`dinamico\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`documentoId\` varchar(255) NOT NULL, \`plantillaId\` varchar(255) NOT NULL, \`nombre\` varchar(255) NOT NULL, \`fecha\` datetime NOT NULL, \`documento_id\` varchar(255) NULL, \`plantilla_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`empresa\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`nombre\` varchar(255) NOT NULL, \`descripcion\` varchar(255) NULL, \`ruc\` varchar(255) NOT NULL, \`telefono\` varchar(255) NOT NULL, UNIQUE INDEX \`IDX_dc656dc24f6986afbfe84ebf13\` (\`ruc\`), UNIQUE INDEX \`IDX_3ab4bf8bb031ef45df7165a07f\` (\`telefono\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`documento\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`empresaId\` varchar(255) NOT NULL, \`empresa_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`factura_item\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`numero_factura\` varchar(255) NOT NULL, \`descripcion\` varchar(255) NOT NULL, \`ventas_exoneradas\` int NULL, \`ventas_exentas\` int NULL, \`ventas_grabadas\` int NULL, \`facturaId\` varchar(255) NOT NULL, \`factura_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`permiso\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`pagina\` varchar(255) NOT NULL, \`rolId\` varchar(255) NOT NULL, \`ver\` tinyint NOT NULL DEFAULT 0, \`edicion\` tinyint NOT NULL DEFAULT 0, \`borrado\` tinyint NOT NULL DEFAULT 0, \`rol_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`rol\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`nombre\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`historial_comprobante_diario\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`comprobanteDiarioId\` varchar(255) NOT NULL, \`usuarioId\` varchar(255) NOT NULL, \`comprobante_diario_id\` varchar(255) NULL, \`usuario_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`usuario\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`nombre\` varchar(255) NOT NULL, \`apellido_paterno\` varchar(255) NOT NULL, \`apellido_materno\` varchar(255) NULL, \`correo\` varchar(255) NOT NULL, \`password\` varchar(255) NOT NULL, \`rolId\` varchar(255) NOT NULL, \`activo\` tinyint NOT NULL DEFAULT 1, \`rol_id\` varchar(255) NULL, UNIQUE INDEX \`IDX_349ecb64acc4355db443ca17cb\` (\`correo\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`historial_factura\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`facturaId\` varchar(255) NOT NULL, \`usuarioId\` varchar(255) NOT NULL, \`factura_id\` varchar(255) NULL, \`usuario_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`factura\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`fecha\` datetime NOT NULL, \`nombre\` varchar(255) NOT NULL, \`estaticoId\` varchar(255) NOT NULL, \`estatico_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`estatico\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`documentoId\` varchar(255) NOT NULL, \`documento_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`comprobante_diario\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`nombre\` varchar(255) NULL, \`fecha\` datetime NOT NULL, \`estaticoId\` varchar(255) NOT NULL, \`estatico_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`comprobante_diario_item\` (\`id\` varchar(36) NOT NULL, \`created_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`updated_at\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deleted_at\` datetime(6) NULL, \`numero_cuenta\` varchar(255) NOT NULL, \`descripcion\` varchar(255) NOT NULL, \`parcial\` int NULL, \`debito\` int NULL, \`comprobanteDiarioId\` varchar(255) NOT NULL, \`comprobante_diario_id\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`fila\` ADD CONSTRAINT \`FK_f10939aad7fee864cde81319b0f\` FOREIGN KEY (\`dinamico_id\`) REFERENCES \`dinamico\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`dinamico\` ADD CONSTRAINT \`FK_a129ac6ad71424659050a4aecee\` FOREIGN KEY (\`documento_id\`) REFERENCES \`documento\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`dinamico\` ADD CONSTRAINT \`FK_9fbc676861191ebbaf341e27e91\` FOREIGN KEY (\`plantilla_id\`) REFERENCES \`plantilla\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`documento\` ADD CONSTRAINT \`FK_b850a654abf221049da449dbdb1\` FOREIGN KEY (\`empresa_id\`) REFERENCES \`empresa\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` ADD CONSTRAINT \`FK_0ee6696f5f8098e9d2167f30fda\` FOREIGN KEY (\`factura_id\`) REFERENCES \`factura\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`permiso\` ADD CONSTRAINT \`FK_52dc23f46991feabaa9819b656a\` FOREIGN KEY (\`rol_id\`) REFERENCES \`rol\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` ADD CONSTRAINT \`FK_f6e57437a7dbf2da6f0a56cd68e\` FOREIGN KEY (\`comprobante_diario_id\`) REFERENCES \`comprobante_diario\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` ADD CONSTRAINT \`FK_d8c32e772bff906da93f90eaba0\` FOREIGN KEY (\`usuario_id\`) REFERENCES \`usuario\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`usuario\` ADD CONSTRAINT \`FK_6c336b0a51b5c4d22614cb02533\` FOREIGN KEY (\`rol_id\`) REFERENCES \`rol\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` ADD CONSTRAINT \`FK_4b512cbd8397d991f85e1233190\` FOREIGN KEY (\`factura_id\`) REFERENCES \`factura\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` ADD CONSTRAINT \`FK_6ee166ef2522be64c974463dcc9\` FOREIGN KEY (\`usuario_id\`) REFERENCES \`usuario\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`factura\` ADD CONSTRAINT \`FK_0c8bd1fe7fc0088ddb6e19b15be\` FOREIGN KEY (\`estatico_id\`) REFERENCES \`estatico\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`estatico\` ADD CONSTRAINT \`FK_ca5c59fb4646c549726c686b1f1\` FOREIGN KEY (\`documento_id\`) REFERENCES \`documento\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario\` ADD CONSTRAINT \`FK_0c6108fb72a8f150623419cefce\` FOREIGN KEY (\`estatico_id\`) REFERENCES \`estatico\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` ADD CONSTRAINT \`FK_3fa72fcc8f310952fe362ea343e\` FOREIGN KEY (\`comprobante_diario_id\`) REFERENCES \`comprobante_diario\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` DROP FOREIGN KEY \`FK_3fa72fcc8f310952fe362ea343e\``);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario\` DROP FOREIGN KEY \`FK_0c6108fb72a8f150623419cefce\``);
        await queryRunner.query(`ALTER TABLE \`estatico\` DROP FOREIGN KEY \`FK_ca5c59fb4646c549726c686b1f1\``);
        await queryRunner.query(`ALTER TABLE \`factura\` DROP FOREIGN KEY \`FK_0c8bd1fe7fc0088ddb6e19b15be\``);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` DROP FOREIGN KEY \`FK_6ee166ef2522be64c974463dcc9\``);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` DROP FOREIGN KEY \`FK_4b512cbd8397d991f85e1233190\``);
        await queryRunner.query(`ALTER TABLE \`usuario\` DROP FOREIGN KEY \`FK_6c336b0a51b5c4d22614cb02533\``);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` DROP FOREIGN KEY \`FK_d8c32e772bff906da93f90eaba0\``);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` DROP FOREIGN KEY \`FK_f6e57437a7dbf2da6f0a56cd68e\``);
        await queryRunner.query(`ALTER TABLE \`permiso\` DROP FOREIGN KEY \`FK_52dc23f46991feabaa9819b656a\``);
        await queryRunner.query(`ALTER TABLE \`factura_item\` DROP FOREIGN KEY \`FK_0ee6696f5f8098e9d2167f30fda\``);
        await queryRunner.query(`ALTER TABLE \`documento\` DROP FOREIGN KEY \`FK_b850a654abf221049da449dbdb1\``);
        await queryRunner.query(`ALTER TABLE \`dinamico\` DROP FOREIGN KEY \`FK_9fbc676861191ebbaf341e27e91\``);
        await queryRunner.query(`ALTER TABLE \`dinamico\` DROP FOREIGN KEY \`FK_a129ac6ad71424659050a4aecee\``);
        await queryRunner.query(`ALTER TABLE \`fila\` DROP FOREIGN KEY \`FK_f10939aad7fee864cde81319b0f\``);
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
