USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2018);

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
('Circuit of the Americas', 'Estados Unidos', NULL),
('Autodromo Hermanos Rodriguez', 'México', NULL),
('Autodromo Jose Carlos Pace', 'Brasil', NULL),
('Yas Marina Circuit', 'Emirados Árabes Unidos', NULL);

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT x.nome_corrida, x.data_corrida, t.id_temporada, c.id_circuito
FROM (
  SELECT 'GP da Austrália 2018' AS nome_corrida, '2018-03-25' AS data_corrida, 'Albert Park Circuit' AS nome_circuito
  UNION ALL SELECT 'GP do Bahrein 2018', '2018-04-08', 'Bahrain International Circuit'
  UNION ALL SELECT 'GP da China 2018', '2018-04-15', 'Shanghai International Circuit'
  UNION ALL SELECT 'GP do Azerbaijão 2018', '2018-04-29', 'Baku City Circuit'
  UNION ALL SELECT 'GP de Espanha 2018', '2018-05-13', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP do Mónaco 2018', '2018-05-27', 'Circuit de Monaco'
  UNION ALL SELECT 'GP do Canadá 2018', '2018-06-10', 'Circuit Gilles Villeneuve'
  UNION ALL SELECT 'GP de França 2018', '2018-06-24', 'Circuit Paul Ricard'
  UNION ALL SELECT 'GP da Áustria 2018', '2018-07-01', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2018', '2018-07-08', 'Silverstone Circuit'
  UNION ALL SELECT 'GP da Alemanha 2018', '2018-07-22', 'Hockenheimring'
  UNION ALL SELECT 'GP da Hungria 2018', '2018-07-29', 'Hungaroring'
  UNION ALL SELECT 'GP da Bélgica 2018', '2018-08-26', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP de Itália 2018', '2018-09-02', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP de Singapura 2018', '2018-09-16', 'Marina Bay Street Circuit'
  UNION ALL SELECT 'GP da Rússia 2018', '2018-09-30', 'Sochi Autodrom'
  UNION ALL SELECT 'GP do Japão 2018', '2018-10-07', 'Suzuka Circuit'
  UNION ALL SELECT 'GP dos EUA 2018', '2018-10-21', 'Circuit of the Americas'
  UNION ALL SELECT 'GP do México 2018', '2018-10-28', 'Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP do Brasil 2018', '2018-11-11', 'Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP de Abu Dhabi 2018', '2018-11-25', 'Yas Marina Circuit'
) AS x
JOIN temporada t ON t.ano = 2018
JOIN circuito c ON c.nome = x.nome_circuito
LEFT JOIN corrida r
  ON r.nome = x.nome_corrida AND r.id_temporada = t.id_temporada
WHERE r.id_corrida IS NULL;
