USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2018);

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
  UNION ALL SELECT 'Renault', 'França'
  UNION ALL SELECT 'Force India Mercedes', 'Índia'
  UNION ALL SELECT 'Haas Ferrari', 'Estados Unidos'
  UNION ALL SELECT 'McLaren Renault', 'Reino Unido'
  UNION ALL SELECT 'Sauber Ferrari', 'Suíça'
  UNION ALL SELECT 'Scuderia Toro Rosso Honda', 'Itália'
  UNION ALL SELECT 'Williams Mercedes', 'Reino Unido'
) x
LEFT JOIN equipa e ON e.nome = x.nome
WHERE e.id_equipa IS NULL;

INSERT INTO piloto (nome, nacionalidade, data_nascimento)
SELECT x.nome, x.nac, x.dn
FROM (
  SELECT 'Lewis Hamilton' AS nome, 'Reino Unido' AS nac, '1985-01-07' AS dn
  UNION ALL SELECT 'Sebastian Vettel', 'Alemanha', '1987-07-03'
  UNION ALL SELECT 'Kimi Räikkönen', 'Finlândia', '1979-10-17'
  UNION ALL SELECT 'Max Verstappen', 'Países Baixos', '1997-09-30'
  UNION ALL SELECT 'Valtteri Bottas', 'Finlândia', '1989-08-28'
  UNION ALL SELECT 'Daniel Ricciardo', 'Austrália', '1989-07-01'
  UNION ALL SELECT 'Nico Hulkenberg', 'Alemanha', '1987-08-19'
  UNION ALL SELECT 'Sergio Perez', 'México', '1990-01-26'
  UNION ALL SELECT 'Kevin Magnussen', 'Dinamarca', '1992-10-05'
  UNION ALL SELECT 'Carlos Sainz', 'Espanha', '1994-09-01'
  UNION ALL SELECT 'Fernando Alonso', 'Espanha', '1981-07-29'
  UNION ALL SELECT 'Esteban Ocon', 'França', '1996-09-17'
  UNION ALL SELECT 'Charles Leclerc', 'Mónaco', '1997-10-16'
  UNION ALL SELECT 'Romain Grosjean', 'França', '1986-04-17'
  UNION ALL SELECT 'Pierre Gasly', 'França', '1996-02-07'
  UNION ALL SELECT 'Stoffel Vandoorne', 'Bélgica', '1992-03-26'
  UNION ALL SELECT 'Marcus Ericsson', 'Suécia', '1990-09-02'
  UNION ALL SELECT 'Lance Stroll', 'Canadá', '1998-10-29'
  UNION ALL SELECT 'Brendon Hartley', 'Nova Zelândia', '1989-11-10'
  UNION ALL SELECT 'Sergey Sirotkin', 'Rússia', '1995-08-27'
) x
LEFT JOIN piloto p ON p.nome = x.nome
WHERE p.id_piloto IS NULL;

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT
  'Classificação Final 2018' AS nome,
  '2018-12-31' AS data,
  t.id_temporada,
  ci.id_circuito
FROM temporada t
JOIN circuito ci ON ci.nome = 'Resumo Temporada (Classificação Final)'
WHERE t.ano = 2018;

INSERT INTO resultado (id_corrida, id_piloto, id_equipa, posicao, pontos)
SELECT
  c.id_corrida,
  p.id_piloto,
  e.id_equipa,
  x.posicao,
  x.pontos
FROM (
  SELECT 1 AS posicao, 'Lewis Hamilton' AS piloto, 'Mercedes' AS equipa, 408.0 AS pontos
  UNION ALL SELECT 2, 'Sebastian Vettel', 'Ferrari', 320.0
  UNION ALL SELECT 3, 'Kimi Räikkönen', 'Ferrari', 251.0
  UNION ALL SELECT 4, 'Max Verstappen', 'Red Bull Racing TAG Heuer', 249.0
  UNION ALL SELECT 5, 'Valtteri Bottas', 'Mercedes', 247.0
  UNION ALL SELECT 6, 'Daniel Ricciardo', 'Red Bull Racing TAG Heuer', 170.0
  UNION ALL SELECT 7, 'Nico Hulkenberg', 'Renault', 69.0
  UNION ALL SELECT 8, 'Sergio Perez', 'Force India Mercedes', 62.0
  UNION ALL SELECT 9, 'Kevin Magnussen', 'Haas Ferrari', 56.0
  UNION ALL SELECT 10, 'Carlos Sainz', 'Renault', 53.0
  UNION ALL SELECT 11, 'Fernando Alonso', 'McLaren Renault', 50.0
  UNION ALL SELECT 12, 'Esteban Ocon', 'Force India Mercedes', 49.0
  UNION ALL SELECT 13, 'Charles Leclerc', 'Sauber Ferrari', 39.0
  UNION ALL SELECT 14, 'Romain Grosjean', 'Haas Ferrari', 37.0
  UNION ALL SELECT 15, 'Pierre Gasly', 'Scuderia Toro Rosso Honda', 29.0
  UNION ALL SELECT 16, 'Stoffel Vandoorne', 'McLaren Renault', 12.0
  UNION ALL SELECT 17, 'Marcus Ericsson', 'Sauber Ferrari', 9.0
  UNION ALL SELECT 18, 'Lance Stroll', 'Williams Mercedes', 6.0
  UNION ALL SELECT 19, 'Brendon Hartley', 'Scuderia Toro Rosso Honda', 4.0
  UNION ALL SELECT 20, 'Sergey Sirotkin', 'Williams Mercedes', 1.0
) x
JOIN temporada t ON t.ano = 2018
JOIN corrida c ON c.nome = 'Classificação Final 2018' AND c.id_temporada = t.id_temporada
JOIN piloto p ON p.nome = x.piloto
JOIN equipa e ON e.nome = x.equipa
LEFT JOIN resultado r ON r.id_corrida = c.id_corrida AND r.id_piloto = p.id_piloto
WHERE r.id_resultado IS NULL;

SELECT COUNT(*) AS pilotos_classificados_2018
FROM resultado r
JOIN corrida c ON r.id_corrida = c.id_corrida
JOIN temporada t ON c.id_temporada = t.id_temporada
WHERE t.ano = 2018 AND c.nome = 'Classificação Final 2018';
