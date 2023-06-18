/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: backup
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `backup` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: comprobante_diario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `comprobante_diario` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `estaticoId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_27a2b029dab57295d56f24fcd13` (`estaticoId`),
  CONSTRAINT `FK_27a2b029dab57295d56f24fcd13` FOREIGN KEY (`estaticoId`) REFERENCES `estatico` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: comprobante_diario_item
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `comprobante_diario_item` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `numeroCuenta` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `parcial` int DEFAULT NULL,
  `debito` int DEFAULT NULL,
  `comprobanteDiarioId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9ed0af5c5fa600cb2ff64d4d69c` (`comprobanteDiarioId`),
  CONSTRAINT `FK_9ed0af5c5fa600cb2ff64d4d69c` FOREIGN KEY (`comprobanteDiarioId`) REFERENCES `comprobante_diario` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dinamico
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dinamico` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `documentoId` varchar(255) NOT NULL,
  `plantillaId` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5814e80f47010559b5a5bd345e4` (`documentoId`),
  KEY `FK_3b43f2c2e7e5f96a49715ec73da` (`plantillaId`),
  CONSTRAINT `FK_3b43f2c2e7e5f96a49715ec73da` FOREIGN KEY (`plantillaId`) REFERENCES `plantilla` (`id`),
  CONSTRAINT `FK_5814e80f47010559b5a5bd345e4` FOREIGN KEY (`documentoId`) REFERENCES `documento` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: documento
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `documento` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `empresaId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6619e8c6c8b5b1d8631ebe0f8fd` (`empresaId`),
  CONSTRAINT `FK_6619e8c6c8b5b1d8631ebe0f8fd` FOREIGN KEY (`empresaId`) REFERENCES `empresa` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: empresa
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `ruc` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_dc656dc24f6986afbfe84ebf13` (`ruc`),
  UNIQUE KEY `IDX_3ab4bf8bb031ef45df7165a07f` (`telefono`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: estatico
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `estatico` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `documentoId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aa97ce017059b3cc024bba8db34` (`documentoId`),
  CONSTRAINT `FK_aa97ce017059b3cc024bba8db34` FOREIGN KEY (`documentoId`) REFERENCES `documento` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: factura
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `factura` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estaticoId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_17ba7d1cdb3124bd7848961aa84` (`estaticoId`),
  CONSTRAINT `FK_17ba7d1cdb3124bd7848961aa84` FOREIGN KEY (`estaticoId`) REFERENCES `estatico` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: factura_item
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `factura_item` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `numeroFactura` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `ventasExoneradas` int DEFAULT NULL,
  `ventasExentas` int DEFAULT NULL,
  `ventasGrabadas` int DEFAULT NULL,
  `facturaId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6d9e4410327e605ac464697bf7e` (`facturaId`),
  CONSTRAINT `FK_6d9e4410327e605ac464697bf7e` FOREIGN KEY (`facturaId`) REFERENCES `factura` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: feature_flag
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `feature_flag` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_0cb1810eca363db1e0bf13c3cf` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: feature_flag_user
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `feature_flag_user` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `usuarioId` varchar(255) NOT NULL,
  `featureFlagId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_036abcf3897fc7c0d200b7226e5` (`usuarioId`),
  KEY `FK_7502bd30e336c4eb5ff455ec1d2` (`featureFlagId`),
  CONSTRAINT `FK_036abcf3897fc7c0d200b7226e5` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_7502bd30e336c4eb5ff455ec1d2` FOREIGN KEY (`featureFlagId`) REFERENCES `feature_flag` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fila
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fila` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `valor` text NOT NULL,
  `dinamicoId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e652922dc09c550f4888ee4f09d` (`dinamicoId`),
  CONSTRAINT `FK_e652922dc09c550f4888ee4f09d` FOREIGN KEY (`dinamicoId`) REFERENCES `dinamico` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: historial_comprobante_diario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `historial_comprobante_diario` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `comprobanteDiarioId` varchar(255) NOT NULL,
  `usuarioId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d1cd116b9674b47f8cba415684d` (`comprobanteDiarioId`),
  KEY `FK_c51feb5d301aadad92ad3fba38c` (`usuarioId`),
  CONSTRAINT `FK_c51feb5d301aadad92ad3fba38c` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_d1cd116b9674b47f8cba415684d` FOREIGN KEY (`comprobanteDiarioId`) REFERENCES `comprobante_diario` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: historial_factura
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `historial_factura` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `facturaId` varchar(255) NOT NULL,
  `usuarioId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_76578223a872c0b82d97823f0d1` (`facturaId`),
  KEY `FK_44b850aa88ded8f766b87d69b04` (`usuarioId`),
  CONSTRAINT `FK_44b850aa88ded8f766b87d69b04` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_76578223a872c0b82d97823f0d1` FOREIGN KEY (`facturaId`) REFERENCES `factura` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: plantilla
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `plantilla` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `columnas` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: rol
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `rol` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_9792c580a992d554ee1621c5b4` (`nombre`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: usuario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rolId` varchar(255) NOT NULL,
  `activo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_349ecb64acc4355db443ca17cb` (`correo`),
  KEY `FK_611daf5befc024d9e0bd7bdf4da` (`rolId`),
  CONSTRAINT `FK_611daf5befc024d9e0bd7bdf4da` FOREIGN KEY (`rolId`) REFERENCES `rol` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: backup
# ------------------------------------------------------------

INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    '0fa71414-f771-4e42-be58-c80a6b1136f0',
    '2023-06-17 16:35:02.586646',
    '2023-06-17 16:35:02.586646',
    NULL,
    'dumpfile-1687041302368.sql',
    'http://localhost:4566/bucket/dumpfile-1687041302368.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    '2e36c6b0-a0cf-4a58-9a7e-c00632225f36',
    '2023-06-17 16:34:57.261874',
    '2023-06-17 16:34:57.261874',
    NULL,
    'dumpfile-1687041297018.sql',
    'http://localhost:4566/bucket/dumpfile-1687041297018.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    '385537e5-53fa-4a60-86f2-73981d31cd5c',
    '2023-06-17 16:34:35.989840',
    '2023-06-17 16:34:35.989840',
    NULL,
    'dumpfile-1687041275699.sql',
    'http://localhost:4566/bucket/dumpfile-1687041275699.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    '5fe954cd-8b31-401d-a024-8a8e5df8a9e6',
    '2023-06-17 16:34:53.980157',
    '2023-06-17 16:34:53.980157',
    NULL,
    'dumpfile-1687041293705.sql',
    'http://localhost:4566/bucket/dumpfile-1687041293705.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    '7526c776-652b-40bf-a8b2-902d87e0dd58',
    '2023-06-17 16:35:03.816409',
    '2023-06-17 16:35:03.816409',
    NULL,
    'dumpfile-1687041303551.sql',
    'http://localhost:4566/bucket/dumpfile-1687041303551.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    '7d20349b-a65e-4a84-8218-fb5ffa7c1b93',
    '2023-06-17 16:35:07.123162',
    '2023-06-17 16:35:07.123162',
    NULL,
    'dumpfile-1687041306848.sql',
    'http://localhost:4566/bucket/dumpfile-1687041306848.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    '9f3d547d-cda8-44f5-b1ae-86c906330bf5',
    '2023-06-17 16:35:08.954898',
    '2023-06-17 16:35:08.954898',
    NULL,
    'dumpfile-1687041308734.sql',
    'http://localhost:4566/bucket/dumpfile-1687041308734.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    'a369e233-de8c-497c-a158-356a120aa080',
    '2023-06-17 16:34:59.326500',
    '2023-06-17 16:34:59.326500',
    NULL,
    'dumpfile-1687041299069.sql',
    'http://localhost:4566/bucket/dumpfile-1687041299069.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    'a935a533-c063-4699-bdd6-c7845b94de80',
    '2023-06-17 16:34:54.995823',
    '2023-06-17 16:34:54.995823',
    NULL,
    'dumpfile-1687041294742.sql',
    'http://localhost:4566/bucket/dumpfile-1687041294742.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    'bd245e3f-65ff-4cca-ab75-51648a1d62af',
    '2023-06-17 16:34:32.615213',
    '2023-06-17 16:34:32.615213',
    NULL,
    'dumpfile-1687041272299.sql',
    'http://localhost:4566/bucket/dumpfile-1687041272299.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    'd7f688c2-744c-47d6-9132-59d9a9549843',
    '2023-06-17 16:34:37.476512',
    '2023-06-17 16:34:37.476512',
    NULL,
    'dumpfile-1687041277203.sql',
    'http://localhost:4566/bucket/dumpfile-1687041277203.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    'f126c978-80c8-4504-aa4e-9537ba17f7c9',
    '2023-06-17 16:34:39.713297',
    '2023-06-17 16:34:39.713297',
    NULL,
    'dumpfile-1687041279455.sql',
    'http://localhost:4566/bucket/dumpfile-1687041279455.sql'
  );
INSERT INTO
  `backup` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `name`,
    `url`
  )
VALUES
  (
    'f2ca05d2-57a6-4ce6-ad7a-68c049815cfe',
    '2023-06-17 16:34:34.578555',
    '2023-06-17 16:34:34.578555',
    NULL,
    'dumpfile-1687041274244.sql',
    'http://localhost:4566/bucket/dumpfile-1687041274244.sql'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: comprobante_diario
# ------------------------------------------------------------

INSERT INTO
  `comprobante_diario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `fecha`,
    `estaticoId`
  )
VALUES
  (
    '007e5819-5d62-4106-aaa9-fe3436470934',
    '2023-06-17 16:31:51.814051',
    '2023-06-17 16:31:51.814051',
    NULL,
    'Credit Card Account',
    '2023-02-02 02:25:33',
    '3fc46eea-81b6-491c-b24f-0c2e13653b2d'
  );
INSERT INTO
  `comprobante_diario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `fecha`,
    `estaticoId`
  )
VALUES
  (
    '3f31af9c-823d-44e0-bc3c-8400e2d97590',
    '2023-06-17 16:31:52.063816',
    '2023-06-17 16:31:52.063816',
    NULL,
    'Credit Card Account',
    '2022-07-08 17:09:46',
    '1fa045c3-14c6-458b-8774-af47f76e6e4a'
  );
INSERT INTO
  `comprobante_diario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `fecha`,
    `estaticoId`
  )
VALUES
  (
    '42c6ba15-21e1-41ad-844b-04eb6a749de0',
    '2023-06-17 16:31:52.135263',
    '2023-06-17 16:31:52.135263',
    NULL,
    'Credit Card Account',
    '2022-11-13 00:00:04',
    '2f7827fb-56d0-45ef-b632-e92142bdf991'
  );
INSERT INTO
  `comprobante_diario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `fecha`,
    `estaticoId`
  )
VALUES
  (
    '701c6234-2be7-4c35-822a-5e30812e1cd1',
    '2023-06-17 16:31:51.884607',
    '2023-06-17 16:31:51.884607',
    NULL,
    'Auto Loan Account',
    '2022-12-06 23:19:19',
    '45185f32-7491-40ae-8f79-985864aa0a19'
  );
INSERT INTO
  `comprobante_diario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `fecha`,
    `estaticoId`
  )
VALUES
  (
    '81f32d1a-447b-41bd-bcaa-a0c51cb1dcc2',
    '2023-06-17 16:31:52.381709',
    '2023-06-17 16:31:52.381709',
    NULL,
    'Money Market Account',
    '2022-07-15 06:45:24',
    '70a70a13-5bb1-4510-88ee-421c554a9cc5'
  );
INSERT INTO
  `comprobante_diario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `fecha`,
    `estaticoId`
  )
VALUES
  (
    'a9a028c0-2b2b-43d7-8c59-2ed00f179c6d',
    '2023-06-17 16:31:52.234858',
    '2023-06-17 16:31:52.234858',
    NULL,
    'Home Loan Account',
    '2023-04-28 22:54:38',
    'aa78a1d4-0f3a-4c69-a32a-5a6e428d76cc'
  );
INSERT INTO
  `comprobante_diario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `fecha`,
    `estaticoId`
  )
VALUES
  (
    'df8b1740-0f3c-4e66-a0b3-622f0388afb4',
    '2023-06-17 16:31:51.724116',
    '2023-06-17 16:31:51.724116',
    NULL,
    'Credit Card Account',
    '2022-08-11 19:45:34',
    '65976b4d-a804-4a58-b11d-9ecd47aca19c'
  );
INSERT INTO
  `comprobante_diario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `fecha`,
    `estaticoId`
  )
VALUES
  (
    'e23400e5-0426-42c0-a7c2-d30cddd6fd0a',
    '2023-06-17 16:31:52.306463',
    '2023-06-17 16:31:52.306463',
    NULL,
    'Credit Card Account',
    '2023-04-08 07:46:25',
    'c92115a1-79e3-42b1-bced-d87d03df385d'
  );
INSERT INTO
  `comprobante_diario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `fecha`,
    `estaticoId`
  )
VALUES
  (
    'f1e586eb-8b17-46ae-8e09-67d834629a12',
    '2023-06-17 16:31:51.984745',
    '2023-06-17 16:31:51.984745',
    NULL,
    'Investment Account',
    '2023-01-01 04:59:10',
    'c25c1f9f-825f-44e1-8545-35f48db4950e'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: comprobante_diario_item
# ------------------------------------------------------------

INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '0400b0ca-31f9-41e1-85d3-1ef55425090f',
    '2023-06-17 16:31:51.999053',
    '2023-06-17 16:31:51.999053',
    NULL,
    '58593578',
    'withdrawal transaction at Stiedemann Inc using card ending with ***(...1655) for MXN 227.59 in account ***10136017',
    497,
    497,
    'f1e586eb-8b17-46ae-8e09-67d834629a12'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '0e8d6d56-4f62-4713-9261-125ca21a1b52',
    '2023-06-17 16:31:51.911213',
    '2023-06-17 16:31:51.911213',
    NULL,
    '49734480',
    'withdrawal transaction at Ruecker and Sons using card ending with ***(...4836) for RSD 606.43 in account ***47215564',
    410,
    410,
    '701c6234-2be7-4c35-822a-5e30812e1cd1'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '183b2c1a-6a92-46ec-99b2-05cced09822e',
    '2023-06-17 16:31:52.322933',
    '2023-06-17 16:31:52.322933',
    NULL,
    '12664238',
    'withdrawal transaction at Kovacek - Turner using card ending with ***(...5049) for OMR 872.99 in account ***11304661',
    369,
    369,
    'e23400e5-0426-42c0-a7c2-d30cddd6fd0a'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '1c8f9c44-61ea-4212-abd0-397a2087fbec',
    '2023-06-17 16:31:51.743530',
    '2023-06-17 16:31:51.743530',
    NULL,
    '43411989',
    'payment transaction at Huel, Borer and Murazik using card ending with ***(...5402) for PHP 339.99 in account ***19891092',
    756,
    756,
    'df8b1740-0f3c-4e66-a0b3-622f0388afb4'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '2fed9c8c-e9bd-44d4-bc12-f331ee8a57a4',
    '2023-06-17 16:31:51.999053',
    '2023-06-17 16:31:51.999053',
    NULL,
    '18874061',
    'payment transaction at Anderson - Russel using card ending with ***(...7318) for CZK 644.51 in account ***14908910',
    650,
    650,
    'f1e586eb-8b17-46ae-8e09-67d834629a12'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '3274c365-c904-439a-a006-9590c2ea09c5',
    '2023-06-17 16:31:51.743530',
    '2023-06-17 16:31:51.743530',
    NULL,
    '02968938',
    'invoice transaction at Feeney, Konopelski and Stanton using card ending with ***(...8008) for LVL 795.66 in account ***80491029',
    678,
    678,
    'df8b1740-0f3c-4e66-a0b3-622f0388afb4'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '5330770a-bc3b-40d7-b6c7-022aef8964e8',
    '2023-06-17 16:31:52.150034',
    '2023-06-17 16:31:52.150034',
    NULL,
    '06684182',
    'deposit transaction at Grady - Koelpin using card ending with ***(...0769) for FJD 822.32 in account ***00803423',
    399,
    399,
    '42c6ba15-21e1-41ad-844b-04eb6a749de0'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '5543be05-44d8-45d6-a5db-331842f91b46',
    '2023-06-17 16:31:51.827548',
    '2023-06-17 16:31:51.827548',
    NULL,
    '39560424',
    'payment transaction at Hessel, Braun and Leffler using card ending with ***(...9177) for KYD 210.55 in account ***94685079',
    690,
    690,
    '007e5819-5d62-4106-aaa9-fe3436470934'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '565907e9-ba98-43a5-83a1-86f4acd84be0',
    '2023-06-17 16:31:52.322933',
    '2023-06-17 16:31:52.322933',
    NULL,
    '86881318',
    'payment transaction at Glover LLC using card ending with ***(...6931) for BGN 260.94 in account ***33552339',
    331,
    331,
    'e23400e5-0426-42c0-a7c2-d30cddd6fd0a'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '59f890b5-9494-4387-a212-8d9cad2b622d',
    '2023-06-17 16:31:52.150034',
    '2023-06-17 16:31:52.150034',
    NULL,
    '35361179',
    'deposit transaction at Kreiger, Ward and Walsh using card ending with ***(...7015) for ZMW 777.62 in account ***16565373',
    308,
    308,
    '42c6ba15-21e1-41ad-844b-04eb6a749de0'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '5d61977d-4fcd-47d6-b7cd-0962dfb3a269',
    '2023-06-17 16:31:52.396613',
    '2023-06-17 16:31:52.396613',
    NULL,
    '48348991',
    'deposit transaction at Becker Group using card ending with ***(...3096) for AED 677.98 in account ***82701741',
    671,
    671,
    '81f32d1a-447b-41bd-bcaa-a0c51cb1dcc2'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '72aac99d-a016-4a00-a325-9d0177ab2515',
    '2023-06-17 16:31:52.396613',
    '2023-06-17 16:31:52.396613',
    NULL,
    '99532097',
    'deposit transaction at Hilll - McLaughlin using card ending with ***(...1207) for EEK 529.06 in account ***28897348',
    298,
    298,
    '81f32d1a-447b-41bd-bcaa-a0c51cb1dcc2'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '75617cb2-e597-4f4d-8d73-762354a1cb2a',
    '2023-06-17 16:31:51.911213',
    '2023-06-17 16:31:51.911213',
    NULL,
    '80167960',
    'payment transaction at Harber LLC using card ending with ***(...1381) for ISK 450.99 in account ***25881033',
    915,
    915,
    '701c6234-2be7-4c35-822a-5e30812e1cd1'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '787d6a53-d4fb-4a1d-ac7d-4344862e8574',
    '2023-06-17 16:31:52.396613',
    '2023-06-17 16:31:52.396613',
    NULL,
    '76349805',
    'invoice transaction at Smith - Becker using card ending with ***(...3379) for PLN 963.69 in account ***48261370',
    475,
    475,
    '81f32d1a-447b-41bd-bcaa-a0c51cb1dcc2'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '7c2d6a9d-4131-4b4f-a58f-b87cd88ea693',
    '2023-06-17 16:31:51.827548',
    '2023-06-17 16:31:51.827548',
    NULL,
    '36469728',
    'payment transaction at McCullough Group using card ending with ***(...1646) for STN 811.37 in account ***30277337',
    756,
    756,
    '007e5819-5d62-4106-aaa9-fe3436470934'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '804cbd89-913c-433b-9835-5af608cde7ad',
    '2023-06-17 16:31:52.322933',
    '2023-06-17 16:31:52.322933',
    NULL,
    '07310384',
    'payment transaction at Bahringer Inc using card ending with ***(...9489) for JPY 641.45 in account ***37290083',
    425,
    425,
    'e23400e5-0426-42c0-a7c2-d30cddd6fd0a'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '838b9243-dd64-48c9-aa21-c1ee9207c5cc',
    '2023-06-17 16:31:51.743530',
    '2023-06-17 16:31:51.743530',
    NULL,
    '51995084',
    'payment transaction at Medhurst and Sons using card ending with ***(...4361) for SRD 570.88 in account ***18569599',
    82,
    82,
    'df8b1740-0f3c-4e66-a0b3-622f0388afb4'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '884b8b5e-7f20-47f1-ba65-1df808b628fa',
    '2023-06-17 16:31:52.077107',
    '2023-06-17 16:31:52.077107',
    NULL,
    '30052390',
    'deposit transaction at Schneider - Monahan using card ending with ***(...9361) for RUB 553.27 in account ***08162820',
    327,
    327,
    '3f31af9c-823d-44e0-bc3c-8400e2d97590'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '9135616a-b837-4500-8328-3ef2085045b5',
    '2023-06-17 16:31:52.077107',
    '2023-06-17 16:31:52.077107',
    NULL,
    '31372121',
    'invoice transaction at Cummings Group using card ending with ***(...6337) for MGA 803.69 in account ***65361872',
    280,
    280,
    '3f31af9c-823d-44e0-bc3c-8400e2d97590'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '99dd341b-2a11-4ef5-a588-af2e277b0e37',
    '2023-06-17 16:31:52.247561',
    '2023-06-17 16:31:52.247561',
    NULL,
    '09854890',
    'withdrawal transaction at Baumbach Inc using card ending with ***(...9866) for XPT 826.80 in account ***71039356',
    699,
    699,
    'a9a028c0-2b2b-43d7-8c59-2ed00f179c6d'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    '9ca478dd-c0d2-4d19-b850-42c9813406b2',
    '2023-06-17 16:31:52.247561',
    '2023-06-17 16:31:52.247561',
    NULL,
    '18045275',
    'invoice transaction at O\'Conner Group using card ending with ***(...4473) for SLL 499.98 in account ***36975581',
    372,
    372,
    'a9a028c0-2b2b-43d7-8c59-2ed00f179c6d'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'a3949b3f-31c7-4698-92f1-9666b402c8b3',
    '2023-06-17 16:31:52.077107',
    '2023-06-17 16:31:52.077107',
    NULL,
    '67809112',
    'invoice transaction at Waters, Swift and Fahey using card ending with ***(...1348) for XAG 298.68 in account ***61841506',
    886,
    886,
    '3f31af9c-823d-44e0-bc3c-8400e2d97590'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'a4210b92-e16f-42ab-ba64-be34b051fe04',
    '2023-06-17 16:31:52.150034',
    '2023-06-17 16:31:52.150034',
    NULL,
    '93445145',
    'payment transaction at Kemmer, Boyer and Reichel using card ending with ***(...7895) for PLN 386.33 in account ***27645356',
    656,
    656,
    '42c6ba15-21e1-41ad-844b-04eb6a749de0'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'a4bba501-18bf-41ad-99a3-8861deedc3a6',
    '2023-06-17 16:31:51.999053',
    '2023-06-17 16:31:51.999053',
    NULL,
    '52748419',
    'deposit transaction at Batz, Reichel and Bahringer using card ending with ***(...5632) for XDR 87.40 in account ***67723556',
    755,
    755,
    'f1e586eb-8b17-46ae-8e09-67d834629a12'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'b1260cd0-5be8-4f8d-9d10-43a5198f93a6',
    '2023-06-17 16:31:52.077107',
    '2023-06-17 16:31:52.077107',
    NULL,
    '06077234',
    'withdrawal transaction at Veum - Corwin using card ending with ***(...5307) for MKD 360.10 in account ***65871516',
    257,
    257,
    '3f31af9c-823d-44e0-bc3c-8400e2d97590'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'b3ec030a-9ae0-4b99-9f66-a8aaa4a1c26f',
    '2023-06-17 16:31:52.247561',
    '2023-06-17 16:31:52.247561',
    NULL,
    '09381854',
    'withdrawal transaction at Berge Inc using card ending with ***(...3596) for SZL 874.46 in account ***70297287',
    573,
    573,
    'a9a028c0-2b2b-43d7-8c59-2ed00f179c6d'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'b8e539a9-481a-4ab0-a4d0-772712a81ba2',
    '2023-06-17 16:31:51.911213',
    '2023-06-17 16:31:51.911213',
    NULL,
    '41465918',
    'invoice transaction at Metz, Lind and Ward using card ending with ***(...4291) for JMD 796.06 in account ***00217118',
    11,
    11,
    '701c6234-2be7-4c35-822a-5e30812e1cd1'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'bd6b263c-b76e-4176-8c7a-e4b728744389',
    '2023-06-17 16:31:51.827548',
    '2023-06-17 16:31:51.827548',
    NULL,
    '94743220',
    'invoice transaction at Walter Inc using card ending with ***(...9361) for SHP 611.81 in account ***34466577',
    926,
    926,
    '007e5819-5d62-4106-aaa9-fe3436470934'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'be2feafd-84b1-41c9-a953-2bdafb053d92',
    '2023-06-17 16:31:52.150034',
    '2023-06-17 16:31:52.150034',
    NULL,
    '83815267',
    'withdrawal transaction at Effertz LLC using card ending with ***(...9403) for USD 662.35 in account ***48620621',
    15,
    15,
    '42c6ba15-21e1-41ad-844b-04eb6a749de0'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'c0fa34a0-08e7-436a-bb86-d948c1146ff5',
    '2023-06-17 16:31:52.396613',
    '2023-06-17 16:31:52.396613',
    NULL,
    '92067354',
    'withdrawal transaction at Macejkovic and Sons using card ending with ***(...3730) for ARS 25.90 in account ***42686047',
    764,
    764,
    '81f32d1a-447b-41bd-bcaa-a0c51cb1dcc2'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'c790f727-919a-452e-b840-b408bcf1473b',
    '2023-06-17 16:31:52.247561',
    '2023-06-17 16:31:52.247561',
    NULL,
    '45565177',
    'invoice transaction at Mante - Crona using card ending with ***(...5494) for MRO 8.69 in account ***56225909',
    279,
    279,
    'a9a028c0-2b2b-43d7-8c59-2ed00f179c6d'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'cbb4c6df-ce41-461e-aaae-4b2d36527543',
    '2023-06-17 16:31:52.077107',
    '2023-06-17 16:31:52.077107',
    NULL,
    '02832893',
    'withdrawal transaction at Monahan and Sons using card ending with ***(...9598) for ETB 217.29 in account ***71945522',
    179,
    179,
    '3f31af9c-823d-44e0-bc3c-8400e2d97590'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'cc0dee71-57b7-4371-bacd-7f80425969fa',
    '2023-06-17 16:31:51.911213',
    '2023-06-17 16:31:51.911213',
    NULL,
    '79453446',
    'deposit transaction at Nicolas, Rodriguez and McCullough using card ending with ***(...2321) for UGX 932.94 in account ***83508319',
    118,
    118,
    '701c6234-2be7-4c35-822a-5e30812e1cd1'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'd275d13d-3969-4700-b306-34aad9051861',
    '2023-06-17 16:31:51.743530',
    '2023-06-17 16:31:51.743530',
    NULL,
    '16123133',
    'invoice transaction at Runolfsdottir - Ruecker using card ending with ***(...5271) for ZMW 453.23 in account ***69593184',
    352,
    352,
    'df8b1740-0f3c-4e66-a0b3-622f0388afb4'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'db84c557-aacc-4614-9cd0-534e129413b3',
    '2023-06-17 16:31:52.247561',
    '2023-06-17 16:31:52.247561',
    NULL,
    '09732623',
    'deposit transaction at Kirlin - Bartoletti using card ending with ***(...7118) for DKK 263.74 in account ***95707515',
    638,
    638,
    'a9a028c0-2b2b-43d7-8c59-2ed00f179c6d'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'dce34a3b-afc5-4a78-80e0-49726a3e978c',
    '2023-06-17 16:31:52.396613',
    '2023-06-17 16:31:52.396613',
    NULL,
    '94649515',
    'withdrawal transaction at Bayer - Goyette using card ending with ***(...5606) for JMD 775.31 in account ***31059752',
    807,
    807,
    '81f32d1a-447b-41bd-bcaa-a0c51cb1dcc2'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'dde22c3a-b040-48ee-8e95-c92bc5981da9',
    '2023-06-17 16:31:51.827548',
    '2023-06-17 16:31:51.827548',
    NULL,
    '22643965',
    'invoice transaction at Steuber, Kulas and Hudson using card ending with ***(...3004) for QAR 923.64 in account ***98931886',
    843,
    843,
    '007e5819-5d62-4106-aaa9-fe3436470934'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'e030830d-ac6d-4375-8b52-b3a297d8f19e',
    '2023-06-17 16:31:51.743530',
    '2023-06-17 16:31:51.743530',
    NULL,
    '17559975',
    'withdrawal transaction at Veum LLC using card ending with ***(...0994) for PLN 961.75 in account ***07698707',
    511,
    511,
    'df8b1740-0f3c-4e66-a0b3-622f0388afb4'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'e46eab35-7c07-4146-a580-6a4f7ff56fbc',
    '2023-06-17 16:31:51.827548',
    '2023-06-17 16:31:51.827548',
    NULL,
    '24980934',
    'invoice transaction at Feil - Mertz using card ending with ***(...0132) for TRY 587.27 in account ***65013427',
    523,
    523,
    '007e5819-5d62-4106-aaa9-fe3436470934'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'e97bd012-7649-4aba-867b-b7e7f6d3f929',
    '2023-06-17 16:31:52.322933',
    '2023-06-17 16:31:52.322933',
    NULL,
    '93592790',
    'deposit transaction at Hartmann Group using card ending with ***(...4280) for AZN 649.99 in account ***94845310',
    444,
    444,
    'e23400e5-0426-42c0-a7c2-d30cddd6fd0a'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'ecc77d20-dee5-44a5-96cd-a62c09b57cf9',
    '2023-06-17 16:31:51.999053',
    '2023-06-17 16:31:51.999053',
    NULL,
    '95173304',
    'withdrawal transaction at Glover Inc using card ending with ***(...3781) for MDL 858.52 in account ***01873811',
    179,
    179,
    'f1e586eb-8b17-46ae-8e09-67d834629a12'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'eefaf844-769b-49b5-a48c-e00f30882f0b',
    '2023-06-17 16:31:52.150034',
    '2023-06-17 16:31:52.150034',
    NULL,
    '37803613',
    'withdrawal transaction at Gutmann LLC using card ending with ***(...1553) for BRL 660.62 in account ***32115708',
    128,
    128,
    '42c6ba15-21e1-41ad-844b-04eb6a749de0'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'f7770b98-349f-46b7-a5b2-114c58a56706',
    '2023-06-17 16:31:52.322933',
    '2023-06-17 16:31:52.322933',
    NULL,
    '47930782',
    'deposit transaction at Bernier - Kling using card ending with ***(...4867) for RSD 817.57 in account ***82867330',
    682,
    682,
    'e23400e5-0426-42c0-a7c2-d30cddd6fd0a'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'f7d8a4f4-a15b-4fa2-9a96-b162068fabb8',
    '2023-06-17 16:31:51.999053',
    '2023-06-17 16:31:51.999053',
    NULL,
    '78700659',
    'invoice transaction at Cole LLC using card ending with ***(...7629) for LYD 589.59 in account ***45460782',
    386,
    386,
    'f1e586eb-8b17-46ae-8e09-67d834629a12'
  );
INSERT INTO
  `comprobante_diario_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroCuenta`,
    `descripcion`,
    `parcial`,
    `debito`,
    `comprobanteDiarioId`
  )
VALUES
  (
    'fbeb2288-70d3-4cd4-ab75-1ac7de274376',
    '2023-06-17 16:31:51.911213',
    '2023-06-17 16:31:51.911213',
    NULL,
    '91366018',
    'invoice transaction at Hermiston - Bashirian using card ending with ***(...5873) for GBP 306.82 in account ***65230253',
    137,
    137,
    '701c6234-2be7-4c35-822a-5e30812e1cd1'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dinamico
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: documento
# ------------------------------------------------------------

INSERT INTO
  `documento` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `empresaId`
  )
VALUES
  (
    '069f89f8-74d9-495d-bf5a-2904a02f0c0b',
    '2023-06-17 16:31:51.867052',
    '2023-06-17 16:31:51.867052',
    NULL,
    'f058dffd-7c31-413d-a95a-f304ab57590c'
  );
INSERT INTO
  `documento` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `empresaId`
  )
VALUES
  (
    '1fafb0d9-e888-4852-8012-9dd9e6f005d4',
    '2023-06-17 16:31:51.963456',
    '2023-06-17 16:31:51.963456',
    NULL,
    '680fd0ce-0c10-4c93-80f6-7b5cb0f9f864'
  );
INSERT INTO
  `documento` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `empresaId`
  )
VALUES
  (
    '293a1160-c03f-4699-b5ca-1700cfe60622',
    '2023-06-17 16:31:52.115801',
    '2023-06-17 16:31:52.115801',
    NULL,
    '680fd0ce-0c10-4c93-80f6-7b5cb0f9f864'
  );
INSERT INTO
  `documento` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `empresaId`
  )
VALUES
  (
    '378e9fcf-0136-4460-b0ff-8a2c64d45752',
    '2023-06-17 16:31:52.288448',
    '2023-06-17 16:31:52.288448',
    NULL,
    'b1ddbbbf-649d-4359-ba8c-1e80bac2b7bc'
  );
INSERT INTO
  `documento` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `empresaId`
  )
VALUES
  (
    '3bbc0fdb-34b7-498e-8770-2a536a3293ab',
    '2023-06-17 16:31:51.793753',
    '2023-06-17 16:31:51.793753',
    NULL,
    'f058dffd-7c31-413d-a95a-f304ab57590c'
  );
INSERT INTO
  `documento` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `empresaId`
  )
VALUES
  (
    '3f72b70d-316c-4126-b578-790052c38078',
    '2023-06-17 16:31:52.364920',
    '2023-06-17 16:31:52.364920',
    NULL,
    'b1ddbbbf-649d-4359-ba8c-1e80bac2b7bc'
  );
INSERT INTO
  `documento` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `empresaId`
  )
VALUES
  (
    '65fb4b18-24ed-4d0c-b753-4fee295dfbe2',
    '2023-06-17 16:31:52.212111',
    '2023-06-17 16:31:52.212111',
    NULL,
    'b1ddbbbf-649d-4359-ba8c-1e80bac2b7bc'
  );
INSERT INTO
  `documento` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `empresaId`
  )
VALUES
  (
    '9be530ed-61d2-429a-82d8-0691038ee152',
    '2023-06-17 16:31:52.038234',
    '2023-06-17 16:31:52.038234',
    NULL,
    '680fd0ce-0c10-4c93-80f6-7b5cb0f9f864'
  );
INSERT INTO
  `documento` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `empresaId`
  )
VALUES
  (
    'e354895e-1cf3-4421-a0f8-0a4ca0149929',
    '2023-06-17 16:31:51.698634',
    '2023-06-17 16:31:51.698634',
    NULL,
    'f058dffd-7c31-413d-a95a-f304ab57590c'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: empresa
# ------------------------------------------------------------

INSERT INTO
  `empresa` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `descripcion`,
    `ruc`,
    `telefono`
  )
VALUES
  (
    '680fd0ce-0c10-4c93-80f6-7b5cb0f9f864',
    '2023-06-17 16:31:51.954068',
    '2023-06-17 16:31:51.954068',
    NULL,
    'Shanahan, White and Schmidt',
    'multimedia',
    '8443328491860',
    '953-998-9497'
  );
INSERT INTO
  `empresa` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `descripcion`,
    `ruc`,
    `telefono`
  )
VALUES
  (
    'b1ddbbbf-649d-4359-ba8c-1e80bac2b7bc',
    '2023-06-17 16:31:52.196269',
    '2023-06-17 16:31:52.196269',
    NULL,
    'Bradtke Group',
    'optimal',
    '1834569416187',
    '1-490-333-6180 x609'
  );
INSERT INTO
  `empresa` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `descripcion`,
    `ruc`,
    `telefono`
  )
VALUES
  (
    'f058dffd-7c31-413d-a95a-f304ab57590c',
    '2023-06-17 16:31:51.685586',
    '2023-06-17 16:31:51.685586',
    NULL,
    'Powlowski - Carter',
    'content-based',
    '1187443566832',
    '424-221-2153 x82804'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: estatico
# ------------------------------------------------------------

INSERT INTO
  `estatico` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `documentoId`
  )
VALUES
  (
    '1fa045c3-14c6-458b-8774-af47f76e6e4a',
    '2023-06-17 16:31:52.055431',
    '2023-06-17 16:31:52.055431',
    NULL,
    '9be530ed-61d2-429a-82d8-0691038ee152'
  );
INSERT INTO
  `estatico` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `documentoId`
  )
VALUES
  (
    '2f7827fb-56d0-45ef-b632-e92142bdf991',
    '2023-06-17 16:31:52.125295',
    '2023-06-17 16:31:52.125295',
    NULL,
    '293a1160-c03f-4699-b5ca-1700cfe60622'
  );
INSERT INTO
  `estatico` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `documentoId`
  )
VALUES
  (
    '3fc46eea-81b6-491c-b24f-0c2e13653b2d',
    '2023-06-17 16:31:51.803239',
    '2023-06-17 16:31:51.803239',
    NULL,
    '3bbc0fdb-34b7-498e-8770-2a536a3293ab'
  );
INSERT INTO
  `estatico` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `documentoId`
  )
VALUES
  (
    '45185f32-7491-40ae-8f79-985864aa0a19',
    '2023-06-17 16:31:51.876136',
    '2023-06-17 16:31:51.876136',
    NULL,
    '069f89f8-74d9-495d-bf5a-2904a02f0c0b'
  );
INSERT INTO
  `estatico` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `documentoId`
  )
VALUES
  (
    '65976b4d-a804-4a58-b11d-9ecd47aca19c',
    '2023-06-17 16:31:51.711061',
    '2023-06-17 16:31:51.711061',
    NULL,
    'e354895e-1cf3-4421-a0f8-0a4ca0149929'
  );
INSERT INTO
  `estatico` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `documentoId`
  )
VALUES
  (
    '70a70a13-5bb1-4510-88ee-421c554a9cc5',
    '2023-06-17 16:31:52.372820',
    '2023-06-17 16:31:52.372820',
    NULL,
    '3f72b70d-316c-4126-b578-790052c38078'
  );
INSERT INTO
  `estatico` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `documentoId`
  )
VALUES
  (
    'aa78a1d4-0f3a-4c69-a32a-5a6e428d76cc',
    '2023-06-17 16:31:52.221514',
    '2023-06-17 16:31:52.221514',
    NULL,
    '65fb4b18-24ed-4d0c-b753-4fee295dfbe2'
  );
INSERT INTO
  `estatico` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `documentoId`
  )
VALUES
  (
    'c25c1f9f-825f-44e1-8545-35f48db4950e',
    '2023-06-17 16:31:51.974034',
    '2023-06-17 16:31:51.974034',
    NULL,
    '1fafb0d9-e888-4852-8012-9dd9e6f005d4'
  );
INSERT INTO
  `estatico` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `documentoId`
  )
VALUES
  (
    'c92115a1-79e3-42b1-bced-d87d03df385d',
    '2023-06-17 16:31:52.297452',
    '2023-06-17 16:31:52.297452',
    NULL,
    '378e9fcf-0136-4460-b0ff-8a2c64d45752'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: factura
# ------------------------------------------------------------

INSERT INTO
  `factura` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `fecha`,
    `nombre`,
    `estaticoId`
  )
VALUES
  (
    '0be39f86-d96b-47d5-abf0-f420f57b22bb',
    '2023-06-17 16:31:52.337063',
    '2023-06-17 16:31:52.337063',
    NULL,
    '2022-08-06 11:09:51',
    'Savings Account',
    'c92115a1-79e3-42b1-bced-d87d03df385d'
  );
INSERT INTO
  `factura` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `fecha`,
    `nombre`,
    `estaticoId`
  )
VALUES
  (
    '56328160-dfeb-40bf-a497-1c39e63e2740',
    '2023-06-17 16:31:52.015703',
    '2023-06-17 16:31:52.015703',
    NULL,
    '2023-01-09 11:21:37',
    'Personal Loan Account',
    'c25c1f9f-825f-44e1-8545-35f48db4950e'
  );
INSERT INTO
  `factura` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `fecha`,
    `nombre`,
    `estaticoId`
  )
VALUES
  (
    '7948add7-6264-42ef-b1ff-6e76b1fdea24',
    '2023-06-17 16:31:51.837777',
    '2023-06-17 16:31:51.837777',
    NULL,
    '2022-08-09 02:15:28',
    'Home Loan Account',
    '3fc46eea-81b6-491c-b24f-0c2e13653b2d'
  );
INSERT INTO
  `factura` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `fecha`,
    `nombre`,
    `estaticoId`
  )
VALUES
  (
    '7f596153-c187-4592-b6f0-e9021670479d',
    '2023-06-17 16:31:52.261711',
    '2023-06-17 16:31:52.261711',
    NULL,
    '2023-01-23 10:02:02',
    'Checking Account',
    'aa78a1d4-0f3a-4c69-a32a-5a6e428d76cc'
  );
INSERT INTO
  `factura` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `fecha`,
    `nombre`,
    `estaticoId`
  )
VALUES
  (
    '8f81231d-00d5-426b-8c1a-058b5e52d61f',
    '2023-06-17 16:31:52.089350',
    '2023-06-17 16:31:52.089350',
    NULL,
    '2022-06-22 22:27:50',
    'Savings Account',
    '1fa045c3-14c6-458b-8774-af47f76e6e4a'
  );
INSERT INTO
  `factura` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `fecha`,
    `nombre`,
    `estaticoId`
  )
VALUES
  (
    '9b9105c7-efbd-49ef-b6c7-ff5b8668a914',
    '2023-06-17 16:31:51.759399',
    '2023-06-17 16:31:51.759399',
    NULL,
    '2022-08-09 21:25:36',
    'Money Market Account',
    '65976b4d-a804-4a58-b11d-9ecd47aca19c'
  );
INSERT INTO
  `factura` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `fecha`,
    `nombre`,
    `estaticoId`
  )
VALUES
  (
    'd34a045b-5146-4d6f-abd6-cfff53bc1dbd',
    '2023-06-17 16:31:52.161885',
    '2023-06-17 16:31:52.161885',
    NULL,
    '2022-08-23 20:46:44',
    'Personal Loan Account',
    '2f7827fb-56d0-45ef-b632-e92142bdf991'
  );
INSERT INTO
  `factura` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `fecha`,
    `nombre`,
    `estaticoId`
  )
VALUES
  (
    'e45eec31-79f5-42fa-beb3-6f3fc5ad7761',
    '2023-06-17 16:31:52.407408',
    '2023-06-17 16:31:52.407408',
    NULL,
    '2023-04-16 00:11:37',
    'Credit Card Account',
    '70a70a13-5bb1-4510-88ee-421c554a9cc5'
  );
INSERT INTO
  `factura` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `fecha`,
    `nombre`,
    `estaticoId`
  )
VALUES
  (
    'f670428d-f785-4b4a-a41c-84c23200a7b2',
    '2023-06-17 16:31:51.922460',
    '2023-06-17 16:31:51.922460',
    NULL,
    '2023-06-09 05:36:55',
    'Home Loan Account',
    '45185f32-7491-40ae-8f79-985864aa0a19'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: factura_item
# ------------------------------------------------------------

INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '01aadb98-81b5-42b8-bc4f-2fb996f61a4a',
    '2023-06-17 16:31:51.777176',
    '2023-06-17 16:31:51.777176',
    NULL,
    '06797119',
    'invoice transaction at Deckow - Pfannerstill using card ending with ***(...0807) for MUR 264.51 in account ***65131994',
    971,
    971,
    971,
    '9b9105c7-efbd-49ef-b6c7-ff5b8668a914'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '02f0c6ba-2ad1-4d59-a28b-5e2e2ef56b4e',
    '2023-06-17 16:31:52.180277',
    '2023-06-17 16:31:52.180277',
    NULL,
    '70087276',
    'payment transaction at Greenfelder, Medhurst and Corwin using card ending with ***(...8862) for MRO 140.57 in account ***51147211',
    507,
    507,
    507,
    'd34a045b-5146-4d6f-abd6-cfff53bc1dbd'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '328968c0-c728-48f2-bae4-b1a3d594bb90',
    '2023-06-17 16:31:52.420399',
    '2023-06-17 16:31:52.420399',
    NULL,
    '54538802',
    'payment transaction at Dickens, Borer and Lindgren using card ending with ***(...9037) for SEK 431.56 in account ***25862076',
    632,
    632,
    632,
    'e45eec31-79f5-42fa-beb3-6f3fc5ad7761'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '36877a11-80cb-41c4-9614-7c3298f5fd03',
    '2023-06-17 16:31:51.853691',
    '2023-06-17 16:31:51.853691',
    NULL,
    '90366231',
    'payment transaction at Lakin - Pfannerstill using card ending with ***(...7954) for TRY 920.84 in account ***68832420',
    722,
    722,
    722,
    '7948add7-6264-42ef-b1ff-6e76b1fdea24'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '43f9dad1-483e-4cb3-aafb-4dc27a650450',
    '2023-06-17 16:31:52.420399',
    '2023-06-17 16:31:52.420399',
    NULL,
    '43182533',
    'invoice transaction at Thiel Group using card ending with ***(...7003) for TOP 983.45 in account ***01633934',
    303,
    303,
    303,
    'e45eec31-79f5-42fa-beb3-6f3fc5ad7761'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '49591b4c-f4f0-46f1-b0b8-3d029c470bea',
    '2023-06-17 16:31:52.352975',
    '2023-06-17 16:31:52.352975',
    NULL,
    '00068838',
    'invoice transaction at Kertzmann - Emmerich using card ending with ***(...3606) for OMR 850.25 in account ***82489829',
    364,
    364,
    364,
    '0be39f86-d96b-47d5-abf0-f420f57b22bb'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '50e1bb90-a9a3-4559-8230-e0e63410dc01',
    '2023-06-17 16:31:52.180277',
    '2023-06-17 16:31:52.180277',
    NULL,
    '06112912',
    'withdrawal transaction at Goyette - Jones using card ending with ***(...0892) for OMR 966.21 in account ***13089985',
    283,
    283,
    283,
    'd34a045b-5146-4d6f-abd6-cfff53bc1dbd'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '548ce6df-4f28-4077-91c8-a857805fdfe2',
    '2023-06-17 16:31:51.853691',
    '2023-06-17 16:31:51.853691',
    NULL,
    '25109320',
    'invoice transaction at Aufderhar - Muller using card ending with ***(...4979) for BZD 214.49 in account ***50371145',
    779,
    779,
    779,
    '7948add7-6264-42ef-b1ff-6e76b1fdea24'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '555c8a68-33a7-4984-be68-0fd17b316939',
    '2023-06-17 16:31:52.352975',
    '2023-06-17 16:31:52.352975',
    NULL,
    '85524960',
    'payment transaction at Kuvalis, Skiles and Bogan using card ending with ***(...4450) for IQD 351.83 in account ***92453508',
    716,
    716,
    716,
    '0be39f86-d96b-47d5-abf0-f420f57b22bb'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '56f8b8a2-3416-4cec-9c1c-a0a7449e20f1',
    '2023-06-17 16:31:52.277281',
    '2023-06-17 16:31:52.277281',
    NULL,
    '81362762',
    'payment transaction at Rice - Conroy using card ending with ***(...4210) for PKR 341.65 in account ***14798676',
    20,
    20,
    20,
    '7f596153-c187-4592-b6f0-e9021670479d'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '60906010-018c-45f8-a005-ca620fa712bc',
    '2023-06-17 16:31:52.277281',
    '2023-06-17 16:31:52.277281',
    NULL,
    '28700889',
    'payment transaction at Schuster - Parisian using card ending with ***(...2728) for NOK 820.88 in account ***49044421',
    955,
    955,
    955,
    '7f596153-c187-4592-b6f0-e9021670479d'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '610f9948-4b41-4db0-992b-10b426f56557',
    '2023-06-17 16:31:52.420399',
    '2023-06-17 16:31:52.420399',
    NULL,
    '52146546',
    'withdrawal transaction at Boyle - Waters using card ending with ***(...2916) for SZL 342.78 in account ***57439881',
    456,
    456,
    456,
    'e45eec31-79f5-42fa-beb3-6f3fc5ad7761'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '64d958a0-f66c-43ab-ab93-f0644150d379',
    '2023-06-17 16:31:52.027928',
    '2023-06-17 16:31:52.027928',
    NULL,
    '45991354',
    'payment transaction at Grimes - Keebler using card ending with ***(...8787) for INR 403.02 in account ***25886101',
    115,
    115,
    115,
    '56328160-dfeb-40bf-a497-1c39e63e2740'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '661da9ec-afad-43d0-ac55-4976e17ac117',
    '2023-06-17 16:31:51.853691',
    '2023-06-17 16:31:51.853691',
    NULL,
    '87739603',
    'withdrawal transaction at Ziemann, Legros and Senger using card ending with ***(...4861) for KWD 212.73 in account ***48266510',
    150,
    150,
    150,
    '7948add7-6264-42ef-b1ff-6e76b1fdea24'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '686cbc57-2b5c-4d09-8c09-81b9b92bb5a0',
    '2023-06-17 16:31:52.027928',
    '2023-06-17 16:31:52.027928',
    NULL,
    '92411860',
    'deposit transaction at Cole, Jakubowski and Flatley using card ending with ***(...6830) for CUP 589.32 in account ***47138324',
    950,
    950,
    950,
    '56328160-dfeb-40bf-a497-1c39e63e2740'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '6ff05992-7792-4e13-af22-cca365109107',
    '2023-06-17 16:31:52.352975',
    '2023-06-17 16:31:52.352975',
    NULL,
    '42573691',
    'invoice transaction at Will, Hoppe and Bergstrom using card ending with ***(...6382) for NIO 212.29 in account ***56121356',
    949,
    949,
    949,
    '0be39f86-d96b-47d5-abf0-f420f57b22bb'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '779a934f-a0c7-4955-908a-4e0f6ff130bd',
    '2023-06-17 16:31:51.777176',
    '2023-06-17 16:31:51.777176',
    NULL,
    '42019919',
    'invoice transaction at Gleason - Miller using card ending with ***(...3922) for CDF 839.76 in account ***54055528',
    346,
    346,
    346,
    '9b9105c7-efbd-49ef-b6c7-ff5b8668a914'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '7f5166f4-99db-43b0-bc69-f7f6cf6fe56d',
    '2023-06-17 16:31:51.939878',
    '2023-06-17 16:31:51.939878',
    NULL,
    '48782090',
    'deposit transaction at Beahan - Grady using card ending with ***(...9979) for CNY 624.58 in account ***76673306',
    452,
    452,
    452,
    'f670428d-f785-4b4a-a41c-84c23200a7b2'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '875a3412-5977-4914-a41c-92e9088a6751',
    '2023-06-17 16:31:52.103579',
    '2023-06-17 16:31:52.103579',
    NULL,
    '02190778',
    'payment transaction at Okuneva, Heller and Jones using card ending with ***(...2889) for QAR 101.10 in account ***26825137',
    80,
    80,
    80,
    '8f81231d-00d5-426b-8c1a-058b5e52d61f'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '8a37e9e7-438f-4f4d-a178-116769ef38ce',
    '2023-06-17 16:31:52.027928',
    '2023-06-17 16:31:52.027928',
    NULL,
    '94844545',
    'deposit transaction at Spencer Inc using card ending with ***(...5273) for GTQ 839.18 in account ***48724604',
    940,
    940,
    940,
    '56328160-dfeb-40bf-a497-1c39e63e2740'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '924fcd21-40ac-4ada-bfaf-febea0a6bd30',
    '2023-06-17 16:31:52.103579',
    '2023-06-17 16:31:52.103579',
    NULL,
    '15319864',
    'deposit transaction at Dickens - Berge using card ending with ***(...3886) for XTS 179.65 in account ***98252735',
    276,
    276,
    276,
    '8f81231d-00d5-426b-8c1a-058b5e52d61f'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    '93d22fe4-d3f4-4dc8-9971-83ebbe92a1bb',
    '2023-06-17 16:31:52.103579',
    '2023-06-17 16:31:52.103579',
    NULL,
    '15503823',
    'invoice transaction at D\'Amore Inc using card ending with ***(...4767) for AOA 908.40 in account ***59857058',
    586,
    586,
    586,
    '8f81231d-00d5-426b-8c1a-058b5e52d61f'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'a54b0f89-7f62-4e0a-a775-afd4ca5a911f',
    '2023-06-17 16:31:52.277281',
    '2023-06-17 16:31:52.277281',
    NULL,
    '19928655',
    'withdrawal transaction at Pfeffer - Bashirian using card ending with ***(...1070) for NGN 132.85 in account ***86268398',
    62,
    62,
    62,
    '7f596153-c187-4592-b6f0-e9021670479d'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'a870cdd9-9058-4956-af17-04818b755c4a',
    '2023-06-17 16:31:52.352975',
    '2023-06-17 16:31:52.352975',
    NULL,
    '75117811',
    'payment transaction at Spencer, Baumbach and Morissette using card ending with ***(...5394) for BIF 131.26 in account ***69695070',
    131,
    131,
    131,
    '0be39f86-d96b-47d5-abf0-f420f57b22bb'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'a88e4ef9-8072-448e-965b-51962b4015b5',
    '2023-06-17 16:31:52.103579',
    '2023-06-17 16:31:52.103579',
    NULL,
    '12576840',
    'withdrawal transaction at Torp LLC using card ending with ***(...2473) for KYD 417.67 in account ***47065240',
    809,
    809,
    809,
    '8f81231d-00d5-426b-8c1a-058b5e52d61f'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'a99a6231-03ad-4a96-91d9-6826fba5389b',
    '2023-06-17 16:31:52.180277',
    '2023-06-17 16:31:52.180277',
    NULL,
    '80904547',
    'withdrawal transaction at Runte - Cartwright using card ending with ***(...3885) for SHP 110.87 in account ***14645415',
    166,
    166,
    166,
    'd34a045b-5146-4d6f-abd6-cfff53bc1dbd'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'ac75637c-7420-42f9-b2d5-b29649c73989',
    '2023-06-17 16:31:52.180277',
    '2023-06-17 16:31:52.180277',
    NULL,
    '10003213',
    'payment transaction at Gorczany - Zulauf using card ending with ***(...5917) for HTG 919.52 in account ***04292470',
    513,
    513,
    513,
    'd34a045b-5146-4d6f-abd6-cfff53bc1dbd'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'ad7331f7-1c60-457a-a175-694be2d9189e',
    '2023-06-17 16:31:52.420399',
    '2023-06-17 16:31:52.420399',
    NULL,
    '48944638',
    'deposit transaction at Pfannerstill and Sons using card ending with ***(...3082) for BWP 985.29 in account ***41955861',
    650,
    650,
    650,
    'e45eec31-79f5-42fa-beb3-6f3fc5ad7761'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'adb73b9b-55c0-43ec-beff-c99654154f0b',
    '2023-06-17 16:31:52.103579',
    '2023-06-17 16:31:52.103579',
    NULL,
    '70978761',
    'withdrawal transaction at Orn Group using card ending with ***(...7221) for XAU 424.30 in account ***38100039',
    587,
    587,
    587,
    '8f81231d-00d5-426b-8c1a-058b5e52d61f'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'b2237cac-ab46-4fc9-81c2-2b5d7131c4ef',
    '2023-06-17 16:31:51.939878',
    '2023-06-17 16:31:51.939878',
    NULL,
    '78368917',
    'withdrawal transaction at Cruickshank Inc using card ending with ***(...6335) for BTN 768.61 in account ***85418926',
    287,
    287,
    287,
    'f670428d-f785-4b4a-a41c-84c23200a7b2'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'b4373c74-4fae-4df5-adfb-8bd8d791d22d',
    '2023-06-17 16:31:52.180277',
    '2023-06-17 16:31:52.180277',
    NULL,
    '62845980',
    'payment transaction at Connelly - Conn using card ending with ***(...2005) for IDR 720.28 in account ***46509112',
    271,
    271,
    271,
    'd34a045b-5146-4d6f-abd6-cfff53bc1dbd'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'c5a334a1-5058-4eea-9fcd-25df628b840f',
    '2023-06-17 16:31:51.853691',
    '2023-06-17 16:31:51.853691',
    NULL,
    '10456846',
    'payment transaction at Johns, Wilderman and Reynolds using card ending with ***(...7506) for SHP 437.04 in account ***51547566',
    958,
    958,
    958,
    '7948add7-6264-42ef-b1ff-6e76b1fdea24'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'd489e548-2a4a-422f-8502-40573aa03b16',
    '2023-06-17 16:31:52.277281',
    '2023-06-17 16:31:52.277281',
    NULL,
    '84386822',
    'invoice transaction at Carroll, Effertz and Donnelly using card ending with ***(...6395) for MUR 974.79 in account ***53300026',
    274,
    274,
    274,
    '7f596153-c187-4592-b6f0-e9021670479d'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'd733b666-0834-44e4-86e4-85ecd34db27d',
    '2023-06-17 16:31:52.027928',
    '2023-06-17 16:31:52.027928',
    NULL,
    '87386714',
    'deposit transaction at Stroman - Doyle using card ending with ***(...5885) for SBD 264.78 in account ***87729526',
    599,
    599,
    599,
    '56328160-dfeb-40bf-a497-1c39e63e2740'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'd7381933-43d3-4034-8c95-48321780d45a',
    '2023-06-17 16:31:52.277281',
    '2023-06-17 16:31:52.277281',
    NULL,
    '47973051',
    'payment transaction at Gislason Inc using card ending with ***(...3987) for XFU 181.28 in account ***06865161',
    448,
    448,
    448,
    '7f596153-c187-4592-b6f0-e9021670479d'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'd7bf0734-1122-4b91-92ec-114e0fee05b8',
    '2023-06-17 16:31:51.853691',
    '2023-06-17 16:31:51.853691',
    NULL,
    '86508039',
    'withdrawal transaction at Romaguera, Mitchell and Pagac using card ending with ***(...7888) for LYD 454.68 in account ***00909229',
    890,
    890,
    890,
    '7948add7-6264-42ef-b1ff-6e76b1fdea24'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'd7dd87a1-0d51-4350-b66b-126da9977495',
    '2023-06-17 16:31:51.939878',
    '2023-06-17 16:31:51.939878',
    NULL,
    '07804154',
    'payment transaction at Ondricka, Cummerata and Muller using card ending with ***(...5029) for RUB 993.12 in account ***42770514',
    430,
    430,
    430,
    'f670428d-f785-4b4a-a41c-84c23200a7b2'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'da0e0d5d-603d-421a-a42d-29033037d126',
    '2023-06-17 16:31:51.939878',
    '2023-06-17 16:31:51.939878',
    NULL,
    '20930434',
    'invoice transaction at Zboncak - White using card ending with ***(...4512) for ZMW 21.18 in account ***14724384',
    715,
    715,
    715,
    'f670428d-f785-4b4a-a41c-84c23200a7b2'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'da0e26a7-3577-47f1-928c-133c9692bec9',
    '2023-06-17 16:31:51.777176',
    '2023-06-17 16:31:51.777176',
    NULL,
    '34460603',
    'payment transaction at Hintz Inc using card ending with ***(...1598) for FKP 288.46 in account ***78679251',
    179,
    179,
    179,
    '9b9105c7-efbd-49ef-b6c7-ff5b8668a914'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'da40eea0-fec5-403f-8573-b8d5603410c0',
    '2023-06-17 16:31:52.027928',
    '2023-06-17 16:31:52.027928',
    NULL,
    '82899913',
    'payment transaction at Kertzmann - Murray using card ending with ***(...8396) for TOP 912.49 in account ***01813765',
    394,
    394,
    394,
    '56328160-dfeb-40bf-a497-1c39e63e2740'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'db5cd733-011f-49ef-bc21-fb46d20a455b',
    '2023-06-17 16:31:51.939878',
    '2023-06-17 16:31:51.939878',
    NULL,
    '68703260',
    'invoice transaction at Homenick, Stamm and Abernathy using card ending with ***(...6217) for VES 758.02 in account ***88920197',
    672,
    672,
    672,
    'f670428d-f785-4b4a-a41c-84c23200a7b2'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'e235dba2-fa09-4495-b752-d1e8a7616831',
    '2023-06-17 16:31:52.420399',
    '2023-06-17 16:31:52.420399',
    NULL,
    '40012224',
    'deposit transaction at Fahey and Sons using card ending with ***(...5976) for CUC 825.97 in account ***59283103',
    689,
    689,
    689,
    'e45eec31-79f5-42fa-beb3-6f3fc5ad7761'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'e3d2e9c8-b30a-47c1-93d4-673d3d285175',
    '2023-06-17 16:31:52.352975',
    '2023-06-17 16:31:52.352975',
    NULL,
    '99966905',
    'withdrawal transaction at Bayer - Will using card ending with ***(...4278) for AWG 622.33 in account ***69473772',
    779,
    779,
    779,
    '0be39f86-d96b-47d5-abf0-f420f57b22bb'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'e9d4f5e7-8aaa-4de8-a998-76810736005e',
    '2023-06-17 16:31:51.777176',
    '2023-06-17 16:31:51.777176',
    NULL,
    '37756246',
    'payment transaction at Larkin, Maggio and Crona using card ending with ***(...2284) for PGK 322.46 in account ***16575015',
    512,
    512,
    512,
    '9b9105c7-efbd-49ef-b6c7-ff5b8668a914'
  );
INSERT INTO
  `factura_item` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `numeroFactura`,
    `descripcion`,
    `ventasExoneradas`,
    `ventasExentas`,
    `ventasGrabadas`,
    `facturaId`
  )
VALUES
  (
    'eba54012-6a83-4617-bc54-adfdda3bd605',
    '2023-06-17 16:31:51.777176',
    '2023-06-17 16:31:51.777176',
    NULL,
    '25266999',
    'invoice transaction at Kulas Group using card ending with ***(...2862) for ALL 903.41 in account ***09167251',
    833,
    833,
    833,
    '9b9105c7-efbd-49ef-b6c7-ff5b8668a914'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: feature_flag
# ------------------------------------------------------------

INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '0291eeaf-b733-4090-b7fb-004245a60d89',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Modulo comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '0a63e2d5-f65f-4db8-ac30-be2972786e56',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Modulo facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '15982359-8228-4328-a483-5f61727f32bc',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Editar clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '403488fe-2ab4-4781-bbfc-2829cc019811',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Crear clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '4678f211-508c-4731-8da6-10f3acca120d',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Historial clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '5881dd7e-870a-4078-9699-869f05c7e153',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Visualizar clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '591d00a4-230e-4eaa-8073-7cfeb10586b3',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Crear facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '737e21bf-98d7-4039-a2a2-26d687132e31',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Visualizar facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '7d8fcb68-b1fd-4dd0-996e-4232e4c33f72',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Borrar facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '81f3c1c7-721d-4db2-8e7a-b7a955600ad2',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Editar comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '8da55776-ab96-4c40-ab76-8e752ac3a0a0',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Editar facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '9476888e-1bbf-4bf7-b033-9898ca96d463',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Crear comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'a2b28c5e-29ec-4cec-bc8f-0279d7b87e83',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Borrar comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'bb1391b0-12ef-4751-8616-1a8093b7a3a4',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Historial facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'c58dc9c5-ca87-4b3c-a657-3eb31ed83d33',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Visualizar comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'e0263abf-9661-43fe-924c-a2a5213a25c3',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Historial comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'ec968710-290f-4054-b31b-dc3478a8ec56',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Modulo clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'f5cf4a65-8244-440b-82f6-daf7d7ffa816',
    '2023-06-17 16:31:51.636705',
    '2023-06-17 16:31:51.636705',
    NULL,
    'Borrar clientes'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: feature_flag_user
# ------------------------------------------------------------

INSERT INTO
  `feature_flag_user` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `usuarioId`,
    `featureFlagId`
  )
VALUES
  (
    '252a3cb4-ed4e-46bd-9560-38561456b2ee',
    '2023-06-17 16:31:51.661641',
    '2023-06-17 16:31:51.661641',
    NULL,
    '713debe4-737a-457d-b06c-d88dcdd505d5',
    'ec968710-290f-4054-b31b-dc3478a8ec56'
  );
INSERT INTO
  `feature_flag_user` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `usuarioId`,
    `featureFlagId`
  )
VALUES
  (
    '3059961f-9606-4c6e-8bff-7b489465a608',
    '2023-06-17 16:31:51.661641',
    '2023-06-17 16:31:51.661641',
    NULL,
    '915e2e99-7c70-4761-a407-75f4e733195f',
    'ec968710-290f-4054-b31b-dc3478a8ec56'
  );
INSERT INTO
  `feature_flag_user` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `usuarioId`,
    `featureFlagId`
  )
VALUES
  (
    '44db26e5-eba2-4ca4-a137-c992eeac7486',
    '2023-06-17 16:31:51.661641',
    '2023-06-17 16:31:51.661641',
    NULL,
    '915e2e99-7c70-4761-a407-75f4e733195f',
    '403488fe-2ab4-4781-bbfc-2829cc019811'
  );
INSERT INTO
  `feature_flag_user` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `usuarioId`,
    `featureFlagId`
  )
VALUES
  (
    'f6b350bd-994b-4572-99ac-9d5dbe0870f8',
    '2023-06-17 16:31:51.661641',
    '2023-06-17 16:31:51.661641',
    NULL,
    '713debe4-737a-457d-b06c-d88dcdd505d5',
    '5881dd7e-870a-4078-9699-869f05c7e153'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fila
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: historial_comprobante_diario
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: historial_factura
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

INSERT INTO
  `migrations` (`id`, `timestamp`, `name`)
VALUES
  (1, 1680832566475, 'baseTables1680832566475');
INSERT INTO
  `migrations` (`id`, `timestamp`, `name`)
VALUES
  (
    2,
    1681023949033,
    'alterFeatureFlagTable1681023949033'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: plantilla
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: rol
# ------------------------------------------------------------

INSERT INTO
  `rol` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`
  )
VALUES
  (
    '0c479969-1356-44cf-93b7-0adf9ff9332d',
    '2023-06-17 16:31:51.330649',
    '2023-06-17 16:31:51.330649',
    NULL,
    'Usuario'
  );
INSERT INTO
  `rol` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`
  )
VALUES
  (
    '9cf17f36-1924-4a19-a556-79b5c59f2d99',
    '2023-06-17 16:31:51.330649',
    '2023-06-17 16:31:51.330649',
    NULL,
    'Administrador'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: usuario
# ------------------------------------------------------------

INSERT INTO
  `usuario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `correo`,
    `password`,
    `rolId`,
    `activo`
  )
VALUES
  (
    '713debe4-737a-457d-b06c-d88dcdd505d5',
    '2023-06-17 16:31:51.602952',
    '2023-06-17 16:31:51.602952',
    NULL,
    'Luis',
    'luis@gmail.com',
    '$2b$10$kmLijmkyywI.6o2MHx6GdesIYPkFzsUgP4nPhyzptryxTpBxB5rDK',
    '0c479969-1356-44cf-93b7-0adf9ff9332d',
    1
  );
INSERT INTO
  `usuario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `correo`,
    `password`,
    `rolId`,
    `activo`
  )
VALUES
  (
    '915e2e99-7c70-4761-a407-75f4e733195f',
    '2023-06-17 16:31:51.602952',
    '2023-06-17 16:31:51.602952',
    NULL,
    'Fernanda',
    'fernanda@gmail.com',
    '$2b$10$swqgNBHywXK1GmepXLNTDu9Hu9QcsUcodwIkQ6SVV7Z5InvjYD4/u',
    '0c479969-1356-44cf-93b7-0adf9ff9332d',
    1
  );
INSERT INTO
  `usuario` (
    `id`,
    `createdAt`,
    `updatedAt`,
    `deletedAt`,
    `nombre`,
    `correo`,
    `password`,
    `rolId`,
    `activo`
  )
VALUES
  (
    'a14e0116-2132-403e-92f3-d6a01e1c6b5c',
    '2023-06-17 16:31:51.602952',
    '2023-06-17 16:31:51.602952',
    NULL,
    'Josue Lopez',
    'josue@gmail.com',
    '$2b$10$mObIwxHzo7npqTAA1Hl8EuZ5ahFxHPM.lkdjFxxpvcArMshBOLOuq',
    '9cf17f36-1924-4a19-a556-79b5c59f2d99',
    1
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
