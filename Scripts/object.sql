-- Script para levantar la tabla de object
CREATE TABLE object (
    ObjectID INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    weigh DOUBLE NOT NULL,
    attributeID INT,
    dmg DOUBLE NOT NULL,
    hp INT NOT NULL,
    PRIMARY KEY (ObjectID),
    FOREIGN KEY (attributeID) REFERENCES attributes(attributeID)
);