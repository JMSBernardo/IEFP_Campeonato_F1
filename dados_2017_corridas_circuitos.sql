USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2017);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Albert Park Circuit', 'Austrália', NULL),
('Shanghai International Circuit', 'China', NULL),
('Bahrain International Circuit', 'Bahrein', NULL),
('Sochi Autodrom', 'Rússia', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Circuit de Monaco', 'Mónaco', NULL),
('Circuit Gilles Villeneuve', 'Canadá', NULL),
('Baku City Circuit', 'Azerbaijão', NULL),
('Red Bull Ring', 'Áustria', NULL),
('Silverstone Circuit', 'Reino Unido', NULL),
('Hungaroring', 'Hungria', NULL),
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
  SELECT 'GP da Austrália 2017' AS nome_corrida, '2017-03-26' AS data_corrida, 'Albert Park Circuit' AS nome_circuito
  UNION ALL SELECT 'GP da China 2017',        '2017-04-09', 'Shanghai International Circuit'
  UNION ALL SELECT 'GP do Bahrein 2017',      '2017-04-16', 'Bahrain International Circuit'
  UNION ALL SELECT 'GP da Rússia 2017',       '2017-04-30', 'Sochi Autodrom'
  UNION ALL SELECT 'GP de Espanha 2017',      '2017-05-14', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP do Mónaco 2017',       '2017-05-28', 'Circuit de Monaco'
  UNION ALL SELECT 'GP do Canadá 2017',       '2017-06-11', 'Circuit Gilles Villeneuve'
  UNION ALL SELECT 'GP do Azerbaijão 2017',   '2017-06-25', 'Baku City Circuit'
  UNION ALL SELECT 'GP da Áustria 2017',      '2017-07-09', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2017', '2017-07-16', 'Silverstone Circuit'
  UNION ALL SELECT 'GP da Hungria 2017',      '2017-07-30', 'Hungaroring'
  UNION ALL SELECT 'GP da Bélgica 2017',      '2017-08-27', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP de Itália 2017',       '2017-09-03', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP de Singapura 2017',    '2017-09-17', 'Marina Bay Street Circuit'
  UNION ALL SELECT 'GP da Malásia 2017',      '2017-10-01', 'Sepang International Circuit'
  UNION ALL SELECT 'GP do Japão 2017',        '2017-10-08', 'Suzuka Circuit'
  UNION ALL SELECT 'GP dos EUA 2017',         '2017-10-22', 'Circuit of the Americas'
  UNION ALL SELECT 'GP do México 2017',       '2017-10-29', 'Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP do Brasil 2017',       '2017-11-12', 'Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP de Abu Dhabi 2017',    '2017-11-26', 'Yas Marina Circuit'
) AS x
JOIN temporada t ON t.ano = 2017
JOIN circuito c ON c.nome = x.nome_circuito
LEFT JOIN corrida r
  ON r.nome = x.nome_corrida AND r.id_temporada = t.id_temporada
WHERE r.id_corrida IS NULL;
