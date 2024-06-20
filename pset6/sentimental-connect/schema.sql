CREATE TABLE users (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) TEXT NOT NULL,
    `last_name` VARCHAR(32) TEXT NOT NULL,
    `username` VARCHAR(32) TEXT NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE schools (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `type` ENUM(`Primary`, `Secondary`, `Higher Education`) NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `year` TINYINT,
    PRIMARY KEY(`id`)
);

CREATE TABLE companies (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `industry` ENUM(`Technology`, `Education`, `Business`) NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE people_connections (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `another_user_id` INT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`another_user_id`) REFERENCES `users`(`id`)
);

CREATE TABLE schools_connections (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `school_id` INT,
    `start` DATE NOT NULL,
    `end` DATE,
    `degree`  ENUM(`BA`, `MA`, `PhD`) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE companies_connections (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,
    `start` DATE NOT NULL,
    `end` DATE,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
