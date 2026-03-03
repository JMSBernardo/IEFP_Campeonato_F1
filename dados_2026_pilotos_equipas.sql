USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2026);

INSERT IGNORE INTO equipa (nome, pais) VALUES
('McLaren','Reino Unido'),
('Ferrari','Itália'),
('Mercedes','Alemanha'),
('Red Bull Racing','Áustria'),
('Aston Martin','Reino Unido'),
('Alpine','França'),
('Williams','Reino Unido'),
('Haas F1 Team','Estados Unidos'),
('Racing Bulls','Itália'),
('Kick Sauber','Suíça');

INSERT IGNORE INTO piloto (nome, nacionalidade, data_nascimento) VALUES
('Max Verstappen','Países Baixos','1997-09-30'),
('Lando Norris','Reino Unido','1999-11-13'),
('Oscar Piastri','Austrália','2001-04-06'),
('Charles Leclerc','Mónaco','1997-10-16'),
('Carlos Sainz','Espanha','1994-09-01'),
('George Russell','Reino Unido','1998-02-15'),
('Lewis Hamilton','Reino Unido','1985-01-07'),
('Sergio Perez','México','1990-01-26'),
('Fernando Alonso','Espanha','1981-07-29'),
('Lance Stroll','Canadá','1998-10-29'),
('Pierre Gasly','França','1996-02-07'),
('Esteban Ocon','França','1996-09-17'),
('Alexander Albon','Tailândia','1996-03-23'),
('Yuki Tsunoda','Japão','2000-05-11'),
('Kevin Magnussen','Dinamarca','1992-10-05'),
('Oliver Bearman','Reino Unido','2005-05-08'),
('Liam Lawson','Nova Zelândia','2002-02-11'),
('Zhou Guanyu','China','1999-05-30'),
('Valtteri Bottas','Finlândia','1989-08-28'),
('Jack Doohan','Austrália','2003-01-20');
