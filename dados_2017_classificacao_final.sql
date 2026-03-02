USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2017);

INSERT INTO circuito (nome, pais, comprimento_km)
SELECT 'Resumo Temporada (Classificação Final)', 'N/A', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM circuito WHERE nome = 'Resumo Temporada (Classificação Final)'
);

INSERT INTO equipa (nome, pais)
SELECT x.nome, x.pais
FROM (
  SELECT 'Mercedes' AS nome, 'Alemanha' AS pais
  UNION ALL SELECT 'Ferrari', 'Itália'
  UNION ALL SELECT 'Red Bull Racing TAG Heuer', 'Áustria'
  UNION ALL SELECT 'Force India Mercedes', 'Índia'
  UNION ALL SELECT 'Williams Mercedes', 'Reino Unido'
  UNION ALL SELECT 'Renault', 'França'
  UNION ALL SELECT 'Toro Rosso', 'Itália'
  UNION ALL SELECT 'Haas Ferrari', 'Estados Unidos'
  UNION ALL SELECT 'McLaren Honda', 'Reino Unido'
  UNION ALL SELECT 'Sauber Ferrari', 'Suíça'
) x
LEFT JOIN equipa e ON e.nome = x.nome
WHERE e.id_equipa IS NULL;

INSERT INTO piloto (nome, nacionalidade, data_nascimento)
SELECT x.nome, x.nac, x.dn
FROM (
  SELECT 'Lewis Hamilton' AS nome, 'Reino Unido' AS nac, '1985-01-07' AS dn
  UNION ALL SELECT 'Sebastian Vettel', 'Alemanha', '1987-07-03'
  UNION ALL SELECT 'Valtteri Bottas', 'Finlândia', '1989-08-28'
  UNION ALL SELECT 'Kimi Räikkönen', 'Finlândia', '1979-10-17'
  UNION ALL SELECT 'Daniel Ricciardo', 'Austrália', '1989-07-01'
  UNION ALL SELECT 'Max Verstappen', 'Países Baixos', '1997-09-30'
  UNION ALL SELECT 'Sergio Perez', 'México', '1990-01-26'
  UNION ALL SELECT 'Esteban Ocon', 'França', '1996-09-17'
  UNION ALL SELECT 'Carlos Sainz', 'Espanha', '1994-09-01'
  UNION ALL SELECT 'Nico Hulkenberg', 'Alemanha', '1987-08-19'
  UNION ALL SELECT 'Felipe Massa', 'Brasil', '1981-04-25'
  UNION ALL SELECT 'Lance Stroll', 'Canadá', '1998-10-29'
  UNION ALL SELECT 'Romain Grosjean', 'França', '1986-04-17'
  UNION ALL SELECT 'Kevin Magnussen', 'Dinamarca', '1992-10-05'
  UNION ALL SELECT 'Fernando Alonso', 'Espanha', '1981-07-29'
  UNION ALL SELECT 'Stoffel Vandoorne', 'Bélgica', '1992-03-26'
  UNION ALL SELECT 'Jolyon Palmer', 'Reino Unido', '1991-01-20'
  UNION ALL SELECT 'Pascal Wehrlein', 'Alemanha', '1994-10-18'
  UNION ALL SELECT 'Daniil Kvyat', 'Rússia', '1994-04-26'
  UNION ALL SELECT 'Marcus Ericsson', 'Suécia', '1990-09-02'
  UNION ALL SELECT 'Pierre Gasly', 'França', '1996-02-07'
  UNION ALL SELECT 'Antonio Giovinazzi', 'Itália', '1993-12-14'
  UNION ALL SELECT 'Brendon Hartley', 'Nova Zelândia', '1989-11-10'
) x
LEFT JOIN piloto p ON p.nome = x.nome
WHERE p.id_piloto IS NULL;

INSERT INTO corrida (nome, data, id_temporada, id_circuito)
SELECT
  'Classificação Final 2017' AS nome,
  '2017-12-31' AS data,
  t.id_temporada,
  ci.id_circuito
FROM temporada t
JOIN circuito ci ON ci.nome = 'Resumo Temporada (Classificação Final)'
LEFT JOIN corrida c ON c.nome = 'Classificação Final 2017' AND c.id_temporada = t.id_temporada
WHERE t.ano = 2017 AND c.id_corrida IS NULL;

INSERT INTO resultado (id_corrida, id_piloto, id_equipa, posicao, pontos)
SELECT
  c.id_corrida,
  p.id_piloto,
  e.id_equipa,
  x.posicao,
  x.pontos
FROM (
  SELECT 1 AS posicao,  'Lewis Hamilton' AS piloto,      'Mercedes' AS equipa,              363.0 AS pontos
  UNION ALL SELECT 2,   'Sebastian Vettel',              'Ferrari',                          317.0
  UNION ALL SELECT 3,   'Valtteri Bottas',               'Mercedes',                         305.0
  UNION ALL SELECT 4,   'Kimi Räikkönen',                'Ferrari',                          205.0
  UNION ALL SELECT 5,   'Daniel Ricciardo',              'Red Bull Racing TAG Heuer',        200.0
  UNION ALL SELECT 6,   'Max Verstappen',                'Red Bull Racing TAG Heuer',        168.0
  UNION ALL SELECT 7,   'Sergio Perez',                  'Force India Mercedes',             100.0
  UNION ALL SELECT 8,   'Esteban Ocon',                  'Force India Mercedes',              87.0
  UNION ALL SELECT 9,   'Carlos Sainz',                  'Renault',                           54.0
  UNION ALL SELECT 10,  'Nico Hulkenberg',               'Renault',                           43.0
  UNION ALL SELECT 11,  'Felipe Massa',                  'Williams Mercedes',                 43.0
  UNION ALL SELECT 12,  'Lance Stroll',                  'Williams Mercedes',                 40.0
  UNION ALL SELECT 13,  'Romain Grosjean',               'Haas Ferrari',                      28.0
  UNION ALL SELECT 14,  'Kevin Magnussen',               'Haas Ferrari',                      19.0
  UNION ALL SELECT 15,  'Fernando Alonso',               'McLaren Honda',                     17.0
  UNION ALL SELECT 16,  'Stoffel Vandoorne',             'McLaren Honda',                     13.0
  UNION ALL SELECT 17,  'Jolyon Palmer',                 'Renault',                             8.0
  UNION ALL SELECT 18,  'Pascal Wehrlein',               'Sauber Ferrari',                     5.0
  UNION ALL SELECT 19,  'Daniil Kvyat',                  'Toro Rosso',                         5.0
  UNION ALL SELECT 20,  'Marcus Ericsson',               'Sauber Ferrari',                     0.0
  UNION ALL SELECT 21,  'Pierre Gasly',                  'Toro Rosso',                         0.0
  UNION ALL SELECT 22,  'Antonio Giovinazzi',            'Sauber Ferrari',                     0.0
  UNION ALL SELECT 23,  'Brendon Hartley',               'Toro Rosso',                         0.0
) x
JOIN temporada t ON t.ano = 2017
JOIN corrida c   ON c.nome = 'Classificação Final 2017' AND c.id_temporada = t.id_temporada
JOIN piloto p    ON p.nome = x.piloto
JOIN equipa e    ON e.nome = x.equipa
LEFT JOIN resultado r ON r.id_corrida = c.id_corrida AND r.id_piloto = p.id_piloto
WHERE r.id_resultado IS NULL;


