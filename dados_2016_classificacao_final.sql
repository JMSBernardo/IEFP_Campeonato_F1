USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2016);

INSERT INTO circuito (nome, pais, comprimento_km)
SELECT 'Resumo Temporada (Classificação Final)', 'N/A', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM circuito WHERE nome = 'Resumo Temporada (Classificação Final)'
);


INSERT INTO equipa (nome, pais)
SELECT x.nome, x.pais
FROM (
  SELECT 'Mercedes' AS nome, 'Alemanha' AS pais
  UNION ALL SELECT 'Red Bull Racing TAG Heuer', 'Áustria'
  UNION ALL SELECT 'Ferrari', 'Itália'
  UNION ALL SELECT 'Force India Mercedes', 'Índia'
  UNION ALL SELECT 'Williams Mercedes', 'Reino Unido'
  UNION ALL SELECT 'McLaren Honda', 'Reino Unido'
  UNION ALL SELECT 'Toro Rosso Ferrari', 'Itália'
  UNION ALL SELECT 'Haas Ferrari', 'Estados Unidos'
  UNION ALL SELECT 'Renault', 'França'
  UNION ALL SELECT 'Sauber Ferrari', 'Suíça'
  UNION ALL SELECT 'MRT Mercedes', 'Reino Unido'
) x
LEFT JOIN equipa e ON e.nome = x.nome
WHERE e.id_equipa IS NULL;

INSERT INTO piloto (nome, nacionalidade, data_nascimento)
SELECT x.nome, x.nac, x.dn
FROM (
  SELECT 'Nico Rosberg' AS nome, 'Alemanha' AS nac, '1985-06-27' AS dn
  UNION ALL SELECT 'Lewis Hamilton', 'Reino Unido', '1985-01-07'
  UNION ALL SELECT 'Daniel Ricciardo', 'Austrália', '1989-07-01'
  UNION ALL SELECT 'Sebastian Vettel', 'Alemanha', '1987-07-03'
  UNION ALL SELECT 'Max Verstappen', 'Países Baixos', '1997-09-30'
  UNION ALL SELECT 'Kimi Räikkönen', 'Finlândia', '1979-10-17'
  UNION ALL SELECT 'Sergio Perez', 'México', '1990-01-26'
  UNION ALL SELECT 'Valtteri Bottas', 'Finlândia', '1989-08-28'
  UNION ALL SELECT 'Nico Hulkenberg', 'Alemanha', '1987-08-19'
  UNION ALL SELECT 'Fernando Alonso', 'Espanha', '1981-07-29'
  UNION ALL SELECT 'Felipe Massa', 'Brasil', '1981-04-25'
  UNION ALL SELECT 'Carlos Sainz', 'Espanha', '1994-09-01'
  UNION ALL SELECT 'Romain Grosjean', 'França', '1986-04-17'
  UNION ALL SELECT 'Daniil Kvyat', 'Rússia', '1994-04-26'
  UNION ALL SELECT 'Jenson Button', 'Reino Unido', '1980-01-19'
  UNION ALL SELECT 'Kevin Magnussen', 'Dinamarca', '1992-10-05'
  UNION ALL SELECT 'Felipe Nasr', 'Brasil', '1992-08-21'
  UNION ALL SELECT 'Jolyon Palmer', 'Reino Unido', '1991-01-20'
  UNION ALL SELECT 'Pascal Wehrlein', 'Alemanha', '1994-10-18'
  UNION ALL SELECT 'Stoffel Vandoorne', 'Bélgica', '1992-03-26'
  UNION ALL SELECT 'Esteban Gutierrez', 'México', '1991-08-05'
  UNION ALL SELECT 'Marcus Ericsson', 'Suécia', '1990-09-02'
  UNION ALL SELECT 'Esteban Ocon', 'França', '1996-09-17'
  UNION ALL SELECT 'Rio Haryanto', 'Indonésia', '1993-01-22'
) x
LEFT JOIN piloto p ON p.nome = x.nome
WHERE p.id_piloto IS NULL;

INSERT INTO corrida (nome, data, id_temporada, id_circuito)
SELECT
  'Classificação Final 2016' AS nome,
  '2016-12-31' AS data,
  t.id_temporada,
  ci.id_circuito
FROM temporada t
JOIN circuito ci ON ci.nome = 'Resumo Temporada (Classificação Final)'
LEFT JOIN corrida c ON c.nome = 'Classificação Final 2016' AND c.id_temporada = t.id_temporada
WHERE t.ano = 2016 AND c.id_corrida IS NULL;


INSERT INTO resultado (id_corrida, id_piloto, id_equipa, posicao, pontos)
SELECT
  c.id_corrida,
  p.id_piloto,
  e.id_equipa,
  x.posicao,
  x.pontos
FROM (
  SELECT 1 AS posicao, 'Nico Rosberg' AS piloto, 'Mercedes' AS equipa, 385.0 AS pontos
  UNION ALL SELECT 2, 'Lewis Hamilton', 'Mercedes', 380.0
  UNION ALL SELECT 3, 'Daniel Ricciardo', 'Red Bull Racing TAG Heuer', 256.0
  UNION ALL SELECT 4, 'Sebastian Vettel', 'Ferrari', 212.0
  UNION ALL SELECT 5, 'Max Verstappen', 'Red Bull Racing TAG Heuer', 204.0
  UNION ALL SELECT 6, 'Kimi Räikkönen', 'Ferrari', 186.0
  UNION ALL SELECT 7, 'Sergio Perez', 'Force India Mercedes', 101.0
  UNION ALL SELECT 8, 'Valtteri Bottas', 'Williams Mercedes', 85.0
  UNION ALL SELECT 9, 'Nico Hulkenberg', 'Force India Mercedes', 72.0
  UNION ALL SELECT 10, 'Fernando Alonso', 'McLaren Honda', 54.0
  UNION ALL SELECT 11, 'Felipe Massa', 'Williams Mercedes', 53.0
  UNION ALL SELECT 12, 'Carlos Sainz', 'Toro Rosso Ferrari', 46.0
  UNION ALL SELECT 13, 'Romain Grosjean', 'Haas Ferrari', 29.0
  UNION ALL SELECT 14, 'Daniil Kvyat', 'Toro Rosso Ferrari', 25.0
  UNION ALL SELECT 15, 'Jenson Button', 'McLaren Honda', 21.0
  UNION ALL SELECT 16, 'Kevin Magnussen', 'Renault', 7.0
  UNION ALL SELECT 17, 'Felipe Nasr', 'Sauber Ferrari', 2.0
  UNION ALL SELECT 18, 'Jolyon Palmer', 'Renault', 1.0
  UNION ALL SELECT 19, 'Pascal Wehrlein', 'MRT Mercedes', 1.0
  UNION ALL SELECT 20, 'Stoffel Vandoorne', 'McLaren Honda', 1.0
  UNION ALL SELECT 21, 'Esteban Gutierrez', 'Haas Ferrari', 0.0
  UNION ALL SELECT 22, 'Marcus Ericsson', 'Sauber Ferrari', 0.0
  UNION ALL SELECT 23, 'Esteban Ocon', 'MRT Mercedes', 0.0
  UNION ALL SELECT 24, 'Rio Haryanto', 'MRT Mercedes', 0.0
) x
JOIN temporada t ON t.ano = 2016
JOIN corrida c ON c.nome = 'Classificação Final 2016' AND c.id_temporada = t.id_temporada
JOIN piloto p ON p.nome = x.piloto
JOIN equipa e ON e.nome = x.equipa
LEFT JOIN resultado r
  ON r.id_corrida = c.id_corrida AND r.id_piloto = p.id_piloto
WHERE r.id_resultado IS NULL;

SELECT COUNT(*) AS pilotos_classificados_2016
FROM resultado r
JOIN corrida c ON r.id_corrida = c.id_corrida
JOIN temporada t ON c.id_temporada = t.id_temporada
WHERE t.ano = 2016 AND c.nome = 'Classificação Final 2016';
