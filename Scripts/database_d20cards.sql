-- Script name: database_d20cards.sql
-- Version: 2.0
-- Descripcion: Levanta la base de datos con sus tablas, pero sin datos, totalmente vacia

-- Configuraciones iniciales
SET FOREIGN_KEY_CHECKS = 0; -- Desactiva comprobaciones de claves foráneas (por si hay dependencias)

-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS `d20cards`; -- Si no existe la base de datos, la crea
USE `d20cards`;

-- Creación de tablas en la base de datos
CREATE TABLE IF NOT EXISTS `atributos` (
    `atributoID` INT AUTO_INCREMENT, -- Identificador único del atributo
    `nombre` VARCHAR(255) NOT NULL, -- Nombre del atributo
    `descripcion` TEXT NOT NULL, -- Descripción detallada
    `puntos_vida` INT NOT NULL, -- Puntos de vida asociados al atributo
    `daño` DOUBLE NOT NULL, -- Daño asociado al atributo
    `mana` DOUBLE NOT NULL, -- Maná asociado al atributo
    `peso` DOUBLE NOT NULL, -- Peso asociado al atributo
    PRIMARY KEY (`atributoID`) -- Clave primaria
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `bestias` (
    `id` INT AUTO_INCREMENT, -- Identificador único de la bestia
    `nombre` VARCHAR(255) NOT NULL, -- Nombre de la bestia
    `descripcion` TEXT NOT NULL, -- Descripción detallada de la bestia
    `daño` DOUBLE NOT NULL, -- Daño que causa la bestia
    `puntos_vida` INT NOT NULL, -- Puntos de vida de la bestia
    `mana_necesario_invocar` DOUBLE NOT NULL, -- Maná necesario para invocar a la bestia
    PRIMARY KEY (`id`) -- Clave primaria
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `cartas` (
    `cartasID` INT AUTO_INCREMENT, -- Identificador único de la carta
    `nombre` VARCHAR(255) NOT NULL, -- Nombre de la carta
    `tipo_de_cartas` VARCHAR(50) NOT NULL, -- Tipo de la carta
    `id_atributo` INT, -- Clave foránea a la tabla atributos
    PRIMARY KEY (`cartasID`), -- Clave primaria
    FOREIGN KEY (`id_atributo`) REFERENCES `atributos`(`atributoID`) -- Clave foránea
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `usuarios` (
    `usuarioID` INT AUTO_INCREMENT, -- Identificador único del usuario
    `nombre` VARCHAR(255) NOT NULL, -- Nombre del usuario
    `personajeID` INT NOT NULL, -- ID del personaje asociado
    `rondas` INT NOT NULL, -- Número de rondas jugadas
    `superusuario` BOOLEAN NOT NULL, -- Indica si el usuario es superusuario
    PRIMARY KEY (`usuarioID`) -- Clave primaria
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `personajes` (
    `personajeID` INT AUTO_INCREMENT, -- Identificador único del personaje
    `usuarioID` INT NOT NULL, -- Clave foránea que referencia a la tabla usuarios
    `nombre` VARCHAR(255) NOT NULL, -- Nombre del personaje
    `tipo_carta` VARCHAR(50) NOT NULL, -- Tipo de carta del personaje
    `num_cartas` INT NOT NULL, -- Número de cartas asociadas
    `puntos` INT NOT NULL, -- Puntos acumulados del personaje
    `vida` INT NOT NULL, -- Puntos de vida del personaje
    `daño` DOUBLE NOT NULL, -- Daño del personaje
    `mana` DOUBLE NOT NULL, -- Maná del personaje
    `peso_maximo` DOUBLE NOT NULL, -- Peso máximo soportado
    `mala_suerte` VARCHAR(255), -- Mala señal (puede ser NULL)
    `cartas_descartadas` INT NOT NULL, -- Número de cartas descartadas
    PRIMARY KEY (`personajeID`), -- Clave primaria
    FOREIGN KEY (`usuarioID`) REFERENCES `usuarios`(`usuarioID`) -- Clave foránea
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `objetos` (
    `objetoID` INT AUTO_INCREMENT, -- Identificador único del objeto
    `nombre` VARCHAR(255) NOT NULL, -- Nombre del objeto
    `descripcion` TEXT NOT NULL, -- Descripción detallada del objeto
    `peso` DOUBLE NOT NULL, -- Peso del objeto
    `atributoID` INT, -- Clave foránea a la tabla atributos
    `daño` DOUBLE NOT NULL, -- Daño del objeto
    `vida` INT NOT NULL, -- Puntos de vida del objeto
    PRIMARY KEY (`objetoID`), -- Clave primaria
    FOREIGN KEY (`atributoID`) REFERENCES `atributos`(`atributoID`) -- Clave foránea
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `partidas` (
    `id` INT AUTO_INCREMENT, -- Identificador único de la partida
    `id_jugadores` INT NOT NULL, -- Clave foránea que referencia a los jugadores
    `id_superusuario` INT NOT NULL, -- Clave foránea que referencia al superusuario
    `rondas` INT NOT NULL, -- Número de rondas en la partida
    `fecha_hora` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de la partida
    PRIMARY KEY (`id`), -- Clave primaria
    FOREIGN KEY (`id_jugadores`) REFERENCES `usuarios`(`usuarioID`), -- Clave foránea a la tabla usuarios
    FOREIGN KEY (`id_superusuario`) REFERENCES `usuarios`(`usuarioID`) -- Clave foránea a la tabla usuarios
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `hechizos` (
    `hechizoID` INT AUTO_INCREMENT, -- Identificador único del hechizo
    `nombre` VARCHAR(255) NOT NULL, -- Nombre del hechizo
    `descripcion` TEXT NOT NULL, -- Descripción del hechizo
    `daño` DOUBLE NOT NULL, -- Daño del hechizo
    `mana_necesario_invocar` DOUBLE NOT NULL, -- Maná necesario para invocar el hechizo
    PRIMARY KEY (`hechizoID`) -- Clave primaria
) ENGINE=InnoDB;

-- Reactiva las comprobaciones de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;
