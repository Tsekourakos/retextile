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
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `address` VARCHAR(150) NULL,
  `zip_code` VARCHAR(15) NULL,
  `afm` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`login` (
  `users_id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  PRIMARY KEY (`users_id`),
  CONSTRAINT `fk_login_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_orders_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`retextile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`retextile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL,
  `image_url` VARCHAR(50) NULL,
  `style` VARCHAR(50) NULL,
  `price1` FLOAT NULL,
  `price2` FLOAT NULL,
  `price3` FLOAT NULL,
  `price4` FLOAT NULL,
  `price5` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `retextile_id` INT NOT NULL,
  `orders_id` INT NOT NULL,
  `length` FLOAT NOT NULL,
  `width` FLOAT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  `rafi` INT NULL,
  PRIMARY KEY (`id`, `retextile_id`, `orders_id`),
  INDEX `fk_order_item_orders1_idx` (`orders_id` ASC),
  INDEX `fk_order_item_retextile1_idx` (`retextile_id` ASC),
  CONSTRAINT `fk_order_item_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `mydb`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_retextile1`
    FOREIGN KEY (`retextile_id`)
    REFERENCES `mydb`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`favorite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`favorite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `retextile_copy2_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`, `retextile_copy2_id`),
  INDEX `fk_favorite_users1_idx` (`users_id` ASC),
  INDEX `fk_favorite_retextile_copy21_idx` (`retextile_copy2_id` ASC),
  CONSTRAINT `fk_favorite_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_retextile_copy21`
    FOREIGN KEY (`retextile_copy2_id`)
    REFERENCES `mydb`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`favorite_design`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`favorite_design` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `retextile_id1` INT NOT NULL,
  `retextile_id2` INT NOT NULL,
  `retextile_id3` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_favorite_design_users1_idx` (`users_id` ASC),
  INDEX `fk_favorite_design_retextile1_idx` (`retextile_id3` ASC),
  INDEX `fk_favorite_design_retextile2_idx` (`retextile_id1` ASC),
  INDEX `fk_favorite_design_retextile3_idx` (`retextile_id2` ASC),
  CONSTRAINT `fk_favorite_design_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_design_retextile1`
    FOREIGN KEY (`retextile_id3`)
    REFERENCES `mydb`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_design_retextile2`
    FOREIGN KEY (`retextile_id1`)
    REFERENCES `mydb`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_design_retextile3`
    FOREIGN KEY (`retextile_id2`)
    REFERENCES `mydb`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
