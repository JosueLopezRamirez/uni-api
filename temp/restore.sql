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
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: comprobante_diario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `comprobante_diario` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `estaticoId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_27a2b029dab57295d56f24fcd13` (`estaticoId`),
  CONSTRAINT `FK_27a2b029dab57295d56f24fcd13` FOREIGN KEY (`estaticoId`) REFERENCES `estatico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: comprobante_diario_item
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `comprobante_diario_item` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `numeroCuenta` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `parcial` int(11) DEFAULT NULL,
  `debito` int(11) DEFAULT NULL,
  `comprobanteDiarioId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9ed0af5c5fa600cb2ff64d4d69c` (`comprobanteDiarioId`),
  CONSTRAINT `FK_9ed0af5c5fa600cb2ff64d4d69c` FOREIGN KEY (`comprobanteDiarioId`) REFERENCES `comprobante_diario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dinamico
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dinamico` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `documentoId` varchar(255) NOT NULL,
  `plantillaId` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5814e80f47010559b5a5bd345e4` (`documentoId`),
  KEY `FK_3b43f2c2e7e5f96a49715ec73da` (`plantillaId`),
  CONSTRAINT `FK_3b43f2c2e7e5f96a49715ec73da` FOREIGN KEY (`plantillaId`) REFERENCES `plantilla` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_5814e80f47010559b5a5bd345e4` FOREIGN KEY (`documentoId`) REFERENCES `documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: documento
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `documento` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `empresaId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6619e8c6c8b5b1d8631ebe0f8fd` (`empresaId`),
  CONSTRAINT `FK_6619e8c6c8b5b1d8631ebe0f8fd` FOREIGN KEY (`empresaId`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: empresa
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `ruc` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_dc656dc24f6986afbfe84ebf13` (`ruc`),
  UNIQUE KEY `IDX_3ab4bf8bb031ef45df7165a07f` (`telefono`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: estatico
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `estatico` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `documentoId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aa97ce017059b3cc024bba8db34` (`documentoId`),
  CONSTRAINT `FK_aa97ce017059b3cc024bba8db34` FOREIGN KEY (`documentoId`) REFERENCES `documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: factura
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `factura` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estaticoId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_17ba7d1cdb3124bd7848961aa84` (`estaticoId`),
  CONSTRAINT `FK_17ba7d1cdb3124bd7848961aa84` FOREIGN KEY (`estaticoId`) REFERENCES `estatico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: factura_item
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `factura_item` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `numeroFactura` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `ventasExoneradas` int(11) DEFAULT NULL,
  `ventasExentas` int(11) DEFAULT NULL,
  `ventasGrabadas` int(11) DEFAULT NULL,
  `facturaId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6d9e4410327e605ac464697bf7e` (`facturaId`),
  CONSTRAINT `FK_6d9e4410327e605ac464697bf7e` FOREIGN KEY (`facturaId`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: feature_flag
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `feature_flag` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_0cb1810eca363db1e0bf13c3cf` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: feature_flag_user
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `feature_flag_user` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `usuarioId` varchar(255) NOT NULL,
  `featureFlagId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_036abcf3897fc7c0d200b7226e5` (`usuarioId`),
  KEY `FK_7502bd30e336c4eb5ff455ec1d2` (`featureFlagId`),
  CONSTRAINT `FK_036abcf3897fc7c0d200b7226e5` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7502bd30e336c4eb5ff455ec1d2` FOREIGN KEY (`featureFlagId`) REFERENCES `feature_flag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fila
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fila` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `valor` text NOT NULL,
  `dinamicoId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e652922dc09c550f4888ee4f09d` (`dinamicoId`),
  CONSTRAINT `FK_e652922dc09c550f4888ee4f09d` FOREIGN KEY (`dinamicoId`) REFERENCES `dinamico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: historial_comprobante_diario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `historial_comprobante_diario` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `comprobanteDiarioId` varchar(255) NOT NULL,
  `usuarioId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d1cd116b9674b47f8cba415684d` (`comprobanteDiarioId`),
  KEY `FK_c51feb5d301aadad92ad3fba38c` (`usuarioId`),
  CONSTRAINT `FK_c51feb5d301aadad92ad3fba38c` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_d1cd116b9674b47f8cba415684d` FOREIGN KEY (`comprobanteDiarioId`) REFERENCES `comprobante_diario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: historial_factura
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `historial_factura` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `facturaId` varchar(255) NOT NULL,
  `usuarioId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_76578223a872c0b82d97823f0d1` (`facturaId`),
  KEY `FK_44b850aa88ded8f766b87d69b04` (`usuarioId`),
  CONSTRAINT `FK_44b850aa88ded8f766b87d69b04` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_76578223a872c0b82d97823f0d1` FOREIGN KEY (`facturaId`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: plantilla
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `plantilla` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `columnas` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: rol
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `rol` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_9792c580a992d554ee1621c5b4` (`nombre`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: usuario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` varchar(36) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rolId` varchar(255) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_349ecb64acc4355db443ca17cb` (`correo`),
  KEY `FK_611daf5befc024d9e0bd7bdf4da` (`rolId`),
  CONSTRAINT `FK_611daf5befc024d9e0bd7bdf4da` FOREIGN KEY (`rolId`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: backup
# ------------------------------------------------------------


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
    '0fcb1417-18b6-41df-abce-a0d0de3b8b9d',
    '2023-06-17 00:27:43.872124',
    '2023-06-17 00:27:43.872124',
    NULL,
    'Home Loan Account',
    '2023-02-21 05:54:43',
    'fe41b082-3248-4780-a482-e087fd3cf51c'
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
    '1783fdd2-303a-42b6-92c1-fb10677a3d8d',
    '2023-06-17 00:27:44.130661',
    '2023-06-17 00:27:44.130661',
    NULL,
    'Credit Card Account',
    '2022-07-10 08:29:24',
    'a9623274-da6b-42e5-a64d-c70bf27bbf93'
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
    '1ede4e76-4c46-4eae-8420-349b6ec0e7f6',
    '2023-06-17 00:27:44.405181',
    '2023-06-17 00:27:44.405181',
    NULL,
    'Credit Card Account',
    '2022-09-13 05:36:07',
    'cc489f9b-936a-437d-973e-1d6a7075b354'
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
    '3086833c-be03-424e-ae2f-71f1bb5400d1',
    '2023-06-17 00:27:44.234655',
    '2023-06-17 00:27:44.234655',
    NULL,
    'Credit Card Account',
    '2023-02-13 05:07:32',
    '2396d101-54b3-4b1b-a7b1-e199498e3fd1'
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
    '40cb6e89-7e56-42bf-9612-e0010d371014',
    '2023-06-17 00:27:44.031363',
    '2023-06-17 00:27:44.031363',
    NULL,
    'Money Market Account',
    '2022-11-01 14:21:53',
    'd3de92e6-19a4-479b-88c0-85e806b8f641'
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
    'c1cdc7c2-378c-4ea9-8505-cd594bfab425',
    '2023-06-17 00:27:43.947098',
    '2023-06-17 00:27:43.947098',
    NULL,
    'Personal Loan Account',
    '2023-03-17 14:51:14',
    '4de36e77-03d0-4b66-b550-ca3468850990'
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
    'd220da0b-ab77-48a8-8a95-4cd34ce842eb',
    '2023-06-17 00:27:44.468573',
    '2023-06-17 00:27:44.468573',
    NULL,
    'Savings Account',
    '2022-11-06 04:38:49',
    '31b60a1a-ddbc-4ff0-8df4-ae1747c39159'
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
    'd8c807c5-8645-402d-8a3f-874988e18826',
    '2023-06-17 00:27:44.321135',
    '2023-06-17 00:27:44.321135',
    NULL,
    'Personal Loan Account',
    '2022-10-21 12:04:31',
    '3f8c9f3c-2673-40c9-9cf4-7e0b8b6c2403'
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
    'eeaeba51-6fb8-4cdd-8225-ed17b8391dfe',
    '2023-06-17 00:27:43.754106',
    '2023-06-17 00:27:43.754106',
    NULL,
    'Investment Account',
    '2023-01-22 10:15:41',
    'e73cb9ac-04f7-4a66-9f89-ce93fe511a6e'
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
    '0236ddc1-a634-45b8-8722-1334a42b28bd',
    '2023-06-17 00:27:44.481452',
    '2023-06-17 00:27:44.481452',
    NULL,
    '57195780',
    'invoice transaction at Lockman, Schulist and Wehner using card ending with ***(...4534) for SDG 673.23 in account ***31576356',
    995,
    995,
    'd220da0b-ab77-48a8-8a95-4cd34ce842eb'
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
    '02fbb50e-59cc-4533-a7ff-72390ad9e54a',
    '2023-06-17 00:27:44.481452',
    '2023-06-17 00:27:44.481452',
    NULL,
    '24544748',
    'payment transaction at Parisian, Lang and Spinka using card ending with ***(...3517) for CDF 10.10 in account ***86164111',
    35,
    35,
    'd220da0b-ab77-48a8-8a95-4cd34ce842eb'
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
    '0b371bce-e8f3-4434-bc1b-4cdac8b9a52b',
    '2023-06-17 00:27:43.772897',
    '2023-06-17 00:27:43.772897',
    NULL,
    '48082697',
    'payment transaction at Franecki - Witting using card ending with ***(...9564) for BOB 232.09 in account ***31253940',
    591,
    591,
    'eeaeba51-6fb8-4cdd-8225-ed17b8391dfe'
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
    '10606c58-52f2-4d87-897f-c19555760423',
    '2023-06-17 00:27:44.150605',
    '2023-06-17 00:27:44.150605',
    NULL,
    '64015699',
    'withdrawal transaction at Herzog and Sons using card ending with ***(...0542) for CNY 149.61 in account ***76538179',
    511,
    511,
    '1783fdd2-303a-42b6-92c1-fb10677a3d8d'
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
    '223b2479-a934-4b9d-87ea-490c34ee7533',
    '2023-06-17 00:27:43.961718',
    '2023-06-17 00:27:43.961718',
    NULL,
    '59637316',
    'withdrawal transaction at Kunze - Heathcote using card ending with ***(...7595) for PLN 306.41 in account ***90522296',
    124,
    124,
    'c1cdc7c2-378c-4ea9-8505-cd594bfab425'
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
    '25c4d5a6-93a6-4319-a5d6-e723f56b2ec4',
    '2023-06-17 00:27:44.337541',
    '2023-06-17 00:27:44.337541',
    NULL,
    '64158882',
    'payment transaction at Goyette - Lowe using card ending with ***(...7629) for XAU 459.95 in account ***29276464',
    102,
    102,
    'd8c807c5-8645-402d-8a3f-874988e18826'
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
    '2635da3e-153e-4f1a-9243-5e2e7f8661e2',
    '2023-06-17 00:27:43.772897',
    '2023-06-17 00:27:43.772897',
    NULL,
    '20110517',
    'withdrawal transaction at Schuppe, Bosco and O\'Keefe using card ending with ***(...2053) for NGN 755.18 in account ***58381307',
    454,
    454,
    'eeaeba51-6fb8-4cdd-8225-ed17b8391dfe'
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
    '2d568c6d-f171-43f4-bac7-6e656a655269',
    '2023-06-17 00:27:43.772897',
    '2023-06-17 00:27:43.772897',
    NULL,
    '56321640',
    'deposit transaction at King and Sons using card ending with ***(...5810) for MVR 638.25 in account ***01191287',
    550,
    550,
    'eeaeba51-6fb8-4cdd-8225-ed17b8391dfe'
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
    '34b7f29a-0b65-4c11-a233-449a861e79ff',
    '2023-06-17 00:27:44.053588',
    '2023-06-17 00:27:44.053588',
    NULL,
    '94443045',
    'withdrawal transaction at Wisozk - Bergstrom using card ending with ***(...6231) for SGD 451.00 in account ***44031888',
    655,
    655,
    '40cb6e89-7e56-42bf-9612-e0010d371014'
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
    '35fb2ef4-9b79-4490-9614-b6eb8291282c',
    '2023-06-17 00:27:44.053588',
    '2023-06-17 00:27:44.053588',
    NULL,
    '66331282',
    'invoice transaction at Lindgren - Miller using card ending with ***(...1890) for SZL 919.04 in account ***15558957',
    252,
    252,
    '40cb6e89-7e56-42bf-9612-e0010d371014'
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
    '3e7f48fc-5d85-492c-b6f2-b2d62389431c',
    '2023-06-17 00:27:44.337541',
    '2023-06-17 00:27:44.337541',
    NULL,
    '43298064',
    'invoice transaction at Goodwin - Bins using card ending with ***(...8093) for LTL 388.38 in account ***57851808',
    212,
    212,
    'd8c807c5-8645-402d-8a3f-874988e18826'
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
    '4967bc6f-bc28-4d73-a04c-1853ad3bbbd1',
    '2023-06-17 00:27:43.886843',
    '2023-06-17 00:27:43.886843',
    NULL,
    '47881709',
    'deposit transaction at VonRueden Group using card ending with ***(...6090) for NPR 41.06 in account ***97314135',
    279,
    279,
    '0fcb1417-18b6-41df-abce-a0d0de3b8b9d'
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
    '527b4a17-d276-45ab-b081-32dc2b62e2a7',
    '2023-06-17 00:27:43.886843',
    '2023-06-17 00:27:43.886843',
    NULL,
    '41434851',
    'withdrawal transaction at Stroman - Gottlieb using card ending with ***(...4990) for BMD 880.62 in account ***66693279',
    610,
    610,
    '0fcb1417-18b6-41df-abce-a0d0de3b8b9d'
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
    '5354d516-3baf-4b82-a4c2-170dc48c73d6',
    '2023-06-17 00:27:44.417831',
    '2023-06-17 00:27:44.417831',
    NULL,
    '70791858',
    'payment transaction at Haag, Padberg and Keebler using card ending with ***(...6492) for GBP 730.71 in account ***00318586',
    912,
    912,
    '1ede4e76-4c46-4eae-8420-349b6ec0e7f6'
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
    '5900d08d-8e01-4c05-b655-b5f694cdbc99',
    '2023-06-17 00:27:43.886843',
    '2023-06-17 00:27:43.886843',
    NULL,
    '96213842',
    'invoice transaction at Ortiz Inc using card ending with ***(...4536) for LYD 78.75 in account ***83616434',
    517,
    517,
    '0fcb1417-18b6-41df-abce-a0d0de3b8b9d'
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
    '60033508-9731-40cf-90cd-430b8b480214',
    '2023-06-17 00:27:43.961718',
    '2023-06-17 00:27:43.961718',
    NULL,
    '34194754',
    'deposit transaction at Wuckert - Brakus using card ending with ***(...8504) for THB 257.70 in account ***83945471',
    31,
    31,
    'c1cdc7c2-378c-4ea9-8505-cd594bfab425'
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
    '64d15666-8adb-4f34-9476-9d0a9bbb1191',
    '2023-06-17 00:27:43.772897',
    '2023-06-17 00:27:43.772897',
    NULL,
    '21431020',
    'withdrawal transaction at Ziemann - Rutherford using card ending with ***(...8858) for SRD 845.49 in account ***00615906',
    140,
    140,
    'eeaeba51-6fb8-4cdd-8225-ed17b8391dfe'
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
    '695662ca-a520-4775-ab90-2448de0c9b6f',
    '2023-06-17 00:27:44.053588',
    '2023-06-17 00:27:44.053588',
    NULL,
    '51790724',
    'payment transaction at Larson - Mosciski using card ending with ***(...8487) for RWF 473.69 in account ***99488910',
    797,
    797,
    '40cb6e89-7e56-42bf-9612-e0010d371014'
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
    '6f433da4-bb9e-4ece-8e41-d36c25f2da17',
    '2023-06-17 00:27:43.886843',
    '2023-06-17 00:27:43.886843',
    NULL,
    '76016135',
    'payment transaction at Rosenbaum - Ward using card ending with ***(...4440) for PHP 381.84 in account ***03191112',
    282,
    282,
    '0fcb1417-18b6-41df-abce-a0d0de3b8b9d'
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
    '7176d9d7-6705-4d0f-916d-6bcc7df207eb',
    '2023-06-17 00:27:43.961718',
    '2023-06-17 00:27:43.961718',
    NULL,
    '02992502',
    'withdrawal transaction at Hahn - Romaguera using card ending with ***(...2304) for MXN 958.78 in account ***65836259',
    910,
    910,
    'c1cdc7c2-378c-4ea9-8505-cd594bfab425'
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
    '799034a1-d871-4d67-abd8-8a58f230b041',
    '2023-06-17 00:27:43.961718',
    '2023-06-17 00:27:43.961718',
    NULL,
    '41513857',
    'deposit transaction at Collier - Stark using card ending with ***(...3395) for PEN 435.65 in account ***71721721',
    144,
    144,
    'c1cdc7c2-378c-4ea9-8505-cd594bfab425'
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
    '7f38b2a4-0124-47b8-b35d-dab283440446',
    '2023-06-17 00:27:44.481452',
    '2023-06-17 00:27:44.481452',
    NULL,
    '81025839',
    'payment transaction at Rice - Stehr using card ending with ***(...0498) for XAF 715.17 in account ***04085809',
    479,
    479,
    'd220da0b-ab77-48a8-8a95-4cd34ce842eb'
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
    '8276ed99-0ce8-43fe-92fe-8b18dd366ce9',
    '2023-06-17 00:27:44.417831',
    '2023-06-17 00:27:44.417831',
    NULL,
    '78474483',
    'payment transaction at Padberg and Sons using card ending with ***(...0847) for SZL 401.77 in account ***08950626',
    189,
    189,
    '1ede4e76-4c46-4eae-8420-349b6ec0e7f6'
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
    '83785f3c-81b0-49d6-ab36-fbce6e6d602b',
    '2023-06-17 00:27:44.481452',
    '2023-06-17 00:27:44.481452',
    NULL,
    '08758880',
    'withdrawal transaction at Konopelski, Monahan and Gutmann using card ending with ***(...6295) for LBP 467.34 in account ***90488854',
    197,
    197,
    'd220da0b-ab77-48a8-8a95-4cd34ce842eb'
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
    '851a581a-b976-4ecc-ace0-aa24e066097c',
    '2023-06-17 00:27:44.337541',
    '2023-06-17 00:27:44.337541',
    NULL,
    '03003161',
    'deposit transaction at Glover Inc using card ending with ***(...0807) for BRL 530.28 in account ***25923889',
    360,
    360,
    'd8c807c5-8645-402d-8a3f-874988e18826'
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
    '8d70410b-71f5-4318-b957-afca4ef0c0c2',
    '2023-06-17 00:27:43.772897',
    '2023-06-17 00:27:43.772897',
    NULL,
    '16673948',
    'invoice transaction at Hoppe, Wuckert and Waters using card ending with ***(...1194) for MDL 375.86 in account ***83060544',
    741,
    741,
    'eeaeba51-6fb8-4cdd-8225-ed17b8391dfe'
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
    '92d292c7-c257-402f-aa0e-bf4e528504f8',
    '2023-06-17 00:27:44.053588',
    '2023-06-17 00:27:44.053588',
    NULL,
    '18132637',
    'invoice transaction at Romaguera, Kuphal and Wehner using card ending with ***(...8924) for CAD 913.96 in account ***84211028',
    367,
    367,
    '40cb6e89-7e56-42bf-9612-e0010d371014'
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
    '99624532-fea2-4a4f-8bfa-14988cc67110',
    '2023-06-17 00:27:43.961718',
    '2023-06-17 00:27:43.961718',
    NULL,
    '14787577',
    'payment transaction at Hackett - Jenkins using card ending with ***(...6279) for PYG 891.57 in account ***64736067',
    637,
    637,
    'c1cdc7c2-378c-4ea9-8505-cd594bfab425'
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
    '9f52783c-0f6f-45d9-85a6-dfa64aff01a4',
    '2023-06-17 00:27:44.150605',
    '2023-06-17 00:27:44.150605',
    NULL,
    '89573790',
    'withdrawal transaction at Wunsch, Roob and Littel using card ending with ***(...0474) for GIP 161.13 in account ***18250353',
    533,
    533,
    '1783fdd2-303a-42b6-92c1-fb10677a3d8d'
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
    'aeb0c403-5d99-4c76-8509-4b78f19c32e7',
    '2023-06-17 00:27:44.150605',
    '2023-06-17 00:27:44.150605',
    NULL,
    '15511682',
    'withdrawal transaction at Roob, Brekke and Romaguera using card ending with ***(...1614) for CZK 661.64 in account ***22393236',
    347,
    347,
    '1783fdd2-303a-42b6-92c1-fb10677a3d8d'
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
    'b25154a0-661d-49ad-945e-9c2222e0fc22',
    '2023-06-17 00:27:44.417831',
    '2023-06-17 00:27:44.417831',
    NULL,
    '90899911',
    'payment transaction at Mayer - Turcotte using card ending with ***(...1722) for AMD 701.38 in account ***43661794',
    932,
    932,
    '1ede4e76-4c46-4eae-8420-349b6ec0e7f6'
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
    'b90c79d7-d382-4f9d-9823-70b5840bf3c2',
    '2023-06-17 00:27:43.886843',
    '2023-06-17 00:27:43.886843',
    NULL,
    '76490263',
    'deposit transaction at Konopelski, Morissette and Beahan using card ending with ***(...5270) for BWP 389.21 in account ***70460383',
    585,
    585,
    '0fcb1417-18b6-41df-abce-a0d0de3b8b9d'
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
    'b90d36e3-f99a-4a8c-b6cb-274ccaa3e37e',
    '2023-06-17 00:27:44.150605',
    '2023-06-17 00:27:44.150605',
    NULL,
    '00804025',
    'invoice transaction at Boehm - Kihn using card ending with ***(...9393) for AWG 232.68 in account ***57070281',
    620,
    620,
    '1783fdd2-303a-42b6-92c1-fb10677a3d8d'
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
    'c2d8e3a1-b469-4407-894e-7fd52c28f1c4',
    '2023-06-17 00:27:44.150605',
    '2023-06-17 00:27:44.150605',
    NULL,
    '88538536',
    'withdrawal transaction at Farrell - Kuphal using card ending with ***(...5696) for GNF 501.32 in account ***07246536',
    869,
    869,
    '1783fdd2-303a-42b6-92c1-fb10677a3d8d'
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
    'ca5a15ab-7393-430d-8cf2-e851cf84e9de',
    '2023-06-17 00:27:44.250735',
    '2023-06-17 00:27:44.250735',
    NULL,
    '16933118',
    'deposit transaction at Weber, Halvorson and Reynolds using card ending with ***(...1362) for BYN 948.10 in account ***66367286',
    335,
    335,
    '3086833c-be03-424e-ae2f-71f1bb5400d1'
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
    'ccd7bea1-1804-49a6-849e-192129ce89cb',
    '2023-06-17 00:27:44.250735',
    '2023-06-17 00:27:44.250735',
    NULL,
    '44331913',
    'payment transaction at Grady LLC using card ending with ***(...3710) for MXN 134.42 in account ***07211156',
    560,
    560,
    '3086833c-be03-424e-ae2f-71f1bb5400d1'
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
    'cf0210db-fb07-4643-932d-12e0c2b832bd',
    '2023-06-17 00:27:44.337541',
    '2023-06-17 00:27:44.337541',
    NULL,
    '18082369',
    'payment transaction at Wilderman Inc using card ending with ***(...8334) for HNL 664.20 in account ***57770320',
    933,
    933,
    'd8c807c5-8645-402d-8a3f-874988e18826'
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
    'd3dc5749-c99f-4d8f-927e-c783a71d6bc5',
    '2023-06-17 00:27:44.250735',
    '2023-06-17 00:27:44.250735',
    NULL,
    '19637791',
    'withdrawal transaction at Schimmel, White and Johns using card ending with ***(...6113) for HNL 944.66 in account ***02139033',
    208,
    208,
    '3086833c-be03-424e-ae2f-71f1bb5400d1'
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
    'd807c407-2d6b-4273-b4c9-8685e1ddc8b7',
    '2023-06-17 00:27:44.417831',
    '2023-06-17 00:27:44.417831',
    NULL,
    '50615511',
    'invoice transaction at Toy, Romaguera and Gerlach using card ending with ***(...5423) for SHP 810.71 in account ***08203225',
    214,
    214,
    '1ede4e76-4c46-4eae-8420-349b6ec0e7f6'
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
    'dae609fe-8b04-4229-a4bf-870bdb5b6721',
    '2023-06-17 00:27:44.417831',
    '2023-06-17 00:27:44.417831',
    NULL,
    '70381769',
    'payment transaction at Nitzsche, Glover and Thiel using card ending with ***(...1730) for VND 785.35 in account ***41527705',
    361,
    361,
    '1ede4e76-4c46-4eae-8420-349b6ec0e7f6'
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
    'dbcfce24-b73e-476d-a342-a0403f18e75f',
    '2023-06-17 00:27:44.250735',
    '2023-06-17 00:27:44.250735',
    NULL,
    '33991946',
    'payment transaction at Witting - Sawayn using card ending with ***(...7856) for SHP 612.21 in account ***59250868',
    458,
    458,
    '3086833c-be03-424e-ae2f-71f1bb5400d1'
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
    'eb96981f-b7b6-473c-9350-c6ce46c5ca8f',
    '2023-06-17 00:27:44.250735',
    '2023-06-17 00:27:44.250735',
    NULL,
    '82214744',
    'payment transaction at Collins, Harris and Lynch using card ending with ***(...9700) for MDL 316.62 in account ***91652027',
    580,
    580,
    '3086833c-be03-424e-ae2f-71f1bb5400d1'
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
    'f209f624-4834-4945-b301-c9b5691e419b',
    '2023-06-17 00:27:44.481452',
    '2023-06-17 00:27:44.481452',
    NULL,
    '07631130',
    'payment transaction at Konopelski - Bayer using card ending with ***(...8566) for AED 93.11 in account ***04892297',
    616,
    616,
    'd220da0b-ab77-48a8-8a95-4cd34ce842eb'
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
    'f287a811-d98a-4437-aa5d-e805bb65819d',
    '2023-06-17 00:27:44.053588',
    '2023-06-17 00:27:44.053588',
    NULL,
    '51240073',
    'deposit transaction at Miller, Little and Mayer using card ending with ***(...6676) for AOA 572.21 in account ***07123580',
    23,
    23,
    '40cb6e89-7e56-42bf-9612-e0010d371014'
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
    'f43b09e3-9156-44a0-b52e-ee5526d2a72f',
    '2023-06-17 00:27:44.337541',
    '2023-06-17 00:27:44.337541',
    NULL,
    '71616045',
    'invoice transaction at Crooks, Rutherford and Mueller using card ending with ***(...4748) for ZAR 269.46 in account ***68192911',
    876,
    876,
    'd8c807c5-8645-402d-8a3f-874988e18826'
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
    '11fd6e0a-3efa-4cec-bf9d-33aeadb65db3',
    '2023-06-17 00:27:44.105909',
    '2023-06-17 00:27:44.105909',
    NULL,
    '43c065e3-1b0d-40a7-9b1f-898ce49efd20'
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
    '161abf41-4dc6-4e11-ae48-d3e5b7954824',
    '2023-06-17 00:27:44.301831',
    '2023-06-17 00:27:44.301831',
    NULL,
    '889d0663-084f-49c1-9e96-6430c9de9a8d'
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
    '36235540-aea3-4f53-983e-5e48f861533a',
    '2023-06-17 00:27:44.011479',
    '2023-06-17 00:27:44.011479',
    NULL,
    '43c065e3-1b0d-40a7-9b1f-898ce49efd20'
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
    '58ee87f7-c1cc-4300-ad01-85a9ba729f69',
    '2023-06-17 00:27:43.852008',
    '2023-06-17 00:27:43.852008',
    NULL,
    '784a264e-5ed4-4036-8ab5-82bcc7b1400f'
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
    '65b1004e-7149-403e-acff-5c2ffee77571',
    '2023-06-17 00:27:44.202713',
    '2023-06-17 00:27:44.202713',
    NULL,
    '43c065e3-1b0d-40a7-9b1f-898ce49efd20'
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
    '98ab361a-c6dc-4bd0-82f2-d1affb33f5bf',
    '2023-06-17 00:27:44.451829',
    '2023-06-17 00:27:44.451829',
    NULL,
    '889d0663-084f-49c1-9e96-6430c9de9a8d'
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
    '9f30aca9-be55-4ace-9e22-96455d7e9261',
    '2023-06-17 00:27:44.385919',
    '2023-06-17 00:27:44.385919',
    NULL,
    '889d0663-084f-49c1-9e96-6430c9de9a8d'
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
    'c421b454-9e98-4781-bcee-be240bae30c9',
    '2023-06-17 00:27:43.728139',
    '2023-06-17 00:27:43.728139',
    NULL,
    '784a264e-5ed4-4036-8ab5-82bcc7b1400f'
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
    'e47bfa8a-fdc9-446e-9bf2-fcd4c51bf9d8',
    '2023-06-17 00:27:43.924942',
    '2023-06-17 00:27:43.924942',
    NULL,
    '784a264e-5ed4-4036-8ab5-82bcc7b1400f'
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
    '43c065e3-1b0d-40a7-9b1f-898ce49efd20',
    '2023-06-17 00:27:44.001192',
    '2023-06-17 00:27:44.001192',
    NULL,
    'Rohan - Abbott',
    'dedicated',
    '4166174326497',
    '932.925.7778'
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
    '784a264e-5ed4-4036-8ab5-82bcc7b1400f',
    '2023-06-17 00:27:43.714051',
    '2023-06-17 00:27:43.714051',
    NULL,
    'Hirthe - Reichert',
    'zero administration',
    '8941748604164',
    '(712) 353-5194 x40284'
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
    '889d0663-084f-49c1-9e96-6430c9de9a8d',
    '2023-06-17 00:27:44.293427',
    '2023-06-17 00:27:44.293427',
    NULL,
    'Kautzer - Witting',
    'even-keeled',
    '5785889475913',
    '(402) 873-2061 x4041'
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
    '2396d101-54b3-4b1b-a7b1-e199498e3fd1',
    '2023-06-17 00:27:44.217374',
    '2023-06-17 00:27:44.217374',
    NULL,
    '65b1004e-7149-403e-acff-5c2ffee77571'
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
    '31b60a1a-ddbc-4ff0-8df4-ae1747c39159',
    '2023-06-17 00:27:44.462195',
    '2023-06-17 00:27:44.462195',
    NULL,
    '98ab361a-c6dc-4bd0-82f2-d1affb33f5bf'
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
    '3f8c9f3c-2673-40c9-9cf4-7e0b8b6c2403',
    '2023-06-17 00:27:44.312712',
    '2023-06-17 00:27:44.312712',
    NULL,
    '161abf41-4dc6-4e11-ae48-d3e5b7954824'
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
    '4de36e77-03d0-4b66-b550-ca3468850990',
    '2023-06-17 00:27:43.934612',
    '2023-06-17 00:27:43.934612',
    NULL,
    'e47bfa8a-fdc9-446e-9bf2-fcd4c51bf9d8'
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
    'a9623274-da6b-42e5-a64d-c70bf27bbf93',
    '2023-06-17 00:27:44.118384',
    '2023-06-17 00:27:44.118384',
    NULL,
    '11fd6e0a-3efa-4cec-bf9d-33aeadb65db3'
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
    'cc489f9b-936a-437d-973e-1d6a7075b354',
    '2023-06-17 00:27:44.397276',
    '2023-06-17 00:27:44.397276',
    NULL,
    '9f30aca9-be55-4ace-9e22-96455d7e9261'
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
    'd3de92e6-19a4-479b-88c0-85e806b8f641',
    '2023-06-17 00:27:44.019902',
    '2023-06-17 00:27:44.019902',
    NULL,
    '36235540-aea3-4f53-983e-5e48f861533a'
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
    'e73cb9ac-04f7-4a66-9f89-ce93fe511a6e',
    '2023-06-17 00:27:43.739036',
    '2023-06-17 00:27:43.739036',
    NULL,
    'c421b454-9e98-4781-bcee-be240bae30c9'
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
    'fe41b082-3248-4780-a482-e087fd3cf51c',
    '2023-06-17 00:27:43.864816',
    '2023-06-17 00:27:43.864816',
    NULL,
    '58ee87f7-c1cc-4300-ad01-85a9ba729f69'
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
    '1f2bb94c-a3e7-4bfa-87e3-e06e953539b7',
    '2023-06-17 00:27:44.070246',
    '2023-06-17 00:27:44.070246',
    NULL,
    '2023-04-09 17:40:57',
    'Credit Card Account',
    'd3de92e6-19a4-479b-88c0-85e806b8f641'
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
    '2d0ef741-d783-4aff-b0ca-0a2f7c2c63c8',
    '2023-06-17 00:27:44.489411',
    '2023-06-17 00:27:44.489411',
    NULL,
    '2022-07-24 16:24:50',
    'Personal Loan Account',
    '31b60a1a-ddbc-4ff0-8df4-ae1747c39159'
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
    '4a7c98e7-667b-4352-9085-b79f034aa08c',
    '2023-06-17 00:27:43.976571',
    '2023-06-17 00:27:43.976571',
    NULL,
    '2023-06-05 12:42:38',
    'Savings Account',
    '4de36e77-03d0-4b66-b550-ca3468850990'
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
    '7cc6cd3f-7d7a-4c4a-b4a4-7c4fa63a0386',
    '2023-06-17 00:27:43.816065',
    '2023-06-17 00:27:43.816065',
    NULL,
    '2022-09-18 21:00:12',
    'Personal Loan Account',
    'e73cb9ac-04f7-4a66-9f89-ce93fe511a6e'
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
    '7ffafadb-fa14-4d43-ac8b-73cddbbfa2da',
    '2023-06-17 00:27:44.167486',
    '2023-06-17 00:27:44.167486',
    NULL,
    '2022-07-26 13:10:09',
    'Checking Account',
    'a9623274-da6b-42e5-a64d-c70bf27bbf93'
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
    '9fcbd30e-c0ab-4b41-9f7c-3531d99b400d',
    '2023-06-17 00:27:44.431619',
    '2023-06-17 00:27:44.431619',
    NULL,
    '2022-11-05 09:52:49',
    'Credit Card Account',
    'cc489f9b-936a-437d-973e-1d6a7075b354'
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
    'd18395d0-274d-4e79-9a24-ed5e2a05baaa',
    '2023-06-17 00:27:44.266936',
    '2023-06-17 00:27:44.266936',
    NULL,
    '2023-05-22 08:17:32',
    'Home Loan Account',
    '2396d101-54b3-4b1b-a7b1-e199498e3fd1'
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
    'e4c8ac4c-bf88-4f60-80b7-61ed4ce84b86',
    '2023-06-17 00:27:44.354919',
    '2023-06-17 00:27:44.354919',
    NULL,
    '2022-08-01 10:36:09',
    'Money Market Account',
    '3f8c9f3c-2673-40c9-9cf4-7e0b8b6c2403'
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
    'eef346e1-3709-4539-8ace-409257114784',
    '2023-06-17 00:27:43.899953',
    '2023-06-17 00:27:43.899953',
    NULL,
    '2022-12-06 10:17:49',
    'Checking Account',
    'fe41b082-3248-4780-a482-e087fd3cf51c'
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
    '00bae374-38b3-44af-b474-7bf494c0be88',
    '2023-06-17 00:27:44.371228',
    '2023-06-17 00:27:44.371228',
    NULL,
    '16768433',
    'payment transaction at Hamill, Boehm and Effertz using card ending with ***(...9019) for GHS 307.79 in account ***47833865',
    216,
    216,
    216,
    'e4c8ac4c-bf88-4f60-80b7-61ed4ce84b86'
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
    '00d39027-324a-4b76-bf6f-250e92316436',
    '2023-06-17 00:27:44.183224',
    '2023-06-17 00:27:44.183224',
    NULL,
    '58648548',
    'invoice transaction at Rau - Stiedemann using card ending with ***(...1587) for IQD 383.96 in account ***39254579',
    878,
    878,
    878,
    '7ffafadb-fa14-4d43-ac8b-73cddbbfa2da'
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
    '05aa6a50-d668-4b5e-8afa-6e4852f281e3',
    '2023-06-17 00:27:44.183224',
    '2023-06-17 00:27:44.183224',
    NULL,
    '97537644',
    'withdrawal transaction at Dooley - Becker using card ending with ***(...9524) for XAF 933.49 in account ***83207426',
    264,
    264,
    264,
    '7ffafadb-fa14-4d43-ac8b-73cddbbfa2da'
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
    '08fc03c9-bd79-492a-9ae4-18fd86c85fd7',
    '2023-06-17 00:27:44.500937',
    '2023-06-17 00:27:44.500937',
    NULL,
    '62568557',
    'withdrawal transaction at Bogisich, Bernhard and Dare using card ending with ***(...4100) for IDR 571.33 in account ***32333779',
    855,
    855,
    855,
    '2d0ef741-d783-4aff-b0ca-0a2f7c2c63c8'
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
    '11e778c7-0268-4109-983c-f48e477c813c',
    '2023-06-17 00:27:44.439697',
    '2023-06-17 00:27:44.439697',
    NULL,
    '41721022',
    'payment transaction at Ratke Group using card ending with ***(...3499) for XCD 442.50 in account ***27449490',
    429,
    429,
    429,
    '9fcbd30e-c0ab-4b41-9f7c-3531d99b400d'
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
    '11e9f978-b246-49a0-bcaf-6cdab4b40631',
    '2023-06-17 00:27:43.987089',
    '2023-06-17 00:27:43.987089',
    NULL,
    '25780746',
    'deposit transaction at Nikolaus, Connelly and Barrows using card ending with ***(...8120) for TRY 140.77 in account ***01733926',
    911,
    911,
    911,
    '4a7c98e7-667b-4352-9085-b79f034aa08c'
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
    '1d484bff-9a40-4206-badb-8290570ee4f0',
    '2023-06-17 00:27:44.371228',
    '2023-06-17 00:27:44.371228',
    NULL,
    '81703372',
    'invoice transaction at Collins LLC using card ending with ***(...1922) for DOP 347.56 in account ***14934151',
    612,
    612,
    612,
    'e4c8ac4c-bf88-4f60-80b7-61ed4ce84b86'
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
    '2894cecc-60ad-4974-8c9a-2b12fbdf233e',
    '2023-06-17 00:27:44.281593',
    '2023-06-17 00:27:44.281593',
    NULL,
    '84265529',
    'payment transaction at Collins, Streich and Predovic using card ending with ***(...9401) for JOD 477.69 in account ***57845144',
    505,
    505,
    505,
    'd18395d0-274d-4e79-9a24-ed5e2a05baaa'
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
    '28eafebf-1c4b-488f-bda8-57906236ccc0',
    '2023-06-17 00:27:44.439697',
    '2023-06-17 00:27:44.439697',
    NULL,
    '69315936',
    'invoice transaction at Lind Group using card ending with ***(...4534) for ZAR 320.09 in account ***84513754',
    189,
    189,
    189,
    '9fcbd30e-c0ab-4b41-9f7c-3531d99b400d'
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
    '2df8712a-b637-47b4-b3af-95751c3d028e',
    '2023-06-17 00:27:44.439697',
    '2023-06-17 00:27:44.439697',
    NULL,
    '13552261',
    'withdrawal transaction at O\'Connell - Murazik using card ending with ***(...4740) for VUV 351.26 in account ***61525350',
    145,
    145,
    145,
    '9fcbd30e-c0ab-4b41-9f7c-3531d99b400d'
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
    '3236e265-d48b-4e9a-9494-e696b75f7bdc',
    '2023-06-17 00:27:43.913611',
    '2023-06-17 00:27:43.913611',
    NULL,
    '57657015',
    'invoice transaction at Ledner - Wuckert using card ending with ***(...6599) for LYD 723.19 in account ***78121357',
    608,
    608,
    608,
    'eef346e1-3709-4539-8ace-409257114784'
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
    '36cdb893-49a9-4661-bde9-e7023e12032d',
    '2023-06-17 00:27:44.500937',
    '2023-06-17 00:27:44.500937',
    NULL,
    '25237402',
    'withdrawal transaction at Johnson, Kuhic and Johns using card ending with ***(...2029) for CAD 373.52 in account ***86495881',
    538,
    538,
    538,
    '2d0ef741-d783-4aff-b0ca-0a2f7c2c63c8'
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
    '3a4dd886-4e1a-4cf4-87ca-687cd8d1ae56',
    '2023-06-17 00:27:44.281593',
    '2023-06-17 00:27:44.281593',
    NULL,
    '75188568',
    'withdrawal transaction at Torp and Sons using card ending with ***(...0792) for CVE 744.56 in account ***13986770',
    622,
    622,
    622,
    'd18395d0-274d-4e79-9a24-ed5e2a05baaa'
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
    '3b151535-734f-4c5c-ba40-2688641793ec',
    '2023-06-17 00:27:43.834763',
    '2023-06-17 00:27:43.834763',
    NULL,
    '11366448',
    'deposit transaction at Wolf, Bechtelar and Fahey using card ending with ***(...2349) for CRC 573.90 in account ***18375274',
    431,
    431,
    431,
    '7cc6cd3f-7d7a-4c4a-b4a4-7c4fa63a0386'
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
    '4e1b46d7-592e-494e-8531-28db09630798',
    '2023-06-17 00:27:43.913611',
    '2023-06-17 00:27:43.913611',
    NULL,
    '11074507',
    'deposit transaction at Gusikowski Group using card ending with ***(...3689) for MWK 508.38 in account ***90593658',
    173,
    173,
    173,
    'eef346e1-3709-4539-8ace-409257114784'
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
    '4f06ad8e-bc75-4957-91da-a715f1f852a6',
    '2023-06-17 00:27:43.987089',
    '2023-06-17 00:27:43.987089',
    NULL,
    '81464675',
    'payment transaction at Brown Group using card ending with ***(...6572) for XOF 321.75 in account ***63687141',
    333,
    333,
    333,
    '4a7c98e7-667b-4352-9085-b79f034aa08c'
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
    '4fdc31ea-e193-470b-b483-c6f69b6749bb',
    '2023-06-17 00:27:44.093775',
    '2023-06-17 00:27:44.093775',
    NULL,
    '53003530',
    'withdrawal transaction at Cummerata, Wyman and O\'Conner using card ending with ***(...6090) for CHF 30.35 in account ***05573185',
    430,
    430,
    430,
    '1f2bb94c-a3e7-4bfa-87e3-e06e953539b7'
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
    '50ff112a-da5a-4323-b528-42908bd36d7a',
    '2023-06-17 00:27:44.371228',
    '2023-06-17 00:27:44.371228',
    NULL,
    '72637712',
    'deposit transaction at Lemke and Sons using card ending with ***(...8480) for CRC 390.51 in account ***71157337',
    113,
    113,
    113,
    'e4c8ac4c-bf88-4f60-80b7-61ed4ce84b86'
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
    '51b27d30-b480-4922-a035-197489ef5a70',
    '2023-06-17 00:27:44.183224',
    '2023-06-17 00:27:44.183224',
    NULL,
    '76213037',
    'withdrawal transaction at O\'Kon - Streich using card ending with ***(...6985) for ANG 200.25 in account ***18822105',
    601,
    601,
    601,
    '7ffafadb-fa14-4d43-ac8b-73cddbbfa2da'
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
    '63c825d0-021f-48df-823e-4af313a5f5d0',
    '2023-06-17 00:27:43.987089',
    '2023-06-17 00:27:43.987089',
    NULL,
    '83100069',
    'withdrawal transaction at Murphy, Ortiz and Kassulke using card ending with ***(...6941) for BMD 406.04 in account ***98970920',
    329,
    329,
    329,
    '4a7c98e7-667b-4352-9085-b79f034aa08c'
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
    '6b8ad549-a313-41f3-8f98-3bc18c3303bd',
    '2023-06-17 00:27:43.834763',
    '2023-06-17 00:27:43.834763',
    NULL,
    '11755030',
    'payment transaction at Ebert and Sons using card ending with ***(...3078) for PEN 761.27 in account ***12240346',
    339,
    339,
    339,
    '7cc6cd3f-7d7a-4c4a-b4a4-7c4fa63a0386'
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
    '7b599dd2-16d7-4aad-ba6d-679d97d613c4',
    '2023-06-17 00:27:44.281593',
    '2023-06-17 00:27:44.281593',
    NULL,
    '78027132',
    'deposit transaction at Hodkiewicz, Daugherty and Turcotte using card ending with ***(...0237) for KZT 837.17 in account ***92808358',
    16,
    16,
    16,
    'd18395d0-274d-4e79-9a24-ed5e2a05baaa'
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
    '7be21d57-9d54-48b4-a6f7-a81d8622d969',
    '2023-06-17 00:27:43.913611',
    '2023-06-17 00:27:43.913611',
    NULL,
    '68984460',
    'invoice transaction at Zboncak LLC using card ending with ***(...1313) for ETB 52.88 in account ***85679677',
    329,
    329,
    329,
    'eef346e1-3709-4539-8ace-409257114784'
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
    '83f0c880-0ec3-4b13-81c7-0939d02a4ecb',
    '2023-06-17 00:27:44.500937',
    '2023-06-17 00:27:44.500937',
    NULL,
    '05787356',
    'deposit transaction at Keebler - Feeney using card ending with ***(...0669) for SVC 567.35 in account ***52480043',
    815,
    815,
    815,
    '2d0ef741-d783-4aff-b0ca-0a2f7c2c63c8'
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
    '87ca0cab-4007-4f61-9ff6-145f2d4e31c6',
    '2023-06-17 00:27:43.987089',
    '2023-06-17 00:27:43.987089',
    NULL,
    '00106751',
    'deposit transaction at Hyatt - Torphy using card ending with ***(...5454) for CHF 274.08 in account ***11783023',
    745,
    745,
    745,
    '4a7c98e7-667b-4352-9085-b79f034aa08c'
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
    '8a69b990-2747-44eb-a58b-be6872fde281',
    '2023-06-17 00:27:43.834763',
    '2023-06-17 00:27:43.834763',
    NULL,
    '54768648',
    'deposit transaction at Hoppe, Altenwerth and Cruickshank using card ending with ***(...3689) for PKR 51.13 in account ***27776299',
    287,
    287,
    287,
    '7cc6cd3f-7d7a-4c4a-b4a4-7c4fa63a0386'
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
    '9973ee57-7c08-40e9-a6e7-eedd28f45f05',
    '2023-06-17 00:27:44.093775',
    '2023-06-17 00:27:44.093775',
    NULL,
    '36339539',
    'deposit transaction at Gorczany - Hyatt using card ending with ***(...2209) for CAD 654.97 in account ***07963382',
    6,
    6,
    6,
    '1f2bb94c-a3e7-4bfa-87e3-e06e953539b7'
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
    '9d84060d-4aa8-4f19-96ec-7009626bee55',
    '2023-06-17 00:27:44.183224',
    '2023-06-17 00:27:44.183224',
    NULL,
    '54405742',
    'payment transaction at Feil - Herzog using card ending with ***(...2574) for XPF 129.43 in account ***43574895',
    818,
    818,
    818,
    '7ffafadb-fa14-4d43-ac8b-73cddbbfa2da'
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
    'a4907cb0-074d-4ee9-9247-573031ab469e',
    '2023-06-17 00:27:44.183224',
    '2023-06-17 00:27:44.183224',
    NULL,
    '90193817',
    'invoice transaction at Gerhold, Hammes and Hyatt using card ending with ***(...9332) for KPW 616.41 in account ***56996056',
    256,
    256,
    256,
    '7ffafadb-fa14-4d43-ac8b-73cddbbfa2da'
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
    'b0d5a156-3cc1-41d9-9c9a-10172f7478df',
    '2023-06-17 00:27:43.913611',
    '2023-06-17 00:27:43.913611',
    NULL,
    '27829277',
    'invoice transaction at Grant Inc using card ending with ***(...9846) for DZD 530.74 in account ***23280733',
    544,
    544,
    544,
    'eef346e1-3709-4539-8ace-409257114784'
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
    'b3aa1200-e88f-4a88-82c3-12c50330d319',
    '2023-06-17 00:27:43.834763',
    '2023-06-17 00:27:43.834763',
    NULL,
    '62885352',
    'invoice transaction at Will, O\'Keefe and Bednar using card ending with ***(...9029) for VUV 420.98 in account ***33636025',
    429,
    429,
    429,
    '7cc6cd3f-7d7a-4c4a-b4a4-7c4fa63a0386'
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
    'baa16975-952e-4f96-9b48-88a5ac7012d6',
    '2023-06-17 00:27:44.500937',
    '2023-06-17 00:27:44.500937',
    NULL,
    '60386682',
    'invoice transaction at Langosh - Marquardt using card ending with ***(...5293) for XBB 662.71 in account ***45512387',
    82,
    82,
    82,
    '2d0ef741-d783-4aff-b0ca-0a2f7c2c63c8'
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
    'bb031811-e915-4708-bc56-40f0bddccd00',
    '2023-06-17 00:27:44.093775',
    '2023-06-17 00:27:44.093775',
    NULL,
    '11314856',
    'payment transaction at Murphy, O\'Reilly and Crona using card ending with ***(...7447) for VES 661.40 in account ***82774013',
    367,
    367,
    367,
    '1f2bb94c-a3e7-4bfa-87e3-e06e953539b7'
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
    'bf35cec7-f060-4fdd-9f41-3998864442dd',
    '2023-06-17 00:27:44.371228',
    '2023-06-17 00:27:44.371228',
    NULL,
    '36505435',
    'withdrawal transaction at Stanton - Watsica using card ending with ***(...2531) for RON 876.02 in account ***53802884',
    598,
    598,
    598,
    'e4c8ac4c-bf88-4f60-80b7-61ed4ce84b86'
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
    'bfdc0cac-0ec3-4e23-9db7-8f7456f2f277',
    '2023-06-17 00:27:44.281593',
    '2023-06-17 00:27:44.281593',
    NULL,
    '30745898',
    'payment transaction at Feil - Okuneva using card ending with ***(...6927) for XBD 1.06 in account ***46296811',
    437,
    437,
    437,
    'd18395d0-274d-4e79-9a24-ed5e2a05baaa'
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
    'c364b023-e0bd-484a-99cf-e7c988a6c651',
    '2023-06-17 00:27:44.439697',
    '2023-06-17 00:27:44.439697',
    NULL,
    '70249749',
    'invoice transaction at Kohler - Walker using card ending with ***(...1977) for MRO 323.52 in account ***99172091',
    803,
    803,
    803,
    '9fcbd30e-c0ab-4b41-9f7c-3531d99b400d'
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
    'c4b6ee27-22d2-4c54-9e8c-b599c419708c',
    '2023-06-17 00:27:44.371228',
    '2023-06-17 00:27:44.371228',
    NULL,
    '69001769',
    'withdrawal transaction at Hintz - Langosh using card ending with ***(...6642) for BND 255.05 in account ***72222877',
    80,
    80,
    80,
    'e4c8ac4c-bf88-4f60-80b7-61ed4ce84b86'
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
    'd6864565-7834-4e8e-846e-7fe8570dd837',
    '2023-06-17 00:27:44.093775',
    '2023-06-17 00:27:44.093775',
    NULL,
    '57320329',
    'withdrawal transaction at Emmerich, Wolff and Lesch using card ending with ***(...5184) for SVC 382.14 in account ***24733388',
    78,
    78,
    78,
    '1f2bb94c-a3e7-4bfa-87e3-e06e953539b7'
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
    'd70ec835-6d04-40b8-91ce-caf34b9bf2ba',
    '2023-06-17 00:27:44.500937',
    '2023-06-17 00:27:44.500937',
    NULL,
    '91525476',
    'invoice transaction at Ankunding, Abbott and Hauck using card ending with ***(...7690) for ZMW 715.81 in account ***68244563',
    675,
    675,
    675,
    '2d0ef741-d783-4aff-b0ca-0a2f7c2c63c8'
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
    'dabfbb93-71a8-4a2a-a650-9d54b513c012',
    '2023-06-17 00:27:43.987089',
    '2023-06-17 00:27:43.987089',
    NULL,
    '37642378',
    'deposit transaction at Marvin LLC using card ending with ***(...1236) for MGA 604.54 in account ***87506966',
    204,
    204,
    204,
    '4a7c98e7-667b-4352-9085-b79f034aa08c'
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
    'daf65b43-4882-48ed-9c24-6c1ca0af7fdf',
    '2023-06-17 00:27:44.439697',
    '2023-06-17 00:27:44.439697',
    NULL,
    '10623093',
    'invoice transaction at Langosh - McKenzie using card ending with ***(...6549) for PEN 688.06 in account ***74718551',
    294,
    294,
    294,
    '9fcbd30e-c0ab-4b41-9f7c-3531d99b400d'
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
    'ebfde510-a751-42d5-963d-d53aea88de39',
    '2023-06-17 00:27:44.281593',
    '2023-06-17 00:27:44.281593',
    NULL,
    '87324982',
    'invoice transaction at Kohler - O\'Reilly using card ending with ***(...4657) for KZT 198.54 in account ***11341608',
    535,
    535,
    535,
    'd18395d0-274d-4e79-9a24-ed5e2a05baaa'
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
    'f1a52509-5b54-43fd-866d-e5452d374fa1',
    '2023-06-17 00:27:43.913611',
    '2023-06-17 00:27:43.913611',
    NULL,
    '53585566',
    'invoice transaction at Crist - Schowalter using card ending with ***(...4143) for MWK 702.12 in account ***39004176',
    685,
    685,
    685,
    'eef346e1-3709-4539-8ace-409257114784'
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
    'fc353b2c-f38f-4d05-9919-941031a41582',
    '2023-06-17 00:27:44.093775',
    '2023-06-17 00:27:44.093775',
    NULL,
    '46329282',
    'invoice transaction at Goyette, Bechtelar and Bode using card ending with ***(...3113) for KMF 439.29 in account ***43511617',
    838,
    838,
    838,
    '1f2bb94c-a3e7-4bfa-87e3-e06e953539b7'
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
    'fcec6baf-103d-4f28-8178-106a74869e4f',
    '2023-06-17 00:27:43.834763',
    '2023-06-17 00:27:43.834763',
    NULL,
    '00496916',
    'deposit transaction at Fritsch, Funk and Graham using card ending with ***(...7992) for SGD 217.57 in account ***09717660',
    70,
    70,
    70,
    '7cc6cd3f-7d7a-4c4a-b4a4-7c4fa63a0386'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: feature_flag
# ------------------------------------------------------------

INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '15982359-8228-4328-a483-5f61727f32bc',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Editar clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '20529a5d-d8ec-4670-b2c9-d76a63c91f68',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Borrar facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '2660dcb9-2d2b-4eab-b4e2-a09d5c05e77c',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Visualizar facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '403488fe-2ab4-4781-bbfc-2829cc019811',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Crear clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '4678f211-508c-4731-8da6-10f3acca120d',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Historial clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '5881dd7e-870a-4078-9699-869f05c7e153',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Visualizar clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '5bbfa1ce-9dc2-4855-8160-026cd759e5dd',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Visualizar comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '674e81f8-7221-4e5c-aba2-7738bff69c72',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Crear comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '6b1022c8-7712-4d7b-8b3e-a6435d6761df',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Historial facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    '8a88e564-3b74-4fd1-94c9-46d411cbe012',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Editar facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'abc052ff-6384-4ef4-a5ae-6581ab5da7e3',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Modulo comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'ceeb1485-67a1-47c4-af5d-071edf94d378',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Editar comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'd8492376-40bf-4b8b-8455-c3345f6a1a13',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Crear facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'e6404fdb-406d-4e97-b5d5-d5bef524354a',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Modulo facturas'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'ec968710-290f-4054-b31b-dc3478a8ec56',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Modulo clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'ee88cd98-0acf-488c-8496-65f9caffaae7',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Borrar comprobantes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'f5cf4a65-8244-440b-82f6-daf7d7ffa816',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Borrar clientes'
  );
INSERT INTO
  `feature_flag` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`)
VALUES
  (
    'fddf556c-7142-4536-bc91-612b5152f840',
    '2023-06-17 00:27:43.671587',
    '2023-06-17 00:27:43.671587',
    NULL,
    'Historial comprobantes'
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
    '0df93750-f3d8-40b2-95fe-b5151d15d457',
    '2023-06-17 00:27:43.697728',
    '2023-06-17 00:27:43.697728',
    NULL,
    '713debe4-737a-457d-b06c-d88dcdd505d5',
    '5881dd7e-870a-4078-9699-869f05c7e153'
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
    '5541c038-49e0-4893-bbc7-cd62910fd57c',
    '2023-06-17 00:27:43.697728',
    '2023-06-17 00:27:43.697728',
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
    '6523420a-e0be-4656-b251-490435084dd0',
    '2023-06-17 00:27:43.697728',
    '2023-06-17 00:27:43.697728',
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
    '99b6bdc6-0eb5-45a3-b370-0ae657669ae5',
    '2023-06-17 00:27:43.697728',
    '2023-06-17 00:27:43.697728',
    NULL,
    '915e2e99-7c70-4761-a407-75f4e733195f',
    '403488fe-2ab4-4781-bbfc-2829cc019811'
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
    '2023-06-17 00:27:43.445238',
    '2023-06-17 00:27:43.445238',
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
    '2023-06-17 00:27:43.445238',
    '2023-06-17 00:27:43.445238',
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
    '2023-06-17 00:27:43.643304',
    '2023-06-17 00:27:43.643304',
    NULL,
    'Luis',
    'luis@gmail.com',
    '$2b$10$uQZNivnSvI.jB0YV.xI.q.3n.mUotHYv6F5n2bSiF9ZnqLAoWnvVK',
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
    '2023-06-17 00:27:43.643304',
    '2023-06-17 00:27:43.643304',
    NULL,
    'Fernanda',
    'fernanda@gmail.com',
    '$2b$10$or7NARF98Quo0quuaiBPBe0Op4qJOV5cOgoJh704kWHQXx67QUEnG',
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
    '2023-06-17 00:27:43.643304',
    '2023-06-17 00:27:43.643304',
    NULL,
    'Josue Lopez',
    'josue@gmail.com',
    '$2b$10$rguHY0nhI85I4nE9HQ6EU.4IY78C4B3fUCaoDpy.e5Na9T58M.Fxm',
    '9cf17f36-1924-4a19-a556-79b5c59f2d99',
    1
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
