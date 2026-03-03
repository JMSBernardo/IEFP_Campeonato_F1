USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2023);

INSERT INTO circuito (nome, pais, comprimento_km)
SELECT 'Resumo Temporada (Classificação Final)', 'N/A', NULL
WHERE NOT EXISTS (
  SELECT 1 FROM circuito WHERE nome = 'Resumo Temporada (Classificação Final)'
);

INSERT INTO equipa (nome, pais)
SELECT x.nome, x.pais
FROM (
  SELECT 'Red Bull Racing Honda RBPT','Áustria'
  UNION ALL SELECT 'Mercedes','Alemanha'
  UNION ALL SELECT 'Ferrari','Itália'
  UNION ALL SELECT 'McLaren Mercedes','Reino Unido'
  UNION ALL SELECT 'Aston Martin Aramco Mercedes','Reino Unido'
  UNION ALL SELECT 'Alpine Renault','França'
  UNION ALL SELECT 'Williams Mercedes','Reino Unido'
  UNION ALL SELECT 'AlphaTauri Honda RBPT','Itália'
  UNION ALL SELECT 'Alfa Romeo Racing Ferrari','Suíça'
  UNION ALL SELECT 'Haas Ferrari','Estados Unidos'
) x(nome,pais)
LEFT JOIN equipa e ON e.nome = x.nome
WHERE e.id_equipa IS NULL;

INSERT INTO piloto (nome, nacionalidade, data_nascimento)
SELECT x.nome, x.nac, x.dn
FROM (
  SELECT 'Max Verstappen','Países Baixos','1997-09-30'
  UNION ALL SELECT 'Sergio Perez','México','1990-01-26'
  UNION ALL SELECT 'Lewis Hamilton','Reino Unido','1985-01-07'
  UNION ALL SELECT 'Fernando Alonso','Espanha','1981-07-29'
  UNION ALL SELECT 'Charles Leclerc','Mónaco','1997-10-16'
  UNION ALL SELECT 'Lando Norris','Reino Unido','1999-11-13'
  UNION ALL SELECT 'Carlos Sainz','Espanha','1994-09-01'
  UNION ALL SELECT 'George Russell','Reino Unido','1998-02-15'
  UNION ALL SELECT 'Oscar Piastri','Austrália','2001-04-06'
  UNION ALL SELECT 'Lance Stroll','Canadá','1998-10-29'
  UNION ALL SELECT 'Pierre Gasly','França','1996-02-07'
  UNION ALL SELECT 'Esteban Ocon','França','1996-09-17'
  UNION ALL SELECT 'Alexander Albon','Tailândia','1996-03-23'
  UNION ALL SELECT 'Yuki Tsunoda','Japão','2000-05-11'
  UNION ALL SELECT 'Valtteri Bottas','Finlândia','1989-08-28'
  UNION ALL SELECT 'Nico Hulkenberg','Alemanha','1987-08-19'
  UNION ALL SELECT 'Daniel Ricciardo','Austrália','1989-07-01'
  UNION ALL SELECT 'Zhou Guanyu','China','1999-05-30'
  UNION ALL SELECT 'Kevin Magnussen','Dinamarca','1992-10-05'
  UNION ALL SELECT 'Logan Sargeant','Estados Unidos','2000-12-31'
) x(nome,nac,dn)
LEFT JOIN piloto p ON p.nome = x.nome
WHERE p.id_piloto IS NULL;

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT
  'Classificação Final 2023',
  '2023-12-31',
  t.id_temporada,
  ci.id_circuito
FROM temporada t
JOIN circuito ci ON ci.nome = 'Resumo Temporada (Classificação Final)'
WHERE t.ano = 2023;

INSERT INTO resultado (id_corrida, id_piloto, id_equipa, posicao, pontos)
SELECT
  c.id_corrida,
  p.id_piloto,
  e.id_equipa,
  x.posicao,
  x.pontos
FROM (
  SELECT 1,'Max Verstappen','Red Bull Racing Honda RBPT',575.0
  UNION ALL SELECT 2,'Sergio Perez','Red Bull Racing Honda RBPT',285.0
  UNION ALL SELECT 3,'Lewis Hamilton','Mercedes',234.0
  UNION ALL SELECT 4,'Fernando Alonso','Aston Martin Aramco Mercedes',206.0
  UNION ALL SELECT 5,'Charles Leclerc','Ferrari',206.0
  UNION ALL SELECT 6,'Lando Norris','McLaren Mercedes',205.0
  UNION ALL SELECT 7,'Carlos Sainz','Ferrari',200.0
  UNION ALL SELECT 8,'George Russell','Mercedes',175.0
  UNION ALL SELECT 9,'Oscar Piastri','McLaren Mercedes',97.0
  UNION ALL SELECT 10,'Lance Stroll','Aston Martin Aramco Mercedes',74.0
  UNION ALL SELECT 11,'Pierre Gasly','Alpine Renault',62.0
  UNION ALL SELECT 12,'Esteban Ocon','Alpine Renault',58.0
  UNION ALL SELECT 13,'Alexander Albon','Williams Mercedes',27.0
  UNION ALL SELECT 14,'Yuki Tsunoda','AlphaTauri Honda RBPT',17.0
  UNION ALL SELECT 15,'Valtteri Bottas','Alfa Romeo Racing Ferrari',10.0
  UNION ALL SELECT 16,'Nico Hulkenberg','Haas Ferrari',9.0
  UNION ALL SELECT 17,'Daniel Ricciardo','AlphaTauri Honda RBPT',6.0
  UNION ALL SELECT 18,'Zhou Guanyu','Alfa Romeo Racing Ferrari',6.0
  UNION ALL SELECT 19,'Kevin Magnussen','Haas Ferrari',3.0
  UNION ALL SELECT 20,'Logan Sargeant','Williams Mercedes',1.0
) x(posicao,piloto,equipa,pontos)
JOIN temporada t ON t.ano = 2023
JOIN corrida c ON c.nome = 'Classificação Final 2023' AND c.id_temporada = t.id_temporada
JOIN piloto p ON p.nome = x.piloto
JOIN equipa e ON e.nome = x.equipa
LEFT JOIN resultado r ON r.id_corrida = c.id_corrida AND r.id_piloto = p.id_piloto
WHERE r.id_resultado IS NULL;
