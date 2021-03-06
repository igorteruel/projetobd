-- MySQL Script generated by MySQL Workbench
-- 09/27/17 14:45:42
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(15),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`amizade`
-- Usuario_id == Remetente
-- Usuario_id1 == Destinatário
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`amizade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Usuario_id` INT NOT NULL,
  `Usuario_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Usuario_id1`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`conversas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`conversas` (
  `id_conversas` INT NOT NULL AUTO_INCREMENT,
  `id_amizade` INT NOT NULL,
  `dia` DATETIME NULL,
  `texto` VARCHAR(250) NULL,
   PRIMARY KEY (`id_conversas`),
    FOREIGN KEY (`id_amizade`)
    REFERENCES `mydb`.`amizade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
