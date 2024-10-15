-- script para levantar la tabla spell
CREATE TABLE spell (
    spellID INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    damage DOUBLE NOT NULL,
    mana_needed_to_invoque DOUBLE NOT NULL,
    PRIMARY KEY (spellID)
);