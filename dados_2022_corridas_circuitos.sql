USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2022);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Bahrain International Circuit', 'Bahrein', NULL),
('King Abdulaziz Street Circuit', 'Arábia Saudita', NULL),
('Albert Park Circuit', 'Austrália', NULL),
('Autodromo Enzo e Dino Ferrari', 'Itália', NULL),
('Miami International Autodrome', 'Estados Unidos', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Circuit de Monaco', 'Mónaco', NULL),
('Baku City Circuit', 'Azerbaijão', NULL),
('Circuit Gilles Villeneuve', 'Canadá', NULL),
('Silverstone Circuit', 'Reino Unido', NULL),
('Red Bull Ring', 'Áustria', NULL),
('Circuit Paul Ricard', 'França', NULL),
('Hungaroring', 'Hungria', NULL),
('Circuit de Spa-Francorchamps', 'Bélgica', NULL),
('Circuit Zandvoort', 'Países Baixos', NULL),
('Autodromo Nazionale di Monza', 'Itália', NULL),
('Marina Bay Street Circuit', 'Singapura', NULL),
('Suzuka Circuit', 'Japão', NULL),
('Circuit of the Americas', 'Estados Unidos', NULL),
('Autodromo Hermanos Rodriguez', 'México', NULL),
('Autodromo Jose Carlos Pace', 'Brasil', NULL),
('Yas Marina Circuit', 'Emirados Árabes Unidos', NULL);

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT x.nome_corrida, x.data_corrida, t.id_temporada, c.id_circuito
FROM (
  SELECT 'GP do Bahrein 2022' AS nome_corrida, '2022-03-20' AS data_corrida, 'Bahrain International Circuit' AS nome_circuito
  UNION ALL SELECT 'GP da Arábia Saudita 2022', '2022-03-27', 'King Abdulaziz Street Circuit'
  UNION ALL SELECT 'GP da Austrália 2022', '2022-04-10', 'Albert Park Circuit'
  UNION ALL SELECT 'GP da Emília-Romanha 2022', '2022-04-24', 'Autodromo Enzo e Dino Ferrari'
  UNION ALL SELECT 'GP de Miami 2022', '2022-05-08', 'Miami International Autodrome'
  UNION ALL SELECT 'GP de Espanha 2022', '2022-05-22', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP do Mónaco 2022', '2022-05-29', 'Circuit de Monaco'
  UNION ALL SELECT 'GP do Azerbaijão 2022', '2022-06-12', 'Baku City Circuit'
  UNION ALL SELECT 'GP do Canadá 2022', '2022-06-19', 'Circuit Gilles Villeneuve'
  UNION ALL SELECT 'GP da Grã-Bretanha 2022', '2022-07-03', 'Silverstone Circuit'
  UNION ALL SELECT 'GP da Áustria 2022', '2022-07-10', 'Red Bull Ring'
  UNION ALL SELECT 'GP de França 2022', '2022-07-24', 'Circuit Paul Ricard'
  UNION ALL SELECT 'GP da Hungria 2022', '2022-07-31', 'Hungaroring'
  UNION ALL SELECT 'GP da Bélgica 2022', '2022-08-28', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP dos Países Baixos 2022', '2022-09-04', 'Circuit Zandvoort'
  UNION ALL SELECT 'GP de Itália 2022', '2022-09-11', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP de Singapura 2022', '2022-10-02', 'Marina Bay Street Circuit'
  UNION ALL SELECT 'GP do Japão 2022', '2022-10-09', 'Suzuka Circuit'
  UNION ALL SELECT 'GP dos EUA 2022', '2022-10-23', 'Circuit of the Americas'
  UNION ALL SELECT 'GP do México 2022', '2022-10-30', 'Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP do Brasil 2022', '2022-11-13', 'Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP de Abu Dhabi 2022', '2022-11-20', 'Yas Marina Circuit'
) AS x
JOIN temporada t ON t.ano = 2022
JOIN circuito c ON c.nome = x.nome_circuito;
