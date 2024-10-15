-- Script para levantar la tabla de cards
CREATE TABLE cards (
    cardID INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    cardTYPE VARCHAR(50) NOT NULL,
    id_attribute INT,
    PRIMARY KEY (cardID),
    FOREIGN KEY (id_attribute) REFERENCES attributes(attributeID)
);