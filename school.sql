
CREATE DATABASE IF NOT EXISTS `school`;
USE `school`;

CREATE TABLE IF NOT EXISTS `pupill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `sex` tinyint(4) NOT NULL,
  `class` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `pupill` (`name`, `lastname`, `sex`, `class`) VALUES
	('giorgi', 'chyonia', 2, 11),
	('pupil2', 'gagua', 1, 2),
	('asd', 'pirveli', 1, 5);
	
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `sex` tinyint(4) NOT NULL,
  `subject` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='teacher table';

INSERT INTO `teacher` (`id`, `name`, `lastname`, `sex`, `subject`) VALUES
	(1, 'jubo', 'ratiani', 1, 'math'),
	(2, 'gela', 'chachrili', 1, 'nagvis urnebis texnikurad moparva');

CREATE TABLE IF NOT EXISTS `pupil_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupil_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_teachers` (`teacher_id`),
  KEY `FK_pupil` (`pupil_id`),
  CONSTRAINT `FK_pupil` FOREIGN KEY (`pupil_id`) REFERENCES `pupill` (`id`),
  CONSTRAINT `FK_teachers` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pupil_subjects` (`pupil_id`, `teacher_id`) VALUES
	(1, 2),
	(2, 2),
	(1, 1),
	(3, 1);



-- select query for pupil giorgi's teachers

	SELECT t.* FROM pupil_subjects ps 
		LEFT JOIN pupill p ON ps.pupil_id = p.id
		LEFT JOIN teacher t ON ps.teacher_id = t.id
	WHERE p.name = 'giorgi'



