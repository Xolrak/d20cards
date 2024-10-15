-- Script para levantar la tabla de attributes
CREATE TABLE attributes (
    attributeID INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    hp INT NOT NULL,
    dmg DOUBLE NOT NULL,
    mana DOUBLE NOT NULL,
    weigh DOUBLE NOT NULL,
    PRIMARY KEY (attributeID)
);