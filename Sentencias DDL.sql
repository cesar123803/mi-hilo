-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `Código del cliente` INT NOT NULL COMMENT 'Llave primaria de la tabla Cliente',
  `Dirección` VARCHAR(45) NULL COMMENT 'Dirección del cliente',
  `Correo` VARCHAR(45) NULL COMMENT 'Correo del cliente de la tabla Cliente',
  PRIMARY KEY (`Código del cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Depósito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Depósito` (
  `idDepósito` INT NOT NULL COMMENT 'Llave primaria de la tabla Deposito',
  `Comisión de venta` VARCHAR(45) NULL,
  `Cliente_Código del cliente` INT NOT NULL,
  PRIMARY KEY (`idDepósito`, `Cliente_Código del cliente`),
  INDEX `fk_Depósito_Cliente1_idx` (`Cliente_Código del cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Depósito_Cliente1`
    FOREIGN KEY (`Cliente_Código del cliente`)
    REFERENCES `mydb`.`Cliente` (`Código del cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `Clave de usuario` INT NOT NULL COMMENT 'Llave primaria de la tabla Vendedor',
  `Dirección` VARCHAR(45) NULL COMMENT 'Dirección del vendedor de la tabla Vendedor',
  `Correo` VARCHAR(45) NULL COMMENT 'Correo del vendedor de la tabla Vendedor',
  `Depósito_idDepósito` INT NOT NULL,
  PRIMARY KEY (`Clave de usuario`),
  INDEX `fk_Vendedor_Depósito1_idx` (`Depósito_idDepósito` ASC) VISIBLE,
  CONSTRAINT `fk_Vendedor_Depósito1`
    FOREIGN KEY (`Depósito_idDepósito`)
    REFERENCES `mydb`.`Depósito` (`idDepósito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inventario` (
  `Código de referencia` INT NOT NULL COMMENT 'Llave primaria de la tabla Inventario',
  `precio del producto` DECIMAL NULL COMMENT 'Precio del producto de la tabla Inventario',
  `Tipo del producto` VARCHAR(45) NULL COMMENT 'Tipo del producto seleccionado de la tabla Inventario',
  PRIMARY KEY (`Código de referencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `Clave de administrador` INT NOT NULL COMMENT 'Llave primaria de la tabla Administrador',
  `Correo` VARCHAR(45) NULL COMMENT 'correo del administrador de la tabla Administrador',
  `Nombre de usuario` VARCHAR(45) NULL COMMENT 'Nombre de usuario de la tabla Administrador',
  `Inventario_Código de referencia` INT NOT NULL,
  `Depósito_idDepósito` INT NOT NULL,
  PRIMARY KEY (`Clave de administrador`),
  INDEX `fk_Administrador_Inventario1_idx` (`Inventario_Código de referencia` ASC) VISIBLE,
  INDEX `fk_Administrador_Depósito1_idx` (`Depósito_idDepósito` ASC) VISIBLE,
  CONSTRAINT `fk_Administrador_Inventario1`
    FOREIGN KEY (`Inventario_Código de referencia`)
    REFERENCES `mydb`.`Inventario` (`Código de referencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrador_Depósito1`
    FOREIGN KEY (`Depósito_idDepósito`)
    REFERENCES `mydb`.`Depósito` (`idDepósito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `Clave de usuario` INT NOT NULL COMMENT 'Llave primaria de la tabla Usuario',
  `Nombre de usuario` VARCHAR(45) NULL COMMENT 'Nombre de usuario de la tabla Usuario',
  `Estado de selección` VARCHAR(45) NULL COMMENT 'Estado de selección de la tabla Usuario',
  `Fecha de registro` DATE NULL COMMENT 'Fecha de registro de la tabla Usuario',
  `Vendedor_Clave de usuario` INT NOT NULL,
  `Administrador_Clave de administrador` INT NOT NULL,
  PRIMARY KEY (`Clave de usuario`),
  INDEX `fk_Usuario_Vendedor_idx` (`Vendedor_Clave de usuario` ASC) VISIBLE,
  INDEX `fk_Usuario_Administrador1_idx` (`Administrador_Clave de administrador` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Vendedor`
    FOREIGN KEY (`Vendedor_Clave de usuario`)
    REFERENCES `mydb`.`Vendedor` (`Clave de usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Administrador1`
    FOREIGN KEY (`Administrador_Clave de administrador`)
    REFERENCES `mydb`.`Administrador` (`Clave de administrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Factura` (
  `idFactura` INT NOT NULL COMMENT 'Llave primaria de la tabla Factura',
  `Cédula de ciudadanía` INT NULL COMMENT 'Cédula de ciudadanía del cliente de la tabla Factura',
  `Productos` VARCHAR(45) NULL COMMENT 'Productos de la tabla Factura',
  `Cliente_Código del cliente` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_Factura_Cliente1_idx` (`Cliente_Código del cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Cliente1`
    FOREIGN KEY (`Cliente_Código del cliente`)
    REFERENCES `mydb`.`Cliente` (`Código del cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `Código del producto` INT NOT NULL COMMENT 'Llave primaria de la tabla Productos',
  `Precio` DECIMAL NULL COMMENT 'Precio del producto de la tabla Productos',
  `Vendedor_Clave de usuario` INT NOT NULL,
  `Factura_idFactura` INT NOT NULL,
  PRIMARY KEY (`Código del producto`),
  INDEX `fk_Productos_Vendedor1_idx` (`Vendedor_Clave de usuario` ASC) VISIBLE,
  INDEX `fk_Productos_Factura1_idx` (`Factura_idFactura` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Vendedor1`
    FOREIGN KEY (`Vendedor_Clave de usuario`)
    REFERENCES `mydb`.`Vendedor` (`Clave de usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_Factura1`
    FOREIGN KEY (`Factura_idFactura`)
    REFERENCES `mydb`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor_has_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor_has_Cliente` (
  `Vendedor_Clave de usuario` INT NOT NULL,
  `Cliente_Código del cliente` INT NOT NULL,
  PRIMARY KEY (`Vendedor_Clave de usuario`, `Cliente_Código del cliente`),
  INDEX `fk_Vendedor_has_Cliente_Cliente1_idx` (`Cliente_Código del cliente` ASC) VISIBLE,
  INDEX `fk_Vendedor_has_Cliente_Vendedor1_idx` (`Vendedor_Clave de usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Vendedor_has_Cliente_Vendedor1`
    FOREIGN KEY (`Vendedor_Clave de usuario`)
    REFERENCES `mydb`.`Vendedor` (`Clave de usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendedor_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_Código del cliente`)
    REFERENCES `mydb`.`Cliente` (`Código del cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
