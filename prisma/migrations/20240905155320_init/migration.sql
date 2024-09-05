-- CreateTable
CREATE TABLE `denominaciones` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,
    `descripcion` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `denominaciones_nombre_key`(`nombre`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `productos` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,
    `bodega` VARCHAR(255) NULL,
    `descripcion` TEXT NOT NULL,
    `maridaje` TEXT NOT NULL,
    `precio` DECIMAL(10, 2) NOT NULL,
    `graduacion` DECIMAL(5, 2) NOT NULL,
    `ano` INTEGER NULL,
    `sabor` VARCHAR(255) NULL,
    `tipo_id` BIGINT UNSIGNED NOT NULL,
    `imagen` VARCHAR(255) NOT NULL,
    `denominacion_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `destacado` VARCHAR(191) NOT NULL DEFAULT 'N',
    `oferta` VARCHAR(191) NOT NULL DEFAULT 'N',
    `stock` INTEGER NOT NULL DEFAULT 200,

    UNIQUE INDEX `productos_nombre_key`(`nombre`),
    INDEX `productos_denominacion_id_foreign`(`denominacion_id`),
    INDEX `productos_tipo_id_foreign`(`tipo_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tipos` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,
    `descripcion` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `tipos_nombre_key`(`nombre`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `email_verified_at` TIMESTAMP(0) NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(100) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `users_name_key`(`name`),
    UNIQUE INDEX `users_email_unique`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `provincia` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `codigo` VARCHAR(2) NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `provincias_nombre_unique`(`nombre`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `poblacion` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `codigo` VARCHAR(5) NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `poblacion_nombre_unique`(`nombre`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `productos` ADD CONSTRAINT `productos_denominacion_id_foreign` FOREIGN KEY (`denominacion_id`) REFERENCES `denominaciones`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `productos` ADD CONSTRAINT `productos_tipo_id_foreign` FOREIGN KEY (`tipo_id`) REFERENCES `tipos`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
