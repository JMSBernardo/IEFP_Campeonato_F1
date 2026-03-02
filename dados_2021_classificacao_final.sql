USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2021);

INSERT INTO circuito (nome, pais, comprimento_km)
SELECT 'Resumo Temporada (Classificação Final)', 'N/A', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM circuito WHERE nome = 'Resumo Temporada (Classificação Final)'
);

INSERT INTO equipa (nome, pais)
SELECT x.nome, x.pais
FROM (
  SELECT 'Mercedes' AS nome, 'Alemanha' AS pais
  UNION ALL SELECT 'Red Bull Racing Honda', 'Áustria'
  UNION ALL SELECT 'Ferrari', 'Itália'
  UNION ALL SELECT 'McLaren Mercedes', 'Reino Unido'
  UNION ALL SELECT 'Alpine Renault', 'França'
  UNION ALL SELECT 'AlphaTauri Honda', 'Itália'
  UNION ALL SELECT 'Aston Martin Mercedes', 'Reino Unido'
  UNION ALL SELECT 'Williams Mercedes', 'Reino Unido'
  UNION ALL SELECT 'Alfa Romeo Racing Ferrari', 'Suíça'
  UNION ALL SELECT 'Haas Ferrari', 'Estados Unidos'
) x
LEFT JOIN equipa e ON e.nome = x.nome
WHERE e.id_equipa IS NULL;

INSERT INTO piloto (nome, nacionalidade, data_nascimento)
SELECT x.nome, x.nac, x.dn
FROM (
  SELECT 'Max Verstappen','Países Baixos','1997-09-30'
  UNION ALL SELECT 'Lewis Hamilton','Reino Unido','1985-01-07'
  UNION ALL SELECT 'Valtteri Bottas','Finlândia','1989-08-28'
  UNION ALL SELECT 'Sergio Perez','México','1990-01-26'
  UNION ALL SELECT 'Carlos Sainz','Espanha','1994-09-01'
  UNION ALL SELECT 'Lando Norris','Reino Unido','1999-11-13'
  UNION ALL SELECT 'Charles Leclerc','Mónaco','1997-10-16'
  UNION ALL SELECT 'Daniel Ricciardo','Austrália','1989-07-01'
  UNION ALL SELECT 'Pierre Gasly','França','1996-02-07'
  UNION ALL SELECT 'Fernando Alonso','Espanha','1981-07-29'
  UNION ALL SELECT 'Esteban Ocon','França','1996-09-17'
  UNION ALL SELECT 'Sebastian Vettel','Alemanha','1987-07-03'
  UNION ALL SELECT 'Lance Stroll','Canadá','1998-10-29'
  UNION ALL SELECT 'Yuki Tsunoda','Japão','2000-05-11'
  UNION ALL SELECT 'George Russell','Reino Unido','1998-02-15'
  UNION ALL SELECT 'Kimi Räikkönen','Finlândia','1979-10-17'
  UNION ALL SELECT 'Nicholas Latifi','Canadá','1995-06-29'
  UNION ALL SELECT 'Antonio Giovinazzi','Itália','1993-12-14'
  UNION ALL SELECT 'Mick Schumacher','Alemanha','1999-03-22'
  UNION ALL SELECT 'Nikita Mazepin','Rússia','1999-03-02'
) x(nome,nac,dn)
LEFT JOIN piloto p ON p.nome = x.nome
WHERE p.id_piloto IS NULL;

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT
  'Classificação Final 2021',
  '2021-12-31',
  t.id_temporada,
  ci.id_circuito
FROM temporada t
JOIN circuito ci ON ci.nome = 'Resumo Temporada (Classificação Final)'
WHERE t.ano = 2021;

INSERT INTO resultado (id_corrida, id_piloto, id_equipa, posicao, pontos)
SELECT
  c.id_corrida,
  p.id_piloto,
  e.id_equipa,
  x.posicao,
  x.pontos
FROM (
  SELECT 1,'Max Verstappen','Red Bull Racing Honda',395.5
  UNION ALL SELECT 2,'Lewis Hamilton','Mercedes',387.5
  UNION ALL SELECT 3,'Valtteri Bottas','Mercedes',226.0
  UNION ALL SELECT 4,'Sergio Perez','Red Bull Racing Honda',190.0
  UNION ALL SELECT 5,'Carlos Sainz','Ferrari',164.5
  UNION ALL SELECT 6,'Lando Norris','McLaren Mercedes',160.0
  UNION ALL SELECT 7,'Charles Leclerc','Ferrari',159.0
  UNION ALL SELECT 8,'Daniel Ricciardo','McLaren Mercedes',115.0
  UNION ALL SELECT 9,'Pierre Gasly','AlphaTauri Honda',110.0
  UNION ALL SELECT 10,'Fernando Alonso','Alpine Renault',81.0
  UNION ALL SELECT 11,'Esteban Ocon','Alpine Renault',74.0
  UNION ALL SELECT 12,'Sebastian Vettel','Aston Martin Mercedes',43.0
  UNION ALL SELECT 13,'Lance Stroll','Aston Martin Mercedes',34.0
  UNION ALL SELECT 14,'Yuki Tsunoda','AlphaTauri Honda',32.0
  UNION ALL SELECT 15,'George Russell','Williams Mercedes',16.0
  UNION ALL SELECT 16,'Kimi Räikkönen','Alfa Romeo Racing Ferrari',10.0
  UNION ALL SELECT 17,'Nicholas Latifi','Williams Mercedes',7.0
  UNION ALL SELECT 18,'Antonio Giovinazzi','Alfa Romeo Racing Ferrari',3.0
  UNION ALL SELECT 19,'Mick Schumacher','Haas Ferrari',0.0
  UNION ALL SELECT 20,'Nikita Mazepin','Haas Ferrari',0.0
) x(posicao,piloto,equipa,pontos)
JOIN temporada t ON t.ano = 2021
JOIN corrida c ON c.nome = 'Classificação Final 2021' AND c.id_temporada = t.id_temporada
JOIN piloto p ON p.nome = x.piloto
JOIN equipa e ON e.nome = x.equipa
LEFT JOIN resultado r ON r.id_corrida = c.id_corrida AND r.id_piloto = p.id_piloto
WHERE r.id_resultado IS NULL;