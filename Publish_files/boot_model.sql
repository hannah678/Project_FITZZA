-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema semi_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema semi_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `semi_project` DEFAULT CHARACTER SET utf8 ;
USE `semi_project` ;

-- -----------------------------------------------------
-- Table `semi_project`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`user` (
  `user_id` VARCHAR(45) NOT NULL,
  `user_pwd` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(30) NOT NULL,
  `user_nickname` VARCHAR(30) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `tel` VARCHAR(15) NOT NULL,
  `register_date` DATETIME NOT NULL DEFAULT now(),
  `exp` INT NOT NULL DEFAULT 0,
  `profile_image` VARCHAR(300) NULL,
  `permission` ENUM('user', 'admin') NOT NULL,
  `report_hit` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`));


-- -----------------------------------------------------
-- Table `semi_project`.`user_leave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`user_leave` (
  `leave_date` DATETIME NOT NULL DEFAULT now(),
  `leave_forced` ENUM('Y', 'N') NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`));


-- -----------------------------------------------------
-- Table `semi_project`.`category_big`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`category_big` (
  `cat_big_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cat_big_name`));

-- -----------------------------------------------------
-- Table `semi_project`.`category_small`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`category_small` (
  `cat_big_name` VARCHAR(45) NOT NULL,
  `cat_small_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cat_small_name`),
  CONSTRAINT `fk_category_small_category_big1`
    FOREIGN KEY (`cat_big_name`)
    REFERENCES `semi_project`.`category_big` (`cat_big_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `semi_project`.`gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`gender` (
  `gender_type` ENUM('W', 'M', 'U') NOT NULL,
  `gender_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gender_type`));


-- -----------------------------------------------------
-- Table `semi_project`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`product` (
  `prod_num` INT NOT NULL AUTO_INCREMENT,
  `prod_name` VARCHAR(100) NOT NULL,
  `explanation` VARCHAR(300) NOT NULL,
  `enter_date` DATETIME NOT NULL DEFAULT now(),
  `prod_image` VARCHAR(300) NULL,
  `cat_small_name` VARCHAR(45) NOT NULL,
  `prod_hit` INT NOT NULL,
  `gender_type` ENUM('W', 'M', 'U') NOT NULL,
  PRIMARY KEY (`prod_num`),
  CONSTRAINT `fk_product_category_small1`
    FOREIGN KEY (`cat_small_name`)
    REFERENCES `semi_project`.`category_small` (`cat_small_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_gender1`
    FOREIGN KEY (`gender_type`)
    REFERENCES `semi_project`.`gender` (`gender_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `semi_project`.`board_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`board_type` (
  `type_num` INT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_num`));


-- -----------------------------------------------------
-- Table `semi_project`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`board` (
  `board_num` INT NOT NULL AUTO_INCREMENT,
  `type_num` INT NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `hit` INT NOT NULL DEFAULT 0,
  `write_date` DATETIME NOT NULL DEFAULT now(),
  `ip` VARCHAR(45) NOT NULL,
  `gender_type` ENUM('W', 'M', 'U') NOT NULL,
  PRIMARY KEY (`board_num`),
  CONSTRAINT `fk_board_board_type1`
    FOREIGN KEY (`type_num`)
    REFERENCES `semi_project`.`board_type` (`type_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `semi_project`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_board_gender1`
    FOREIGN KEY (`gender_type`)
    REFERENCES `semi_project`.`gender` (`gender_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `semi_project`.`prod_link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`prod_link` (
  `prod_num` INT NOT NULL,
  `url` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`prod_num`),
  CONSTRAINT `fk_prod_link_product1`
    FOREIGN KEY (`prod_num`)
    REFERENCES `semi_project`.`product` (`prod_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `semi_project`.`codi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`codi` (
  `codi_num` INT NOT NULL,
  `codi_name` VARCHAR(45) NOT NULL,
  `codi_completed_image` VARCHAR(300) NOT NULL,
  `codi_background_image` VARCHAR(300) NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codi_num`),
  CONSTRAINT `fk_codi_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `semi_project`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `semi_project`.`codi_component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`codi_component` (
  `prod_num` INT NOT NULL,
  `codi_num` INT NOT NULL,
  CONSTRAINT `fk_codi_component_codi1`
    FOREIGN KEY (`codi_num`)
    REFERENCES `semi_project`.`codi` (`codi_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codi_component_product1`
    FOREIGN KEY (`prod_num`)
    REFERENCES `semi_project`.`product` (`prod_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `semi_project`.`like_clicker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`like_clicker` (
  `user_id` VARCHAR(45) NOT NULL,
  `board_num` INT NOT NULL,
  PRIMARY KEY (`user_id`, `board_num`),
  CONSTRAINT `fk_like_clicker_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `semi_project`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_like_clicker_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `semi_project`.`board` (`board_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `semi_project`.`trade_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`trade_state` (
  `state_num` INT NOT NULL AUTO_INCREMENT,
  `state_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`state_num`));


-- -----------------------------------------------------
-- Table `semi_project`.`trade_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`trade_detail` (
  `board_num` INT NOT NULL,
  `state_num` INT NOT NULL,
  `trade_date` DATETIME NULL DEFAULT now(),
  PRIMARY KEY (`board_num`),
  CONSTRAINT `fk_trade_detail_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `semi_project`.`board` (`board_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `semi_project`.`reply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`reply` (
  `reply_num` INT NOT NULL AUTO_INCREMENT,
  `board_num` INT NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `coment` VARCHAR(500) NOT NULL,
  `reply_date` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`reply_num`),
  CONSTRAINT `fk_reply_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `semi_project`.`board` (`board_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reply_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `semi_project`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `semi_project`.`board_old`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`board_old` (
  `board_num` INT NOT NULL,
  `old_name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `old_price` INT NOT NULL,
  PRIMARY KEY (`board_num`),
  CONSTRAINT `fk_board_old_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `semi_project`.`board` (`board_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `semi_project`.`board_qna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`board_qna` (
  `board_num` INT NOT NULL,
  `answer_state` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
  `answer_content` LONGTEXT NULL,
  `user_id` VARCHAR(45) NULL,
  PRIMARY KEY (`board_num`),
  CONSTRAINT `fk_board_qna_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `semi_project`.`board` (`board_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_board_qna_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `semi_project`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `semi_project`.`board_common_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`board_common_image` (
  `board_num` INT NOT NULL,
  `file1` VARCHAR(300) NOT NULL,
  `file2` VARCHAR(300) NULL,
  `file3` VARCHAR(300) NULL,
  `file4` VARCHAR(300) NULL,
  `file5` VARCHAR(300) NULL,
  PRIMARY KEY (`board_num`),
  CONSTRAINT `fk_board_common_image_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `semi_project`.`board` (`board_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `semi_project`.`board_recommend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`board_recommend` (
  `recom_num` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `recom_date` DATETIME NOT NULL DEFAULT now(),
  `user_id` VARCHAR(45) NOT NULL,
  `recom_type` ENUM('건의', '불만', '기타') NOT NULL,
  PRIMARY KEY (`recom_num`),
  CONSTRAINT `fk_board_recommend_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `semi_project`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `semi_project`.`board_notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`board_notice` (
  `notice_num` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `notice_date` DATETIME NOT NULL DEFAULT now(),
  `hit` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`notice_num`));


-- -----------------------------------------------------
-- Table `semi_project`.`user_grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`user_grade` (
  `grade` INT NOT NULL,
  `exp_min` INT NOT NULL,
  `exp_max` INT NOT NULL,
  `frame_img` VARCHAR(300) NOT NULL);


-- -----------------------------------------------------
-- Table `semi_project`.`voted_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`voted_user` (
  `board_num` INT NOT NULL,
  `vote_item_order` INT NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`board_num`, `user_id`, `vote_item_order`),
  CONSTRAINT `fk_voted_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `semi_project`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_voted_user_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `semi_project`.`board` (`board_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `semi_project`.`prod_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`prod_tag` (
  `prod_num` INT NOT NULL COMMENT 'asdfsadf',
  `tag` VARCHAR(45) NOT NULL,
  CONSTRAINT `fk_prod_keyword_product1`
    FOREIGN KEY (`prod_num`)
    REFERENCES `semi_project`.`product` (`prod_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `semi_project`.`report_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`report_category` (
  `category_num` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_num`));


-- -----------------------------------------------------
-- Table `semi_project`.`board_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`board_report` (
  `report_num` INT NOT NULL AUTO_INCREMENT,
  `board_num` INT NOT NULL,
  `report_content` LONGTEXT NOT NULL,
  `category_num` INT NOT NULL,
  `report_time` DATETIME NOT NULL DEFAULT now(),
  `user_id` VARCHAR(45) NOT NULL,
  `state` ENUM('N', 'Y') NULL DEFAULT 'N',
  PRIMARY KEY (`report_num`),
  CONSTRAINT `fk_board_report_report_category1`
    FOREIGN KEY (`category_num`)
    REFERENCES `semi_project`.`report_category` (`category_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_report_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `semi_project`.`board` (`board_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_board_report_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `semi_project`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `semi_project`.`alarm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `semi_project`.`alarm` (
  `user_id` VARCHAR(45) NOT NULL,
  `alarm_type` ENUM('reply', 'like', 'report') NOT NULL,
  `board_num` INT NOT NULL,
  `alarm_time` DATETIME NOT NULL DEFAULT now(),
  CONSTRAINT `fk_alarm_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `semi_project`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_alarm_board1`
    FOREIGN KEY (`board_num`)
    REFERENCES `semi_project`.`board` (`board_num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
