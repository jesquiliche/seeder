-- CreateTable
CREATE TABLE `ordenes` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `subtotal` DECIMAL(8, 2) NOT NULL,
    `total` DECIMAL(8, 2) NOT NULL,
    `iva` DECIMAL(8, 2) NOT NULL,
    `pagado` VARCHAR(1) NOT NULL,
    `entregado` VARCHAR(1) NOT NULL,
    `transactionId` VARCHAR(255) NULL,
    `articulos` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
