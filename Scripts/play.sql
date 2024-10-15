-- Script para levantar la tabla de play
CREATE TABLE play (
    id INT AUTO_INCREMENT,
    id_players INT NOT NULL,
    id_superuser INT NOT NULL,
    rounds INT NOT NULL,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- aqui se registra la fecha de la partida
    PRIMARY KEY (id),
    FOREIGN KEY (id_players) REFERENCES users(userID),
    FOREIGN KEY (id_superuser) REFERENCES users(userID)
);