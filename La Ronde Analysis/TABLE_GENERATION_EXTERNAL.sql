-- -----------------------------------------------------
-- Table `p_project`.`WEATHER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_project`.`WEATHER` (
  `DATE` DATE NOT NULL,
  `TEMP_MAX` DECIMAL(38,1) NULL,
  `TEMP_MIN` DECIMAL(38,1) NULL,
  `TEMP_MEAN` DECIMAL(38,1) NULL,
  `TOTAL_RAIN` DECIMAL(38,1) NULL,
  `TOTAL_SNOW` DECIMAL(38,1) NULL,
  PRIMARY KEY (`DATE`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- UPDATE Table `p_project`.`facility_ticket_id`
-- -----------------------------------------------------
ALTER TABLE `p_project`.`facility_ticket_id` 
ADD INDEX `fk_FACILITY_TICKET_ID_DATE1_idx` (`WEATHER_DATE` ASC);
ALTER TABLE `p_project`.`facility_ticket_id` 
ADD CONSTRAINT `fk_FACILITY_TICKET_ID_DATE1`
  FOREIGN KEY (`WEATHER_DATE`)
  REFERENCES `p_project`.`weather` (`DATE`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- -----------------------------------------------------
-- UPDATE Table `p_project`.`ride_ticket_id`
-- -----------------------------------------------------
ALTER TABLE `p_project`.`ride_ticket_id` 
ADD INDEX `fk_RIDE_TICKET_ID_DATE1_idx` (`WEATHER_DATE` ASC);
ALTER TABLE `p_project`.`ride_ticket_id` 
ADD CONSTRAINT `fk_RIDE_TICKET_ID_DATE1`
  FOREIGN KEY (`WEATHER_DATE`)
  REFERENCES `p_project`.`weather` (`DATE`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
