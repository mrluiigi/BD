-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quinta
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `quinta` ;

-- -----------------------------------------------------
-- Schema quinta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quinta` DEFAULT CHARACTER SET utf8 ;
USE `quinta` ;

-- -----------------------------------------------------
-- Table `quinta`.`Funcionário`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`Funcionário` ;

CREATE TABLE IF NOT EXISTS `quinta`.`Funcionário` (
  `Número` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Salário` FLOAT NOT NULL,
  `Contacto` CHAR(9) NOT NULL,
  `Horário` CHAR(1) NOT NULL,
  PRIMARY KEY (`Número`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`Plantação`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`Plantação` ;

CREATE TABLE IF NOT EXISTS `quinta`.`Plantação` (
  `ID` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Area` DOUBLE NOT NULL,
  `MesColheita` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`Animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`Animal` ;

CREATE TABLE IF NOT EXISTS `quinta`.`Animal` (
  `ID` INT NOT NULL,
  `Espécie` VARCHAR(45) NOT NULL,
  `Peso` INT NOT NULL,
  `DataNascimento` DATE NOT NULL,
  `ValidadeVacina` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`Recurso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`Recurso` ;

CREATE TABLE IF NOT EXISTS `quinta`.`Recurso` (
  `ID` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Fornecedor` VARCHAR(45) NOT NULL,
  `Preco` FLOAT NOT NULL,
  `Stock` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`ProdutoAnimal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`ProdutoAnimal` ;

CREATE TABLE IF NOT EXISTS `quinta`.`ProdutoAnimal` (
  `ID` INT NOT NULL,
  `Designacao` VARCHAR(45) NOT NULL,
  `Preco` FLOAT NOT NULL,
  `Stock` INT NOT NULL,
  `Validade` DATE NOT NULL,
  `Animal_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_ProdutoAnimal_Animal1_idx` (`Animal_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ProdutoAnimal_Animal1`
    FOREIGN KEY (`Animal_ID`)
    REFERENCES `quinta`.`Animal` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `quinta`.`Cliente` (
  `NIF` INT NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Contacto` CHAR(9) NOT NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`Encomenda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`Encomenda` ;

CREATE TABLE IF NOT EXISTS `quinta`.`Encomenda` (
  `ID` INT NOT NULL,
  `Valor` FLOAT NOT NULL,
  `Data` DATE NOT NULL,
  `Cliente` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Encomenda_Cliente1_idx` (`Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Encomenda_Cliente1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `quinta`.`Cliente` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`AnimalRecurso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`AnimalRecurso` ;

CREATE TABLE IF NOT EXISTS `quinta`.`AnimalRecurso` (
  `Animal_ID` INT NOT NULL,
  `Recurso_ID` INT NOT NULL,
  `QuantidadeConsumida` INT NOT NULL,
  `DataUltimoConsumo` DATETIME NOT NULL,
  PRIMARY KEY (`Animal_ID`, `Recurso_ID`),
  INDEX `fk_Recurso_has_Animal_Animal1_idx` (`Animal_ID` ASC) VISIBLE,
  INDEX `fk_Recurso_has_Animal_Recurso1_idx` (`Recurso_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Recurso_has_Animal_Recurso1`
    FOREIGN KEY (`Recurso_ID`)
    REFERENCES `quinta`.`Recurso` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recurso_has_Animal_Animal1`
    FOREIGN KEY (`Animal_ID`)
    REFERENCES `quinta`.`Animal` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`PlantaçãoRecurso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`PlantaçãoRecurso` ;

CREATE TABLE IF NOT EXISTS `quinta`.`PlantaçãoRecurso` (
  `Plantação_ID` INT NOT NULL,
  `Recurso_ID` INT NOT NULL,
  `QuantidadeConsumida` INT NOT NULL,
  `DataUltimoConsumo` DATETIME NOT NULL,
  PRIMARY KEY (`Plantação_ID`, `Recurso_ID`),
  INDEX `fk_Plantação_has_Recurso_Recurso1_idx` (`Recurso_ID` ASC) VISIBLE,
  INDEX `fk_Plantação_has_Recurso_Plantação1_idx` (`Plantação_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Plantação_has_Recurso_Plantação1`
    FOREIGN KEY (`Plantação_ID`)
    REFERENCES `quinta`.`Plantação` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plantação_has_Recurso_Recurso1`
    FOREIGN KEY (`Recurso_ID`)
    REFERENCES `quinta`.`Recurso` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`FuncionárioAnimal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`FuncionárioAnimal` ;

CREATE TABLE IF NOT EXISTS `quinta`.`FuncionárioAnimal` (
  `Funcionário_Número` INT NOT NULL,
  `Animal_ID` INT NOT NULL,
  PRIMARY KEY (`Funcionário_Número`, `Animal_ID`),
  INDEX `fk_Funcionário_has_Animal_Animal1_idx` (`Animal_ID` ASC) VISIBLE,
  INDEX `fk_Funcionário_has_Animal_Funcionário1_idx` (`Funcionário_Número` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionário_has_Animal_Funcionário1`
    FOREIGN KEY (`Funcionário_Número`)
    REFERENCES `quinta`.`Funcionário` (`Número`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionário_has_Animal_Animal1`
    FOREIGN KEY (`Animal_ID`)
    REFERENCES `quinta`.`Animal` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`FuncionárioPlantação`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`FuncionárioPlantação` ;

CREATE TABLE IF NOT EXISTS `quinta`.`FuncionárioPlantação` (
  `Funcionário_Número` INT NOT NULL,
  `Plantação_ID` INT NOT NULL,
  PRIMARY KEY (`Funcionário_Número`, `Plantação_ID`),
  INDEX `fk_Funcionário_has_Plantação_Plantação1_idx` (`Plantação_ID` ASC) VISIBLE,
  INDEX `fk_Funcionário_has_Plantação_Funcionário1_idx` (`Funcionário_Número` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionário_has_Plantação_Funcionário1`
    FOREIGN KEY (`Funcionário_Número`)
    REFERENCES `quinta`.`Funcionário` (`Número`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionário_has_Plantação_Plantação1`
    FOREIGN KEY (`Plantação_ID`)
    REFERENCES `quinta`.`Plantação` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`ProdutoVegetal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`ProdutoVegetal` ;

CREATE TABLE IF NOT EXISTS `quinta`.`ProdutoVegetal` (
  `ID` INT NOT NULL,
  `Designacao` VARCHAR(45) NOT NULL,
  `Preco` FLOAT NOT NULL,
  `Stock` INT NOT NULL,
  `Validade` DATE NOT NULL,
  `Plantação_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_ProdutoVegetal_Plantação1_idx` (`Plantação_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ProdutoVegetal_Plantação1`
    FOREIGN KEY (`Plantação_ID`)
    REFERENCES `quinta`.`Plantação` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`ProdutoVegetalEncomenda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`ProdutoVegetalEncomenda` ;

CREATE TABLE IF NOT EXISTS `quinta`.`ProdutoVegetalEncomenda` (
  `ProdutoVegetal_ID` INT NOT NULL,
  `Encomenda_ID` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`ProdutoVegetal_ID`, `Encomenda_ID`),
  INDEX `fk_ProdutoVegetal_has_Encomenda_Encomenda1_idx` (`Encomenda_ID` ASC) VISIBLE,
  INDEX `fk_ProdutoVegetal_has_Encomenda_ProdutoVegetal1_idx` (`ProdutoVegetal_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ProdutoVegetal_has_Encomenda_ProdutoVegetal1`
    FOREIGN KEY (`ProdutoVegetal_ID`)
    REFERENCES `quinta`.`ProdutoVegetal` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProdutoVegetal_has_Encomenda_Encomenda1`
    FOREIGN KEY (`Encomenda_ID`)
    REFERENCES `quinta`.`Encomenda` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quinta`.`ProdutoAnimalEncomenda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quinta`.`ProdutoAnimalEncomenda` ;

CREATE TABLE IF NOT EXISTS `quinta`.`ProdutoAnimalEncomenda` (
  `ProdutoAnimal_ID` INT NOT NULL,
  `Encomenda_ID` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`ProdutoAnimal_ID`, `Encomenda_ID`),
  INDEX `fk_ProdutoAnimal_has_Encomenda_Encomenda1_idx` (`Encomenda_ID` ASC) VISIBLE,
  INDEX `fk_ProdutoAnimal_has_Encomenda_ProdutoAnimal1_idx` (`ProdutoAnimal_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ProdutoAnimal_has_Encomenda_ProdutoAnimal1`
    FOREIGN KEY (`ProdutoAnimal_ID`)
    REFERENCES `quinta`.`ProdutoAnimal` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProdutoAnimal_has_Encomenda_Encomenda1`
    FOREIGN KEY (`Encomenda_ID`)
    REFERENCES `quinta`.`Encomenda` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
