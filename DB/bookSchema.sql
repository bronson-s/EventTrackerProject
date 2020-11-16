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
-- Table `book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book` ;

CREATE TABLE IF NOT EXISTS `book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(500) NOT NULL DEFAULT 'N/A',
  `author` VARCHAR(500) NOT NULL DEFAULT 'Unknown',
  `published_year` YEAR NULL,
  `description` TEXT NULL,
  `cover_url` VARCHAR(1000) NULL,
  `author_url` VARCHAR(1000) NULL,
  `page_count` INT NULL,
  `genre` VARCHAR(200) NULL,
  `publisher` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
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
-- Data for table `book`
-- -----------------------------------------------------
START TRANSACTION;
USE `bookeventdb`;
INSERT INTO `book` (`id`, `title`, `author`, `published_year`, `description`, `cover_url`, `author_url`, `page_count`, `genre`, `publisher`) VALUES (1, 'The Book of Job', 'Stephen Mitchel', 1992, 'Perhaps no other Biblical tale penetrates so deeply into the everyday travails of the common person as The Book of Job. It tells the story of a righteous man beset by torment and misfortune through no fault of his own. This parable of bad things happening to a good person addresses the eternal question of why we are here, and why we suffer. This translation is by Stephen Mitchell.', NULL, NULL, 129, 'non fiction', 'HarperPerennial');
INSERT INTO `book` (`id`, `title`, `author`, `published_year`, `description`, `cover_url`, `author_url`, `page_count`, `genre`, `publisher`) VALUES (2, 'A History of Religious Ideas, Volume 1: From the Stone Age to the Eleusinian Mysteries', 'Mircea Eliade', 1981, '\'A History of Religious Ideas, volume 1 will arouse the interest of all historians of western religion, since it includes chapters on the religions of Canaan and Israel. However, the book must be read cover to cover if one wants to grasp the significance of its gigantic historical scope...Not only has the work unity through Eliade\'s authorship, but it lays the foundation of the history of religious\' edifice of which he has been one of the principal architects.\' -Kees W. Bolle, Church History.', NULL, NULL, 508, 'non fiction', 'University of Chicago Press; New Ed edition (April 15, 1981)\n');
INSERT INTO `book` (`id`, `title`, `author`, `published_year`, `description`, `cover_url`, `author_url`, `page_count`, `genre`, `publisher`) VALUES (3, 'A History of Religious Ideas, Vol. 2: From Gautama Buddha to the Triumph of Christianity', 'Mircea Eliade', 1985, 'In volume 2 of this monumental work, Mircea Eliade continues his magisterial progress through the history of religious ideas. The religions of ancient China, Brahmanism and Hinduism, Buddha and his contemporaries, Roman religion, Celtic and German religions, Judaism, the Hellenistic period, the Iranian syntheses, and the birth of Christianity—all are encompassed in this volume.', NULL, NULL, 580, 'non fiction', ' University of Chicago Press (January 15, 1985');
INSERT INTO `book` (`id`, `title`, `author`, `published_year`, `description`, `cover_url`, `author_url`, `page_count`, `genre`, `publisher`) VALUES (4, 'A History of Religious Ideas, Vol. 3: From Muhammad to the Age of Reforms', 'Mircea Eliade', 1988, 'This volume completes the immensely learned three-volume A History of Religious Ideas. Eliade examines the movement of Jewish thought out of ancient Eurasia, the Christian transformation of the Mediterranean area and Europe, and the rise and diffusion of Islam from approximately the sixth through the seventeenth centuries. Eliade\'s vast knowledge of past and present scholarship provides a synthesis that is unparalleled. In addition to reviewing recent interpretations of the individual traditions, he explores the interactions of the three religions and shows their continuing mutual influence to be subtle but unmistakable.', NULL, NULL, 367, 'non fiction', 'University of Chicago Press; 1st edition (March 15, 1988)');

COMMIT;
