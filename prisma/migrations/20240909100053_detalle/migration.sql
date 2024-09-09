-- CreateTable
CREATE TABLE `detalles` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `orden_id` BIGINT NOT NULL,
    `cerveza_id` BIGINT NOT NULL,
    `precio` DECIMAL(8, 2) NOT NULL,
    `cantidad` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
