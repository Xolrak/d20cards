-- script para levantar la tabla de users
CREATE TABLE users (
    userID INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    characterID INT NOT NULL,
    rounds INT NOT NULL,
    superuser BOOLEAN NOT NULL,
    PRIMARY KEY (userID)
);