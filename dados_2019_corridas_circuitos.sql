USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2019);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Albert Park Circuit', 'Austrália', NULL),
('Bahrain International Circuit', 'Bahrein', NULL),
('Shanghai International Circuit', 'China', NULL),
('Baku City Circuit', 'Azerbaijão', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Circuit de Monaco', 'Mónaco', NULL),
('Circuit Gilles Villeneuve', 'Canadá', NULL),
('Circuit Paul Ricard', 'França', NULL),
('Red Bull Ring', 'Áustria', NULL),
('Silverstone Circuit', 'Reino Unido', NULL),
('Hockenheimring', 'Alemanha', NULL),
('Hungaroring', 'Hungria', NULL),
('Circuit de Spa-Francorchamps', 'Bélgica', NULL),
('Autodromo Nazionale di Monza', 'Itália', NULL),
('Marina Bay Street Circuit', 'Singapura', NULL),
('Sochi Autodrom', 'Rússia', NULL),
('Suzuka Circuit', 'Japão', NULL),
('Autodromo Hermanos Rodriguez', 'México', NULL),
('Circuit of the Americas', 'Estados Unidos', NULL),
('Autodromo Jose Carlos Pace', 'Brasil', NULL),
('Yas Marina Circuit', 'Emirados Árabes Unidos', NULL);

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT x.nome_corrida, x.data_corrida, t.id_temporada, c.id_circuito
FROM (
  SELECT 'GP da Austrália 2019' AS nome_corrida, '2019-03-17' AS data_corrida, 'Albert Park Circuit' AS nome_circuito
  UNION ALL SELECT 'GP do Bahrein 2019', '2019-03-31', 'Bahrain International Circuit'
  UNION ALL SELECT 'GP da China 2019', '2019-04-14', 'Shanghai International Circuit'
  UNION ALL SELECT 'GP do Azerbaijão 2019', '2019-04-28', 'Baku City Circuit'
  UNION ALL SELECT 'GP de Espanha 2019', '2019-05-12', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP do Mónaco 2019', '2019-05-26', 'Circuit de Monaco'
  UNION ALL SELECT 'GP do Canadá 2019', '2019-06-09', 'Circuit Gilles Villeneuve'
  UNION ALL SELECT 'GP de França 2019', '2019-06-23', 'Circuit Paul Ricard'
  UNION ALL SELECT 'GP da Áustria 2019', '2019-06-30', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2019', '2019-07-14', 'Silverstone Circuit'
  UNION ALL SELECT 'GP da Alemanha 2019', '2019-07-28', 'Hockenheimring'
  UNION ALL SELECT 'GP da Hungria 2019', '2019-08-04', 'Hungaroring'
  UNION ALL SELECT 'GP da Bélgica 2019', '2019-09-01', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP de Itália 2019', '2019-09-08', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP de Singapura 2019', '2019-09-22', 'Marina Bay Street Circuit'
  UNION ALL SELECT 'GP da Rússia 2019', '2019-09-29', 'Sochi Autodrom'
  UNION ALL SELECT 'GP do Japão 2019', '2019-10-13', 'Suzuka Circuit'
  UNION ALL SELECT 'GP do México 2019', '2019-10-27', 'Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP dos EUA 2019', '2019-11-03', 'Circuit of the Americas'
  UNION ALL SELECT 'GP do Brasil 2019', '2019-11-17', 'Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP de Abu Dhabi 2019', '2019-12-01', 'Yas Marina Circuit'
) AS x
JOIN temporada t ON t.ano = 2019
JOIN circuito c ON c.nome = x.nome_circuito;
