-- Script name: database_d20cards.sql
-- Version: 1.0
-- Descripcion: Levanta la base de datos con sus tablas, pero sin datos, totalmente vacia

-- Configuraciones iniciales
SET FOREIGN_KEY_CHECKS = 0; -- Desactiva comprobaciones de claves foráneas (por si hay dependencias)

-- Creación de la base de datos

DROP DATABASE IF EXISTS `d20cards`; -- Comprueba si ya existe la base de datos, en caso de que si, la elimina
CREATE DATABASE `d20cards`;
USE `d20cards`;

-- Levantamiento de tablas en la base de datos
CREATE TABLE `attributes` (
    `attributeID` INT AUTO_INCREMENT, -- Identificador único del atributo
    `name` VARCHAR(255) NOT NULL, -- Nombre del atributo
    `description` TEXT NOT NULL, -- Descripción detallada
    `hp` INT NOT NULL, -- Puntos de vida asociados al atributo
    `dmg` DOUBLE NOT NULL, -- Daño asociado al atributo
    `mana` DOUBLE NOT NULL, -- Mana asociado al atributo
    `weight` DOUBLE NOT NULL, -- Peso asociado al atributo
    PRIMARY KEY (`attributeID`) -- Llave primaria
) ENGINE=InnoDB;

CREATE TABLE `beast` (
    `id` INT AUTO_INCREMENT, -- Identificador único de la bestia
    `name` VARCHAR(255) NOT NULL, -- Nombre de la bestia
    `description` TEXT NOT NULL, -- Descripción detallada de la bestia
    `damage` DOUBLE NOT NULL, -- Daño que causa la bestia
    `hit_points` INT NOT NULL, -- Puntos de vida de la bestia
    `mana_needed_to_invoque` DOUBLE NOT NULL, -- Mana necesario para invocar a la bestia
    PRIMARY KEY (`id`) -- Llave primaria
) ENGINE=InnoDB;

CREATE TABLE `cards` (
    `cardID` INT AUTO_INCREMENT, -- Identificador único de la carta
    `name` VARCHAR(255) NOT NULL, -- Nombre de la carta
    `cardTYPE` VARCHAR(50) NOT NULL, -- Tipo de la carta
    `id_attribute` INT, -- Llave foránea a la tabla attributes
    PRIMARY KEY (`cardID`), -- Llave primaria
    FOREIGN KEY (`id_attribute`) REFERENCES `attributes`(`attributeID`) -- Llave foránea
) ENGINE=InnoDB;

CREATE TABLE `users` (
    `userID` INT AUTO_INCREMENT, -- Identificador único del usuario
    `name` VARCHAR(255) NOT NULL, -- Nombre del usuario
    `characterID` INT NOT NULL, -- ID del personaje asociado
    `rounds` INT NOT NULL, -- Número de rondas jugadas
    `superuser` BOOLEAN NOT NULL, -- Indica si el usuario es superusuario
    PRIMARY KEY (`userID`) -- Llave primaria
) ENGINE=InnoDB;

CREATE TABLE `character` (
    `characterID` INT AUTO_INCREMENT, -- Identificador único del personaje
    `userID` INT NOT NULL, -- Llave foránea que referencia a la tabla users
    `name` VARCHAR(255) NOT NULL, -- Nombre del personaje
    `cardTYPE` VARCHAR(50) NOT NULL, -- Tipo de carta del personaje
    `numC` INT NOT NULL, -- Número de cartas asociadas
    `points` INT NOT NULL, -- Puntos acumulados del personaje
    `hp` INT NOT NULL, -- Puntos de vida del personaje
    `dmg` DOUBLE NOT NULL, -- Daño del personaje
    `mana` DOUBLE NOT NULL, -- Mana del personaje
    `MAXweigh` DOUBLE NOT NULL, -- Peso máximo soportado
    `badOmen` VARCHAR(255), -- Mala señal (puede ser NULL)
    `discartedCards` INT NOT NULL, -- Número de cartas descartadas
    PRIMARY KEY (`characterID`), -- Llave primaria
    FOREIGN KEY (`userID`) REFERENCES `users`(`userID`) -- Llave foránea
) ENGINE=InnoDB;

CREATE TABLE `object` (
    `ObjectID` INT AUTO_INCREMENT, -- Identificador único del objeto
    `name` VARCHAR(255) NOT NULL, -- Nombre del objeto
    `description` TEXT NOT NULL, -- Descripción detallada del objeto
    `weigh` DOUBLE NOT NULL, -- Peso del objeto
    `attributeID` INT, -- Llave foránea a la tabla attributes
    `dmg` DOUBLE NOT NULL, -- Daño del objeto
    `hp` INT NOT NULL, -- Puntos de vida del objeto
    PRIMARY KEY (`ObjectID`), -- Llave primaria
    FOREIGN KEY (`attributeID`) REFERENCES `attributes`(`attributeID`) -- Llave foránea
) ENGINE=InnoDB;

CREATE TABLE `play` (
    `id` INT AUTO_INCREMENT, -- Identificador único de la partida
    `id_players` INT NOT NULL, -- Llave foránea que referencia a los jugadores
    `id_superuser` INT NOT NULL, -- Llave foránea que referencia al superusuario
    `rounds` INT NOT NULL, -- Número de rondas en la partida
    `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de la partida
    PRIMARY KEY (`id`), -- Llave primaria
    FOREIGN KEY (`id_players`) REFERENCES `users`(`userID`), -- Llave foránea a la tabla users
    FOREIGN KEY (`id_superuser`) REFERENCES `users`(`userID`) -- Llave foránea a la tabla users
) ENGINE=InnoDB;

CREATE TABLE `spell` (
    `spellID` INT AUTO_INCREMENT, -- Identificador único del hechizo
    `name` VARCHAR(255) NOT NULL, -- Nombre del hechizo
    `description` TEXT NOT NULL, -- Descripción del hechizo
    `damage` DOUBLE NOT NULL, -- Daño del hechizo
    `mana_needed_to_invoque` DOUBLE NOT NULL, -- Mana necesario para invocar el hechizo
    PRIMARY KEY (`spellID`) -- Llave primaria
) ENGINE=InnoDB;

-- Reactiva las comprobaciones de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;
