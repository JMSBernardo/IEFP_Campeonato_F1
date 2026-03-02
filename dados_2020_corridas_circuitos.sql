USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2020);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Red Bull Ring', 'Áustria', NULL),
('Hungaroring', 'Hungria', NULL),
('Silverstone Circuit', 'Reino Unido', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Circuit de Spa-Francorchamps', 'Bélgica', NULL),
('Autodromo Nazionale di Monza', 'Itália', NULL),
('Mugello Circuit', 'Itália', NULL),
('Sochi Autodrom', 'Rússia', NULL),
('Nürburgring', 'Alemanha', NULL),
('Algarve International Circuit', 'Portugal', NULL),
('Imola Circuit', 'Itália', NULL),
('Istanbul Park', 'Turquia', NULL),
('Bahrain International Circuit', 'Bahrein', NULL),
('Yas Marina Circuit', 'Emirados Árabes Unidos', NULL);

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT x.nome_corrida, x.data_corrida, t.id_temporada, c.id_circuito
FROM (
  SELECT 'GP da Áustria 2020' AS nome_corrida, '2020-07-05' AS data_corrida, 'Red Bull Ring' AS nome_circuito
  UNION ALL SELECT 'GP da Estíria 2020', '2020-07-12', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Hungria 2020', '2020-07-19', 'Hungaroring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2020', '2020-08-02', 'Silverstone Circuit'
  UNION ALL SELECT 'GP do 70º Aniversário 2020', '2020-08-09', 'Silverstone Circuit'
  UNION ALL SELECT 'GP de Espanha 2020', '2020-08-16', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP da Bélgica 2020', '2020-08-30', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP de Itália 2020', '2020-09-06', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP da Toscânia 2020', '2020-09-13', 'Mugello Circuit'
  UNION ALL SELECT 'GP da Rússia 2020', '2020-09-27', 'Sochi Autodrom'
  UNION ALL SELECT 'GP de Eifel 2020', '2020-10-11', 'Nürburgring'
  UNION ALL SELECT 'GP de Portugal 2020', '2020-10-25', 'Algarve International Circuit'
  UNION ALL SELECT 'GP da Emília-Romanha 2020', '2020-11-01', 'Imola Circuit'
  UNION ALL SELECT 'GP da Turquia 2020', '2020-11-15', 'Istanbul Park'
  UNION ALL SELECT 'GP do Bahrein 2020', '2020-11-29', 'Bahrain International Circuit'
  UNION ALL SELECT 'GP de Sakhir 2020', '2020-12-06', 'Bahrain International Circuit'
  UNION ALL SELECT 'GP de Abu Dhabi 2020', '2020-12-13', 'Yas Marina Circuit'
) AS x
JOIN temporada t ON t.ano = 2020
JOIN circuito c ON c.nome = x.nome_circuito;
