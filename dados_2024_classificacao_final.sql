USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2024);

INSERT INTO circuito (nome, pais, comprimento_km)
SELECT 'Resumo Temporada (Classificação Final)', 'N/A', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM circuito WHERE nome = 'Resumo Temporada (Classificação Final)'
);

INSERT INTO equipa (nome, pais)
SELECT x.nome, x.pais
FROM (
  SELECT 'McLaren Mercedes' AS nome, 'Reino Unido' AS pais
  UNION ALL SELECT 'Ferrari', 'Itália'
  UNION ALL SELECT 'Red Bull Racing Honda RBPT', 'Áustria'
  UNION ALL SELECT 'Mercedes', 'Alemanha'
  UNION ALL SELECT 'Aston Martin Aramco Mercedes', 'Reino Unido'
  UNION ALL SELECT 'Alpine Renault', 'França'
  UNION ALL SELECT 'Haas Ferrari', 'Estados Unidos'
  UNION ALL SELECT 'RB Honda RBPT', 'Itália'
  UNION ALL SELECT 'Williams Mercedes', 'Reino Unido'
  UNION ALL SELECT 'Kick Sauber Ferrari', 'Suíça'
) x
LEFT JOIN equipa e ON e.nome = x.nome
WHERE e.id_equipa IS NULL;

INSERT INTO piloto (nome, nacionalidade, data_nascimento)
SELECT x.nome, x.nac, x.dn
FROM (
  SELECT 'Max Verstappen' AS nome, 'Países Baixos' AS nac, '1997-09-30' AS dn
  UNION ALL SELECT 'Lando Norris', 'Reino Unido', '1999-11-13'
  UNION ALL SELECT 'Charles Leclerc', 'Mónaco', '1997-10-16'
  UNION ALL SELECT 'Oscar Piastri', 'Austrália', '2001-04-06'
  UNION ALL SELECT 'Carlos Sainz', 'Espanha', '1994-09-01'
  UNION ALL SELECT 'George Russell', 'Reino Unido', '1998-02-15'
  UNION ALL SELECT 'Lewis Hamilton', 'Reino Unido', '1985-01-07'
  UNION ALL SELECT 'Sergio Perez', 'México', '1990-01-26'
  UNION ALL SELECT 'Fernando Alonso', 'Espanha', '1981-07-29'
  UNION ALL SELECT 'Pierre Gasly', 'França', '1996-02-07'
  UNION ALL SELECT 'Nico Hulkenberg', 'Alemanha', '1987-08-19'
  UNION ALL SELECT 'Yuki Tsunoda', 'Japão', '2000-05-11'
  UNION ALL SELECT 'Lance Stroll', 'Canadá', '1998-10-29'
  UNION ALL SELECT 'Esteban Ocon', 'França', '1996-09-17'
  UNION ALL SELECT 'Kevin Magnussen', 'Dinamarca', '1992-10-05'
  UNION ALL SELECT 'Alexander Albon', 'Tailândia', '1996-03-23'
  UNION ALL SELECT 'Daniel Ricciardo', 'Austrália', '1989-07-01'
  UNION ALL SELECT 'Oliver Bearman', 'Reino Unido', '2005-05-08'
  UNION ALL SELECT 'Franco Colapinto', 'Argentina', '2003-05-27'
  UNION ALL SELECT 'Zhou Guanyu', 'China', '1999-05-30'
  UNION ALL SELECT 'Liam Lawson', 'Nova Zelândia', '2002-02-11'
  UNION ALL SELECT 'Valtteri Bottas', 'Finlândia', '1989-08-28'
  UNION ALL SELECT 'Logan Sargeant', 'Estados Unidos', '2000-12-31'
  UNION ALL SELECT 'Jack Doohan', 'Austrália', '2003-01-20'
) x
LEFT JOIN piloto p ON p.nome = x.nome
WHERE p.id_piloto IS NULL;

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT
  'Classificação Final 2024',
  '2024-12-31',
  t.id_temporada,
  ci.id_circuito
FROM temporada t
JOIN circuito ci ON ci.nome = 'Resumo Temporada (Classificação Final)'
WHERE t.ano = 2024;

INSERT INTO resultado (id_corrida, id_piloto, id_equipa, posicao, pontos)
SELECT
  c.id_corrida,
  p.id_piloto,
  e.id_equipa,
  x.posicao,
  x.pontos
FROM (
  SELECT 1 AS posicao,  'Max Verstappen'  AS piloto, 'Red Bull Racing Honda RBPT' AS equipa, 437.0 AS pontos
  UNION ALL SELECT 2,  'Lando Norris',    'McLaren Mercedes',                374.0
  UNION ALL SELECT 3,  'Charles Leclerc', 'Ferrari',                         356.0
  UNION ALL SELECT 4,  'Oscar Piastri',   'McLaren Mercedes',                292.0
  UNION ALL SELECT 5,  'Carlos Sainz',    'Ferrari',                         290.0
  UNION ALL SELECT 6,  'George Russell',  'Mercedes',                        245.0
  UNION ALL SELECT 7,  'Lewis Hamilton',  'Mercedes',                        223.0
  UNION ALL SELECT 8,  'Sergio Perez',    'Red Bull Racing Honda RBPT',      152.0
  UNION ALL SELECT 9,  'Fernando Alonso', 'Aston Martin Aramco Mercedes',     70.0
  UNION ALL SELECT 10, 'Pierre Gasly',    'Alpine Renault',                   42.0
  UNION ALL SELECT 11, 'Nico Hulkenberg', 'Haas Ferrari',                     41.0
  UNION ALL SELECT 12, 'Yuki Tsunoda',    'RB Honda RBPT',                    30.0
  UNION ALL SELECT 13, 'Lance Stroll',    'Aston Martin Aramco Mercedes',     24.0
  UNION ALL SELECT 14, 'Esteban Ocon',    'Alpine Renault',                   23.0
  UNION ALL SELECT 15, 'Kevin Magnussen', 'Haas Ferrari',                     16.0
  UNION ALL SELECT 16, 'Alexander Albon', 'Williams Mercedes',               12.0
  UNION ALL SELECT 17, 'Daniel Ricciardo','RB Honda RBPT',                    12.0
  UNION ALL SELECT 18, 'Oliver Bearman',  'Haas Ferrari',                      7.0
  UNION ALL SELECT 19, 'Franco Colapinto','Williams Mercedes',                5.0
  UNION ALL SELECT 20, 'Zhou Guanyu',     'Kick Sauber Ferrari',              4.0
  UNION ALL SELECT 21, 'Liam Lawson',     'RB Honda RBPT',                    4.0
  UNION ALL SELECT 22, 'Valtteri Bottas', 'Kick Sauber Ferrari',              0.0
  UNION ALL SELECT 23, 'Logan Sargeant',  'Williams Mercedes',                0.0
  UNION ALL SELECT 24, 'Jack Doohan',     'Alpine Renault',                   0.0
) x
JOIN temporada t ON t.ano = 2024
JOIN corrida c   ON c.nome = 'Classificação Final 2024' AND c.id_temporada = t.id_temporada
JOIN piloto p    ON p.nome = x.piloto
JOIN equipa e    ON e.nome = x.equipa
LEFT JOIN resultado r ON r.id_corrida = c.id_corrida AND r.id_piloto = p.id_piloto
WHERE r.id_resultado IS NULL;
