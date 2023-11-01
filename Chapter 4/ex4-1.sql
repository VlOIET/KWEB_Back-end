CREATE TABLE `students` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `enter_year` INT NOT NULL,
    `major` VARCHAR(16) NOT NULL,
    `individual_number` INT NOT NULL,
    `phone_number` VARCHAR(12) NOT NULL,
    `address` VARCHAR(30) NOT NULL,
    `credit` TINYINT NOT NULL DEFAULT 0,
    `grade` FLOAT NOT NULL DEFAULT 0.0,
    `status` TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;