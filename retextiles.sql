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
-- -----------------------------------------------------
-- Schema bitofhome
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bitofhome
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bitofhome` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`login` (
  `users_id` INT NOT NULL,
  `email` VARCHAR(65) NOT NULL,
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
  `fullname` VARCHAR(100) NULL,
  `road` VARCHAR(100) NULL,
  `number` INT NULL,
  `zip_code` INT NULL,
  `area` VARCHAR(50) NULL,
  `city` VARCHAR(50) NULL,
  `telephone` VARCHAR(20) NULL,
  `email` VARCHAR(65) NULL,
  `description` VARCHAR(250) NULL,
  `afm` VARCHAR(20) NULL,
  `total` FLOAT NOT NULL,
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

USE `bitofhome` ;

-- -----------------------------------------------------
-- Table `bitofhome`.`retextile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bitofhome`.`retextile` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  `image_url` VARCHAR(50) NULL DEFAULT NULL,
  `style` VARCHAR(50) NULL DEFAULT NULL,
  `price1` FLOAT NULL DEFAULT NULL,
  `price2` FLOAT NULL DEFAULT NULL,
  `price3` FLOAT NULL DEFAULT NULL,
  `price4` FLOAT NULL DEFAULT NULL,
  `price5` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bitofhome`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bitofhome`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `address` VARCHAR(150) NULL DEFAULT NULL,
  `zip_code` VARCHAR(15) NULL DEFAULT NULL,
  `afm` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bitofhome`.`favorite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bitofhome`.`favorite` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `users_id` INT(11) NOT NULL,
  `retextile_copy2_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `users_id`, `retextile_copy2_id`),
  INDEX `fk_favorite_users1_idx` (`users_id` ASC),
  INDEX `fk_favorite_retextile_copy21_idx` (`retextile_copy2_id` ASC),
  CONSTRAINT `fk_favorite_retextile_copy21`
    FOREIGN KEY (`retextile_copy2_id`)
    REFERENCES `bitofhome`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `bitofhome`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bitofhome`.`favorite_design`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bitofhome`.`favorite_design` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `users_id` INT(11) NOT NULL,
  `retextile_id1` INT(11) NOT NULL,
  `retextile_id2` INT(11) NOT NULL,
  `retextile_id3` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_favorite_design_users1_idx` (`users_id` ASC),
  INDEX `fk_favorite_design_retextile1_idx` (`retextile_id3` ASC),
  INDEX `fk_favorite_design_retextile2_idx` (`retextile_id1` ASC),
  INDEX `fk_favorite_design_retextile3_idx` (`retextile_id2` ASC),
  CONSTRAINT `fk_favorite_design_retextile1`
    FOREIGN KEY (`retextile_id3`)
    REFERENCES `bitofhome`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_design_retextile2`
    FOREIGN KEY (`retextile_id1`)
    REFERENCES `bitofhome`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_design_retextile3`
    FOREIGN KEY (`retextile_id2`)
    REFERENCES `bitofhome`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_design_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `bitofhome`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bitofhome`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bitofhome`.`login` (
  `users_id` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`users_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  CONSTRAINT `fk_login_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `bitofhome`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bitofhome`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bitofhome`.`orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `users_id` INT(11) NOT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_orders_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `bitofhome`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bitofhome`.`order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bitofhome`.`order_item` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `retextile_id` INT(11) NOT NULL,
  `orders_id` INT(11) NOT NULL,
  `length` FLOAT NOT NULL,
  `width` FLOAT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `rafi` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `retextile_id`, `orders_id`),
  INDEX `fk_order_item_orders1_idx` (`orders_id` ASC),
  INDEX `fk_order_item_retextile1_idx` (`retextile_id` ASC),
  CONSTRAINT `fk_order_item_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `bitofhome`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_retextile1`
    FOREIGN KEY (`retextile_id`)
    REFERENCES `bitofhome`.`retextile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
