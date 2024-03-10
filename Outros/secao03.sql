-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema secao03
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema secao03
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `secao03` DEFAULT CHARACTER SET utf8 ;
USE `secao03` ;

-- -----------------------------------------------------
-- Table `secao03`.`tipos_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `secao03`.`tipos_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `secao03`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `secao03`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `id_tipo_produto` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_idx` (`id_tipo_produto` ASC),
  CONSTRAINT `fk_produtos`
    FOREIGN KEY (`id_tipo_produto`)
    REFERENCES `secao03`.`tipos_produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
