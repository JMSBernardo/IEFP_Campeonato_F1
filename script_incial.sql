DROP DATABASE IF EXISTS campeonato_f1;
CREATE DATABASE campeonato_f1;
USE campeonato_f1;

CREATE TABLE piloto (
    id_piloto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE equipa (
    id_equipa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);

CREATE TABLE circuito (
    id_circuito INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    comprimento_km DECIMAL(4,2)
);

CREATE TABLE temporada (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    ano YEAR NOT NULL,
    UNIQUE (ano)
);

CREATE TABLE corrida (
    id_corrida INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    id_temporada INT NOT NULL,
    id_circuito INT NOT NULL,
    FOREIGN KEY (id_temporada) REFERENCES temporada(id_temporada),
    FOREIGN KEY (id_circuito) REFERENCES circuito(id_circuito)
);

CREATE TABLE resultado (
    id_resultado INT AUTO_INCREMENT PRIMARY KEY,
    id_corrida INT NOT NULL,
    id_piloto INT NOT NULL,
    id_equipa INT NOT NULL,
    posicao INT NOT NULL,
    pontos DECIMAL(4,1) NOT NULL,
    UNIQUE (id_corrida, id_piloto),
    FOREIGN KEY (id_corrida) REFERENCES corrida(id_corrida),
    FOREIGN KEY (id_piloto) REFERENCES piloto(id_piloto),
    FOREIGN KEY (id_equipa) REFERENCES equipa(id_equipa)
);

SHOW TABLES;
