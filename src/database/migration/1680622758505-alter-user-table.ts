import {MigrationInterface, QueryRunner} from "typeorm";

export class alterUserTable1680622758505 implements MigrationInterface {
    name = 'alterUserTable1680622758505'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usuario\` DROP COLUMN \`apellidoPaterno\``);
        await queryRunner.query(`ALTER TABLE \`usuario\` DROP COLUMN \`apellidoMaterno\``);
        await queryRunner.query(`ALTER TABLE \`backup\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`fila\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`plantilla\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`dinamico\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`empresa\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`empresa\` CHANGE \`descripcion\` \`descripcion\` varchar(255) NULL`);
        await queryRunner.query(`ALTER TABLE \`documento\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` CHANGE \`ventasExoneradas\` \`ventasExoneradas\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` CHANGE \`ventasExentas\` \`ventasExentas\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` CHANGE \`ventasGrabadas\` \`ventasGrabadas\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`permiso\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`rol\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`usuario\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`factura\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`estatico\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario\` CHANGE \`nombre\` \`nombre\` varchar(255) NULL`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` CHANGE \`parcial\` \`parcial\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` CHANGE \`debito\` \`debito\` int NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` CHANGE \`debito\` \`debito\` int NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` CHANGE \`parcial\` \`parcial\` int NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario_item\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario\` CHANGE \`nombre\` \`nombre\` varchar(255) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`comprobante_diario\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`estatico\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`factura\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`historial_factura\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`usuario\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`historial_comprobante_diario\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`rol\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`permiso\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` CHANGE \`ventasGrabadas\` \`ventasGrabadas\` int NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` CHANGE \`ventasExentas\` \`ventasExentas\` int NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` CHANGE \`ventasExoneradas\` \`ventasExoneradas\` int NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`factura_item\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`documento\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`empresa\` CHANGE \`descripcion\` \`descripcion\` varchar(255) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`empresa\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`dinamico\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`plantilla\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`fila\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`backup\` CHANGE \`deletedAt\` \`deletedAt\` datetime(6) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`usuario\` ADD \`apellidoMaterno\` varchar(255) NULL DEFAULT 'NULL'`);
        await queryRunner.query(`ALTER TABLE \`usuario\` ADD \`apellidoPaterno\` varchar(255) NOT NULL`);
    }

}
