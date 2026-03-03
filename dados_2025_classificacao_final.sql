USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2025);

INSERT INTO circuito (nome, pais, comprimento_km)
SELECT 'Resumo Temporada (Classificação Final)', 'N/A', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM circuito WHERE nome = 'Resumo Temporada (Classificação Final)'
);

INSERT INTO equipa (nome, pais)
SELECT x.nome, x.pais
FROM (
  SELECT 'McLaren' AS nome, 'Reino Unido' AS pais
  UNION ALL SELECT 'Red Bull Racing', 'Áustria'
  UNION ALL SELECT 'Mercedes', 'Alemanha'
  UNION ALL SELECT 'Ferrari', 'Itália'
  UNION ALL SELECT 'Williams', 'Reino Unido'
  UNION ALL SELECT 'Aston Martin', 'Reino Unido'
  UNION ALL SELECT 'Kick Sauber', 'Suíça'
  UNION ALL SELECT 'Racing Bulls', 'Itália'
  UNION ALL SELECT 'Haas F1 Team', 'Estados Unidos'
  UNION ALL SELECT 'Alpine', 'França'
) x
LEFT JOIN equipa e ON e.nome = x.nome
WHERE e.id_equipa IS NULL;

INSERT INTO piloto (nome, nacionalidade, data_nascimento)
SELECT x.nome, x.nac, x.dn
FROM (
  SELECT 'Lando Norris' AS nome, 'Reino Unido' AS nac, '1999-11-13' AS dn
  UNION ALL SELECT 'Max Verstappen', 'Países Baixos', '1997-09-30'
  UNION ALL SELECT 'Oscar Piastri', 'Austrália', '2001-04-06'
  UNION ALL SELECT 'George Russell', 'Reino Unido', '1998-02-15'
  UNION ALL SELECT 'Charles Leclerc', 'Mónaco', '1997-10-16'
  UNION ALL SELECT 'Lewis Hamilton', 'Reino Unido', '1985-01-07'
  UNION ALL SELECT 'Kimi Antonelli', 'Itália', '2006-08-25'
  UNION ALL SELECT 'Alexander Albon', 'Tailândia', '1996-03-23'
  UNION ALL SELECT 'Carlos Sainz', 'Espanha', '1994-09-01'
  UNION ALL SELECT 'Fernando Alonso', 'Espanha', '1981-07-29'
  UNION ALL SELECT 'Nico Hulkenberg', 'Alemanha', '1987-08-19'
  UNION ALL SELECT 'Isack Hadjar', 'França', '2004-09-28'
  UNION ALL SELECT 'Oliver Bearman', 'Reino Unido', '2005-05-08'
  UNION ALL SELECT 'Liam Lawson', 'Nova Zelândia', '2002-02-11'
  UNION ALL SELECT 'Esteban Ocon', 'França', '1996-09-17'
  UNION ALL SELECT 'Lance Stroll', 'Canadá', '1998-10-29'
  UNION ALL SELECT 'Yuki Tsunoda', 'Japão', '2000-05-11'
  UNION ALL SELECT 'Pierre Gasly', 'França', '1996-02-07'
  UNION ALL SELECT 'Gabriel Bortoleto', 'Brasil', '2004-10-14'
  UNION ALL SELECT 'Franco Colapinto', 'Argentina', '2003-05-27'
  UNION ALL SELECT 'Jack Doohan', 'Austrália', '2003-01-20'
) x
LEFT JOIN piloto p ON p.nome = x.nome
WHERE p.id_piloto IS NULL;

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT
  'Classificação Final 2025',
  '2025-12-31',
  t.id_temporada,
  ci.id_circuito
FROM temporada t
JOIN circuito ci ON ci.nome = 'Resumo Temporada (Classificação Final)'
WHERE t.ano = 2025;

INSERT INTO resultado (id_corrida, id_piloto, id_equipa, posicao, pontos)
SELECT
  c.id_corrida,
  p.id_piloto,
  e.id_equipa,
  x.posicao,
  x.pontos
FROM (
  SELECT 1 AS posicao, 'Lando Norris' AS piloto, 'McLaren' AS equipa, 423.0 AS pontos
  UNION ALL SELECT 2, 'Max Verstappen', 'Red Bull Racing', 421.0
  UNION ALL SELECT 3, 'Oscar Piastri', 'McLaren', 410.0
  UNION ALL SELECT 4, 'George Russell', 'Mercedes', 319.0
  UNION ALL SELECT 5, 'Charles Leclerc', 'Ferrari', 242.0
  UNION ALL SELECT 6, 'Lewis Hamilton', 'Ferrari', 156.0
  UNION ALL SELECT 7, 'Kimi Antonelli', 'Mercedes', 150.0
  UNION ALL SELECT 8, 'Alexander Albon', 'Williams', 73.0
  UNION ALL SELECT 9, 'Carlos Sainz', 'Williams', 64.0
  UNION ALL SELECT 10, 'Fernando Alonso', 'Aston Martin', 56.0
  UNION ALL SELECT 11, 'Nico Hulkenberg', 'Kick Sauber', 51.0
  UNION ALL SELECT 12, 'Isack Hadjar', 'Racing Bulls', 51.0
  UNION ALL SELECT 13, 'Oliver Bearman', 'Haas F1 Team', 41.0
  UNION ALL SELECT 14, 'Liam Lawson', 'Racing Bulls', 38.0
  UNION ALL SELECT 15, 'Esteban Ocon', 'Haas F1 Team', 38.0
  UNION ALL SELECT 16, 'Lance Stroll', 'Aston Martin', 33.0
  UNION ALL SELECT 17, 'Yuki Tsunoda', 'Red Bull Racing', 33.0
  UNION ALL SELECT 18, 'Pierre Gasly', 'Alpine', 22.0
  UNION ALL SELECT 19, 'Gabriel Bortoleto', 'Kick Sauber', 19.0
  UNION ALL SELECT 20, 'Franco Colapinto', 'Alpine', 0.0
  UNION ALL SELECT 21, 'Jack Doohan', 'Alpine', 0.0
) x
JOIN temporada t ON t.ano = 2025
JOIN corrida c ON c.nome = 'Classificação Final 2025' AND c.id_temporada = t.id_temporada
JOIN piloto p ON p.nome = x.piloto
JOIN equipa e ON e.nome = x.equipa
LEFT JOIN resultado r ON r.id_corrida = c.id_corrida AND r.id_piloto = p.id_piloto
WHERE r.id_resultado IS NULL;
