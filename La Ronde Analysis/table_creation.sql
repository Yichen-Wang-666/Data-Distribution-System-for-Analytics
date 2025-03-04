SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Table `mydb`.`ADDRESS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ADDRESS` (
  `POSTAL_CODE` VARCHAR(10) NOT NULL,
  `ADDRESS` VARCHAR(45) NULL,
  PRIMARY KEY (`POSTAL_CODE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
  `C_ID` VARCHAR(10) NOT NULL,
  `FIRST_NAME` VARCHAR(45) NULL,
  `LAST_NAME` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(255) NULL,
  `MOBILE_NUM` VARCHAR(45) NULL,
  `GENDER` VARCHAR(45) NULL,
  `DOB` DATETIME NULL,
  `DATE_OF_REG` DATETIME NULL,
  `ADDRESS_POSTAL_CODE` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`C_ID`),
  INDEX `fk_CUSTOMER_ADDRESS1_idx` (`ADDRESS_POSTAL_CODE` ASC) ,
  CONSTRAINT `fk_CUSTOMER_ADDRESS1`
    FOREIGN KEY (`ADDRESS_POSTAL_CODE`)
    REFERENCES `mydb`.`ADDRESS` (`POSTAL_CODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FACILITY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FACILITY` (
  `FACILITY_ID` VARCHAR(20) NOT NULL,
  `FACILITY_DESC` VARCHAR(45) NULL,
  `FACILITY_TYPE` VARCHAR(45) NULL,
  `FACILITY_CAPACITY` INT NULL,
  `FACILITY_SUBTYPE` VARCHAR(45) NULL,
  `LOCATION` VARCHAR(45) NULL,
  PRIMARY KEY (`FACILITY_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RIDE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RIDE` (
  `RIDE_ID` VARCHAR(20) NOT NULL,
  `RIDE_NAME` VARCHAR(255) NULL,
  `TYPE_OF_RIDE` VARCHAR(45) NULL,
  `CAPACITY_OF_A_RIDE` INT NULL,
  `RIDE_HEIGHT` INT NULL,
  `YEAR_STARTED` INT NULL,
  `DESCRIPTION` VARCHAR(255) NULL,
  `MIN_RIDE_HEIGHT` VARCHAR(45) NULL,
  `MANUFACTURER` VARCHAR(45) NULL,
  `TOPE_SPEED` VARCHAR(45) NULL,
  `TRACK_LENGTH` VARCHAR(20) NULL,
  `ADDITIONAL_FEES` VARCHAR(45) NULL,
  PRIMARY KEY (`RIDE_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TICKET_CATEGORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TICKET_CATEGORY` (
  `CATEGORY_OF_TICKET_ID` INT NOT NULL,
  `CATEGORY_OF_TICKET_DESC` VARCHAR(45) NULL,
  PRIMARY KEY (`CATEGORY_OF_TICKET_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PAYMENT_METHOD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAYMENT_METHOD` (
  `PAYMENT` INT NOT NULL,
  `PAYMENT_METHOD_DESC` VARCHAR(45) NULL,
  PRIMARY KEY (`PAYMENT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TICKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TICKET` (
  `TICKET_ID` INT NOT NULL,
  `PURCHASE_DATE` DATE NULL,
  `PROMO_APPLIED` INT NULL,
  `PURCHASE_MODE ` VARCHAR(45) NULL,
  `PRICE` INT NULL,
  `TICKET_CATEGORY_CATEGORY_OF_TICKET_ID` INT NOT NULL,
  `PAYMENT_METHOD_PAYMENT` INT NOT NULL,
  `Customer_C_ID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`TICKET_ID`),
  INDEX `fk_TICKET_TICKET_CATEGORY1_idx` (`TICKET_CATEGORY_CATEGORY_OF_TICKET_ID` ASC) ,
  INDEX `fk_TICKET_PAYMENT_METHOD1_idx` (`PAYMENT_METHOD_PAYMENT` ASC) ,
  INDEX `fk_TICKET_Customer1_idx` (`Customer_C_ID` ASC) ,
  CONSTRAINT `fk_TICKET_TICKET_CATEGORY1`
    FOREIGN KEY (`TICKET_CATEGORY_CATEGORY_OF_TICKET_ID`)
    REFERENCES `mydb`.`TICKET_CATEGORY` (`CATEGORY_OF_TICKET_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TICKET_PAYMENT_METHOD1`
    FOREIGN KEY (`PAYMENT_METHOD_PAYMENT`)
    REFERENCES `mydb`.`PAYMENT_METHOD` (`PAYMENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TICKET_Customer1`
    FOREIGN KEY (`Customer_C_ID`)
    REFERENCES `mydb`.`CUSTOMER` (`C_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RIDE_TICKET_ID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RIDE_TICKET_ID` (
  `RIDE_TICKET_ID` INT NOT NULL,
  `TIME_STAMP` TIMESTAMP NULL,
  `TICKET_TICKET_ID` INT NOT NULL,
  `RIDE_RIDE_ID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`RIDE_TICKET_ID`),
  INDEX `fk_RIDE_TICKET_ID_TICKET1_idx` (`TICKET_TICKET_ID` ASC) ,
  INDEX `fk_RIDE_TICKET_ID_RIDE1_idx` (`RIDE_RIDE_ID` ASC) ,
  CONSTRAINT `fk_RIDE_TICKET_ID_TICKET1`
    FOREIGN KEY (`TICKET_TICKET_ID`)
    REFERENCES `mydb`.`TICKET` (`TICKET_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RIDE_TICKET_ID_RIDE1`
    FOREIGN KEY (`RIDE_RIDE_ID`)
    REFERENCES `mydb`.`RIDE` (`RIDE_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FACILITY_TICKET_ID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FACILITY_TICKET_ID` (
  `FACILITY_TICKET_ID` INT NOT NULL,
  `TIME_STAMP` TIMESTAMP NULL,
  `TICKET_TICKET_ID` INT NOT NULL,
  `FACILITY_FACILITY_ID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`FACILITY_TICKET_ID`),
  INDEX `fk_FACILITY_TICKET_ID_TICKET1_idx` (`TICKET_TICKET_ID` ASC) ,
  INDEX `fk_FACILITY_TICKET_ID_FACILITY1_idx` (`FACILITY_FACILITY_ID` ASC) ,
  CONSTRAINT `fk_FACILITY_TICKET_ID_TICKET1`
    FOREIGN KEY (`TICKET_TICKET_ID`)
    REFERENCES `mydb`.`TICKET` (`TICKET_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FACILITY_TICKET_ID_FACILITY1`
    FOREIGN KEY (`FACILITY_FACILITY_ID`)
    REFERENCES `mydb`.`FACILITY` (`FACILITY_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
