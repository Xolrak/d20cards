-- Script para levantar la tabla de beast
CREATE TABLE beast (
    id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    damage DOUBLE NOT NULL,
    hit_points INT NOT NULL,
    mana_needed_to_invoque DOUBLE NOT NULL,
    PRIMARY KEY (id)
);