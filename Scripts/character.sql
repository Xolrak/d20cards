-- Script para levantar la tabla character
CREATE TABLE character (
    characterID INT AUTO_INCREMENT,
    userID INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    cardTYPE VARCHAR(50) NOT NULL,
    numC INT NOT NULL,
    points INT NOT NULL,
    hp INT NOT NULL,
    dmg DOUBLE NOT NULL,
    mana DOUBLE NOT NULL,
    MAXweigh DOUBLE NOT NULL,
    badOmen VARCHAR(255),
    discartedCards INT NOT NULL,
    PRIMARY KEY (characterID),
    FOREIGN KEY (userID) REFERENCES users(userID)
);