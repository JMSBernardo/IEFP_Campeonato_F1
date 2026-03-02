USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2022);

INSERT INTO circuito (nome, pais, comprimento_km)
SELECT 'Resumo Temporada (Classificação Final)', 'N/A', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM circuito WHERE nome = 'Resumo Temporada (Classificação Final)'
);

INSERT INTO equipa (nome, pais)
SELECT x.nome, x.pais
FROM (
  SELECT 'Red Bull Racing RBPT' AS nome, 'Áustria'
  UNION ALL SELECT 'Ferrari', 'Itália'
  UNION ALL SELECT 'Mercedes', 'Alemanha'
  UNION ALL SELECT 'Alpine Renault', 'França'
  UNION ALL SELECT 'McLaren Mercedes', 'Reino Unido'
  UNION ALL SELECT 'Alfa Romeo Racing Ferrari', 'Suíça'
  UNION ALL SELECT 'Aston Martin Aramco Mercedes', 'Reino Unido'
  UNION ALL SELECT 'Haas Ferrari', 'Estados Unidos'
  UNION ALL SELECT 'AlphaTauri RBPT', 'Itália'
  UNION ALL SELECT 'Williams Mercedes', 'Reino Unido'
) x(nome,pais)
LEFT JOIN equipa e ON e.nome = x.nome
WHERE e.id_equipa IS NULL;

INSERT INTO piloto (nome, nacionalidade, data_nascimento)
SELECT x.nome, x.nac, x.dn
FROM (
  SELECT 'Max Verstappen','Países Baixos','1997-09-30'
  UNION ALL SELECT 'Charles Leclerc','Mónaco','1997-10-16'
  UNION ALL SELECT 'Sergio Perez','México','1990-01-26'
  UNION ALL SELECT 'George Russell','Reino Unido','1998-02-15'
  UNION ALL SELECT 'Carlos Sainz','Espanha','1994-09-01'
  UNION ALL SELECT 'Lewis Hamilton','Reino Unido','1985-01-07'
  UNION ALL SELECT 'Lando Norris','Reino Unido','1999-11-13'
  UNION ALL SELECT 'Esteban Ocon','França','1996-09-17'
  UNION ALL SELECT 'Fernando Alonso','Espanha','1981-07-29'
  UNION ALL SELECT 'Valtteri Bottas','Finlândia','1989-08-28'
  UNION ALL SELECT 'Daniel Ricciardo','Austrália','1989-07-01'
  UNION ALL SELECT 'Sebastian Vettel','Alemanha','1987-07-03'
  UNION ALL SELECT 'Kevin Magnussen','Dinamarca','1992-10-05'
  UNION ALL SELECT 'Pierre Gasly','França','1996-02-07'
  UNION ALL SELECT 'Lance Stroll','Canadá','1998-10-29'
  UNION ALL SELECT 'Yuki Tsunoda','Japão','2000-05-11'
  UNION ALL SELECT 'Guanyu Zhou','China','1999-05-30'
  UNION ALL SELECT 'Alexander Albon','Tailândia','1996-03-23'
  UNION ALL SELECT 'Nicholas Latifi','Canadá','1995-06-29'
  UNION ALL SELECT 'Mick Schumacher','Alemanha','1999-03-22'
) x(nome,nac,dn)
LEFT JOIN piloto p ON p.nome = x.nome
WHERE p.id_piloto IS NULL;

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT
  'Classificação Final 2022',
  '2022-12-31',
  t.id_temporada,
  ci.id_circuito
FROM temporada t
JOIN circuito ci ON ci.nome = 'Resumo Temporada (Classificação Final)'
WHERE t.ano = 2022;

INSERT INTO resultado (id_corrida, id_piloto, id_equipa, posicao, pontos)
SELECT
  c.id_corrida,
  p.id_piloto,
  e.id_equipa,
  x.posicao,
  x.pontos
FROM (
  SELECT 1,'Max Verstappen','Red Bull Racing RBPT',454.0
  UNION ALL SELECT 2,'Charles Leclerc','Ferrari',308.0
  UNION ALL SELECT 3,'Sergio Perez','Red Bull Racing RBPT',305.0
  UNION ALL SELECT 4,'George Russell','Mercedes',275.0
  UNION ALL SELECT 5,'Carlos Sainz','Ferrari',246.0
  UNION ALL SELECT 6,'Lewis Hamilton','Mercedes',240.0
  UNION ALL SELECT 7,'Lando Norris','McLaren Mercedes',122.0
  UNION ALL SELECT 8,'Esteban Ocon','Alpine Renault',92.0
  UNION ALL SELECT 9,'Fernando Alonso','Alpine Renault',81.0
  UNION ALL SELECT 10,'Valtteri Bottas','Alfa Romeo Racing Ferrari',49.0
  UNION ALL SELECT 11,'Daniel Ricciardo','McLaren Mercedes',37.0
  UNION ALL SELECT 12,'Sebastian Vettel','Aston Martin Aramco Mercedes',37.0
  UNION ALL SELECT 13,'Kevin Magnussen','Haas Ferrari',25.0
  UNION ALL SELECT 14,'Pierre Gasly','AlphaTauri RBPT',23.0
  UNION ALL SELECT 15,'Lance Stroll','Aston Martin Aramco Mercedes',18.0
  UNION ALL SELECT 16,'Yuki Tsunoda','AlphaTauri RBPT',12.0
  UNION ALL SELECT 17,'Guanyu Zhou','Alfa Romeo Racing Ferrari',6.0
  UNION ALL SELECT 18,'Alexander Albon','Williams Mercedes',4.0
  UNION ALL SELECT 19,'Nicholas Latifi','Williams Mercedes',2.0
  UNION ALL SELECT 20,'Mick Schumacher','Haas Ferrari',12.0
) x(posicao,piloto,equipa,pontos)
JOIN temporada t ON t.ano = 2022
JOIN corrida c ON c.nome = 'Classificação Final 2022' AND c.id_temporada = t.id_temporada
JOIN piloto p ON p.nome = x.piloto
JOIN equipa e ON e.nome = x.equipa
LEFT JOIN resultado r ON r.id_corrida = c.id_corrida AND r.id_piloto = p.id_piloto
WHERE r.id_resultado IS NULL;
