USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2016);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Albert Park Circuit', 'Austrália', NULL),
('Bahrain International Circuit', 'Bahrein', NULL),
('Shanghai International Circuit', 'China', NULL),
('Sochi Autodrom', 'Rússia', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Circuit de Monaco', 'Mónaco', NULL),
('Circuit Gilles Villeneuve', 'Canadá', NULL),
('Baku City Circuit', 'Azerbaijão', NULL),
('Red Bull Ring', 'Áustria', NULL),
('Silverstone Circuit', 'Reino Unido', NULL),
('Hungaroring', 'Hungria', NULL),
('Hockenheimring', 'Alemanha', NULL),
('Circuit de Spa-Francorchamps', 'Bélgica', NULL),
('Autodromo Nazionale di Monza', 'Itália', NULL),
('Marina Bay Street Circuit', 'Singapura', NULL),
('Sepang International Circuit', 'Malásia', NULL),
('Suzuka Circuit', 'Japão', NULL),
('Circuit of the Americas', 'Estados Unidos', NULL),
('Autodromo Hermanos Rodriguez', 'México', NULL),
('Autodromo Jose Carlos Pace', 'Brasil', NULL),
('Yas Marina Circuit', 'Emirados Árabes Unidos', NULL);

INSERT INTO corrida (nome, data, id_temporada, id_circuito)
SELECT x.nome_corrida, x.data_corrida, t.id_temporada, c.id_circuito
FROM (
  SELECT 'GP da Austrália 2016' AS nome_corrida, '2016-03-20' AS data_corrida, 'Albert Park Circuit' AS nome_circuito
  UNION ALL SELECT 'GP do Bahrein 2016', '2016-04-03', 'Bahrain International Circuit'
  UNION ALL SELECT 'GP da China 2016', '2016-04-17', 'Shanghai International Circuit'
  UNION ALL SELECT 'GP da Rússia 2016', '2016-05-01', 'Sochi Autodrom'
  UNION ALL SELECT 'GP de Espanha 2016', '2016-05-15', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP do Mónaco 2016', '2016-05-29', 'Circuit de Monaco'
  UNION ALL SELECT 'GP do Canadá 2016', '2016-06-12', 'Circuit Gilles Villeneuve'
  UNION ALL SELECT 'GP da Europa 2016', '2016-06-19', 'Baku City Circuit'
  UNION ALL SELECT 'GP da Áustria 2016', '2016-07-03', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2016', '2016-07-10', 'Silverstone Circuit'
  UNION ALL SELECT 'GP da Hungria 2016', '2016-07-24', 'Hungaroring'
  UNION ALL SELECT 'GP da Alemanha 2016', '2016-07-31', 'Hockenheimring'
  UNION ALL SELECT 'GP da Bélgica 2016', '2016-08-28', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP de Itália 2016', '2016-09-04', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP de Singapura 2016', '2016-09-18', 'Marina Bay Street Circuit'
  UNION ALL SELECT 'GP da Malásia 2016', '2016-10-02', 'Sepang International Circuit'
  UNION ALL SELECT 'GP do Japão 2016', '2016-10-09', 'Suzuka Circuit'
  UNION ALL SELECT 'GP dos EUA 2016', '2016-10-23', 'Circuit of the Americas'
  UNION ALL SELECT 'GP do México 2016', '2016-10-30', 'Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP do Brasil 2016', '2016-11-13', 'Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP de Abu Dhabi 2016', '2016-11-27', 'Yas Marina Circuit'
) AS x
JOIN temporada t ON t.ano = 2016
JOIN circuito c ON c.nome = x.nome_circuito
LEFT JOIN corrida r
  ON r.nome = x.nome_corrida AND r.id_temporada = t.id_temporada
WHERE r.id_corrida IS NULL; 


SELECT COUNT(*) AS corridas_2016
FROM corrida c
JOIN temporada t ON c.id_temporada = t.id_temporada
WHERE t.ano = 2016;

SELECT c.id_corrida, c.nome, c.data, ci.nome AS circuito
FROM corrida c
JOIN temporada t ON c.id_temporada = t.id_temporada
JOIN circuito ci ON c.id_circuito = ci.id_circuito
WHERE t.ano = 2016
ORDER BY c.data;
