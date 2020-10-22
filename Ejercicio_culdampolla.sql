
-- Schema culo de botella
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `culo de botella` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `culo de botella` ;

-- -----------------------------------------------------
-- Table `culo de botella`.`gestion_ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culo de botella`.`gestion_ventas` (
  `name_cliente` INT NOT NULL,
  `Empleados_id` INT NOT NULL,
  `producto_vendido` INT NOT NULL,
  PRIMARY KEY (`name_cliente`, `Empleados_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `culo de botella`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culo de botella`.`client` (
  `name_cliente` INT NOT NULL,
  `adress` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `phone` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `email` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `registration_date` DATETIME NOT NULL,
  `'viene_recomendado` ENUM('SI', 'NO') CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `gestion_ventas_name_cliente` INT NOT NULL,
  `gestion_ventas_Empleados_id` INT NOT NULL,
  PRIMARY KEY (`name_cliente`),
  INDEX `fk_client_gestion_ventas1_idx` (`gestion_ventas_name_cliente` ASC, `gestion_ventas_Empleados_id` ASC),
  CONSTRAINT `fk_client_gestion_ventas1`
    FOREIGN KEY (`gestion_ventas_name_cliente` , `gestion_ventas_Empleados_id`)
    REFERENCES `culo de botella`.`gestion_ventas` (`name_cliente` , `Empleados_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `culo de botella`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culo de botella`.`proveedor` (
  `proveedor_id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Calle` VARCHAR(45) NOT NULL,
  `Numero` VARCHAR(2) NOT NULL,
  `Piso` VARCHAR(5) NOT NULL,
  `Puerta` VARCHAR(2) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `CP` VARCHAR(9) NOT NULL,
  `Pais` VARCHAR(12) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  `Fax` VARCHAR(10) NOT NULL,
  `Nif` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`proveedor_id`),
  CONSTRAINT `id_marca`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `culo de botella`.`producto_gafas` (`Marca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `culo de botella`.`producto_gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culo de botella`.`producto_gafas` (
  `Marca` INT NOT NULL,
  `graduacion_der` VARCHAR(45) NOT NULL,
  `graduacion_izq` VARCHAR(45) NOT NULL,
  `tipo_montura` VARCHAR(45) NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_cristal` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(10,0) NOT NULL,
  `proveedor_id` INT NOT NULL,
  `producto_gafas_Marca` INT NOT NULL,
  `gestion_ventas_name_cliente` INT NOT NULL,
  `gestion_ventas_Empleados_id` INT NOT NULL,
  PRIMARY KEY (`Marca`),
  INDEX `fk_producto_gafas_proveedor_idx` (`proveedor_id` ASC),
  INDEX `fk_producto_gafas_gestion_ventas1_idx` (`gestion_ventas_name_cliente` ASC, `gestion_ventas_Empleados_id` ASC),
  CONSTRAINT `fk_producto_gafas_proveedor`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `culo de botella`.`proveedor` (`proveedor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_producto_gafas_gestion_ventas1`
    FOREIGN KEY (`gestion_ventas_name_cliente` , `gestion_ventas_Empleados_id`)
    REFERENCES `culo de botella`.`gestion_ventas` (`name_cliente` , `Empleados_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `culo de botella`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `culo de botella`.`Empleados` (
  `Empleados_id` INT NOT NULL,
  PRIMARY KEY (`Empleados_id`),
  CONSTRAINT `Id_cliente`
    FOREIGN KEY (`Empleados_id`)
    REFERENCES `culo de botella`.`gestion_ventas` (`name_cliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
