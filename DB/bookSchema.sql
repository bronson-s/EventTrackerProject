-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bookeventdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bookeventdb` ;

-- -----------------------------------------------------
-- Schema bookeventdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bookeventdb` DEFAULT CHARACTER SET utf8 ;
USE `bookeventdb` ;

-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `publisher` ;

CREATE TABLE IF NOT EXISTS `publisher` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `image_url` VARCHAR(5000) NULL,
  `description` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book` ;

CREATE TABLE IF NOT EXISTS `book` (
  `id` INT NOT NULL,
  `title` VARCHAR(500) NOT NULL DEFAULT 'N/A',
  `author` VARCHAR(500) NOT NULL DEFAULT 'Unknown',
  `published_year` YEAR NULL,
  `description` TEXT NULL,
  `cover_url` VARCHAR(1000) NULL,
  `author_url` VARCHAR(1000) NULL,
  `page_count` INT NULL,
  `genre_id` INT NOT NULL,
  `publisher_id` INT NOT NULL,
  `pages_read_total` INT NULL,
  `weekly_goal` INT NULL,
  `completed` TINYINT NULL,
  `weekly_goal_completed` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_book_genre1_idx` (`genre_id` ASC),
  INDEX `fk_book_publisher1_idx` (`publisher_id` ASC),
  CONSTRAINT `fk_book_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_publisher1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `publisher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NULL,
  `create_date` DATETIME NULL,
  `role` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_library`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_library` ;

CREATE TABLE IF NOT EXISTS `user_library` (
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `book_id`),
  INDEX `fk_user_has_book_book1_idx` (`book_id` ASC),
  INDEX `fk_user_has_book_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_book_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_book_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO book@localhost;
 DROP USER book@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'book'@'localhost' IDENTIFIED BY 'book';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'book'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookeventdb`;
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (1, 'fiction', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (2, 'non_fiction', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `publisher`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookeventdb`;
INSERT INTO `publisher` (`id`, `name`, `image_url`, `description`) VALUES (1, 'HaperPerennial', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `book`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookeventdb`;
INSERT INTO `book` (`id`, `title`, `author`, `published_year`, `description`, `cover_url`, `author_url`, `page_count`, `genre_id`, `publisher_id`, `pages_read_total`, `weekly_goal`, `completed`, `weekly_goal_completed`) VALUES (1, 'The Book of Job', 'Stephen Mitchel', 1992, 'Perhaps no other Biblical tale penetrates so deeply into the everyday travails of the common person as The Book of Job. It tells the story of a righteous man beset by torment and misfortune through no fault of his own. This parable of bad things happening to a good person addresses the eternal question of why we are here, and why we suffer. This translation is by Stephen Mitchell.', 'pexels-christina-morillo-1181671.jpg', NULL, 129, 1, 1, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookeventdb`;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `create_date`, `role`, `enabled`) VALUES (1, 'bronson', 'spies', 'spiesbronson@gmail.com', NULL, 'admin', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_library`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookeventdb`;
INSERT INTO `user_library` (`user_id`, `book_id`) VALUES (1, 1);

COMMIT;

