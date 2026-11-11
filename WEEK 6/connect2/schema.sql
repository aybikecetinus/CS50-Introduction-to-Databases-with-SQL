CREATE TABLE `Users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` TEXT NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `Schools`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name_of_school` TEXT NOT NULL,
    `type` ENUM('Primary','Secondary','Higher Education') NOT NULL,
    `location` TEXT NOT NULL,
    `founded_year` YEAR NOT NULL,
    PRIMARY KEY (`id`)
);


CREATE TABLE `Companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM('Technology','Education','Business') NOT NULL,
    `location` TEXT NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `People_Connection` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user1` INT UNSIGNED,
    `user2` INT UNSIGNED,
    `mutual` TINYINT NOT NULL CHECK(`mutual` != 0),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user1`) REFERENCES `Users` (`id`),
    FOREIGN KEY (`user2`) REFERENCES `Users` (`id`)
);

CREATE TABLE `School_Connection` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `startdate`DATE ,
    `enddate` DATE,
    `degree_type` VARCHAR(16),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
    FOREIGN KEY (`school_id`) REFERENCES `Schools` (`id`)
);

CREATE TABLE `Company_Connection` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `company_id` INT UNSIGNED,
    `startdate`DATE,
    `enddate` DATE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `Companies` (`id`)
);
