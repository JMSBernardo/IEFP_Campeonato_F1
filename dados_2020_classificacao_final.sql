USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2020);

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
  UNION ALL SELECT 'McLaren Renault', 'Reino Unido'
  UNION ALL SELECT 'Racing Point BWT Mercedes', 'Reino Unido'
  UNION ALL SELECT 'Renault', 'França'
  UNION ALL SELECT 'Ferrari', 'Itália'
  UNION ALL SELECT 'AlphaTauri Honda', 'Itália'
  UNION ALL SELECT 'Alfa Romeo Racing Ferrari', 'Suíça'
  UNION ALL SELECT 'Haas Ferrari', 'Estados Unidos'
  UNION ALL SELECT 'Williams Mercedes', 'Reino Unido'
) x
LEFT JOIN equipa e ON e.nome = x.nome
WHERE e.id_equipa IS NULL;

INSERT INTO piloto (nome, nacionalidade, data_nascimento)
SELECT x.nome, x.nac, x.dn
FROM (
  SELECT 'Lewis Hamilton' AS nome, 'Reino Unido', '1985-01-07'
  UNION ALL SELECT 'Valtteri Bottas', 'Finlândia', '1989-08-28'
  UNION ALL SELECT 'Max Verstappen', 'Países Baixos', '1997-09-30'
  UNION ALL SELECT 'Sergio Perez', 'México', '1990-01-26'
  UNION ALL SELECT 'Daniel Ricciardo', 'Austrália', '1989-07-01'
  UNION ALL SELECT 'Carlos Sainz', 'Espanha', '1994-09-01'
  UNION ALL SELECT 'Alexander Albon', 'Tailândia', '1996-03-23'
  UNION ALL SELECT 'Charles Leclerc', 'Mónaco', '1997-10-16'
  UNION ALL SELECT 'Lando Norris', 'Reino Unido', '1999-11-13'
  UNION ALL SELECT 'Pierre Gasly', 'França', '1996-02-07'
  UNION ALL SELECT 'Lance Stroll', 'Canadá', '1998-10-29'
  UNION ALL SELECT 'Esteban Ocon', 'França', '1996-09-17'
  UNION ALL SELECT 'Sebastian Vettel', 'Alemanha', '1987-07-03'
  UNION ALL SELECT 'Daniil Kvyat', 'Rússia', '1994-04-26'
  UNION ALL SELECT 'Nico Hulkenberg', 'Alemanha', '1987-08-19'
  UNION ALL SELECT 'Kimi Räikkönen', 'Finlândia', '1979-10-17'
  UNION ALL SELECT 'Antonio Giovinazzi', 'Itália', '1993-12-14'
  UNION ALL SELECT 'Kevin Magnussen', 'Dinamarca', '1992-10-05'
  UNION ALL SELECT 'Romain Grosjean', 'França', '1986-04-17'
  UNION ALL SELECT 'George Russell', 'Reino Unido', '1998-02-15'
  UNION ALL SELECT 'Nicholas Latifi', 'Canadá', '1995-06-29'
) x(nome, nac, dn)
LEFT JOIN piloto p ON p.nome = x.nome
WHERE p.id_piloto IS NULL;

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT
  'Classificação Final 2020',
  '2020-12-31',
  t.id_temporada,
  ci.id_circuito
FROM temporada t
JOIN circuito ci ON ci.nome = 'Resumo Temporada (Classificação Final)'
WHERE t.ano = 2020;

INSERT INTO resultado (id_corrida, id_piloto, id_equipa, posicao, pontos)
SELECT
  c.id_corrida,
  p.id_piloto,
  e.id_equipa,
  x.posicao,
  x.pontos
FROM (
  SELECT 1, 'Lewis Hamilton', 'Mercedes', 347.0
  UNION ALL SELECT 2, 'Valtteri Bottas', 'Mercedes', 223.0
  UNION ALL SELECT 3, 'Max Verstappen', 'Red Bull Racing Honda', 214.0
  UNION ALL SELECT 4, 'Sergio Perez', 'Racing Point BWT Mercedes', 125.0
  UNION ALL SELECT 5, 'Daniel Ricciardo', 'Renault', 119.0
  UNION ALL SELECT 6, 'Carlos Sainz', 'McLaren Renault', 105.0
  UNION ALL SELECT 7, 'Alexander Albon', 'Red Bull Racing Honda', 105.0
  UNION ALL SELECT 8, 'Charles Leclerc', 'Ferrari', 98.0
  UNION ALL SELECT 9, 'Lando Norris', 'McLaren Renault', 97.0
  UNION ALL SELECT 10, 'Pierre Gasly', 'AlphaTauri Honda', 75.0
  UNION ALL SELECT 11, 'Lance Stroll', 'Racing Point BWT Mercedes', 75.0
  UNION ALL SELECT 12, 'Esteban Ocon', 'Renault', 62.0
  UNION ALL SELECT 13, 'Sebastian Vettel', 'Ferrari', 33.0
  UNION ALL SELECT 14, 'Daniil Kvyat', 'AlphaTauri Honda', 32.0
  UNION ALL SELECT 15, 'Nico Hulkenberg', 'Racing Point BWT Mercedes', 10.0
  UNION ALL SELECT 16, 'Kimi Räikkönen', 'Alfa Romeo Racing Ferrari', 4.0
  UNION ALL SELECT 17, 'Antonio Giovinazzi', 'Alfa Romeo Racing Ferrari', 4.0
  UNION ALL SELECT 18, 'Kevin Magnussen', 'Haas Ferrari', 1.0
  UNION ALL SELECT 19, 'Romain Grosjean', 'Haas Ferrari', 0.0
  UNION ALL SELECT 20, 'George Russell', 'Williams Mercedes', 0.0
  UNION ALL SELECT 21, 'Nicholas Latifi', 'Williams Mercedes', 0.0
) x(posicao, piloto, equipa, pontos)
JOIN temporada t ON t.ano = 2020
JOIN corrida c ON c.nome = 'Classificação Final 2020' AND c.id_temporada = t.id_temporada
JOIN piloto p ON p.nome = x.piloto
JOIN equipa e ON e.nome = x.equipa
LEFT JOIN resultado r ON r.id_corrida = c.id_corrida AND r.id_piloto = p.id_piloto
WHERE r.id_resultado IS NULL;
