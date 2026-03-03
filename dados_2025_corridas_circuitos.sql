USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2025);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Albert Park Circuit', 'Austrália', NULL),
('Shanghai International Circuit', 'China', NULL),
('Suzuka Circuit', 'Japão', NULL),
('Bahrain International Circuit', 'Bahrein', NULL),
('Jeddah Corniche Circuit', 'Arábia Saudita', NULL),
('Miami International Autodrome', 'Estados Unidos', NULL),
('Autodromo Enzo e Dino Ferrari', 'Itália', NULL),
('Circuit de Monaco', 'Mónaco', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Circuit Gilles Villeneuve', 'Canadá', NULL),
('Red Bull Ring', 'Áustria', NULL),
('Silverstone Circuit', 'Reino Unido', NULL),
('Circuit de Spa-Francorchamps', 'Bélgica', NULL),
('Hungaroring', 'Hungria', NULL),
('Circuit Zandvoort', 'Países Baixos', NULL),
('Autodromo Nazionale di Monza', 'Itália', NULL),
('Baku City Circuit', 'Azerbaijão', NULL),
('Marina Bay Street Circuit', 'Singapura', NULL),
('Circuit of the Americas', 'Estados Unidos', NULL),
('Autodromo Hermanos Rodriguez', 'México', NULL),
('Autodromo Jose Carlos Pace', 'Brasil', NULL),
('Las Vegas Strip Circuit', 'Estados Unidos', NULL),
('Lusail International Circuit', 'Catar', NULL),
('Yas Marina Circuit', 'Emirados Árabes Unidos', NULL);

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT x.nome_corrida, x.data_corrida, t.id_temporada, c.id_circuito
FROM (
  SELECT 'GP da Austrália 2025' AS nome_corrida, '2025-03-16' AS data_corrida, 'Albert Park Circuit' AS nome_circuito
  UNION ALL SELECT 'GP da China 2025', '2025-03-23', 'Shanghai International Circuit'
  UNION ALL SELECT 'GP do Japão 2025', '2025-04-06', 'Suzuka Circuit'
  UNION ALL SELECT 'GP do Bahrein 2025', '2025-04-13', 'Bahrain International Circuit'
  UNION ALL SELECT 'GP da Arábia Saudita 2025', '2025-04-20', 'Jeddah Corniche Circuit'
  UNION ALL SELECT 'GP de Miami 2025', '2025-05-04', 'Miami International Autodrome'
  UNION ALL SELECT 'GP da Emília-Romanha 2025', '2025-05-18', 'Autodromo Enzo e Dino Ferrari'
  UNION ALL SELECT 'GP do Mónaco 2025', '2025-05-25', 'Circuit de Monaco'
  UNION ALL SELECT 'GP de Espanha 2025', '2025-06-01', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP do Canadá 2025', '2025-06-15', 'Circuit Gilles Villeneuve'
  UNION ALL SELECT 'GP da Áustria 2025', '2025-06-29', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2025', '2025-07-06', 'Silverstone Circuit'
  UNION ALL SELECT 'GP da Bélgica 2025', '2025-07-27', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP da Hungria 2025', '2025-08-03', 'Hungaroring'
  UNION ALL SELECT 'GP dos Países Baixos 2025', '2025-08-31', 'Circuit Zandvoort'
  UNION ALL SELECT 'GP de Itália 2025', '2025-09-07', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP do Azerbaijão 2025', '2025-09-21', 'Baku City Circuit'
  UNION ALL SELECT 'GP de Singapura 2025', '2025-10-05', 'Marina Bay Street Circuit'
  UNION ALL SELECT 'GP dos EUA 2025', '2025-10-19', 'Circuit of the Americas'
  UNION ALL SELECT 'GP do México 2025', '2025-10-26', 'Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP de São Paulo 2025', '2025-11-09', 'Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP de Las Vegas 2025', '2025-11-22', 'Las Vegas Strip Circuit'
  UNION ALL SELECT 'GP do Catar 2025', '2025-11-30', 'Lusail International Circuit'
  UNION ALL SELECT 'GP de Abu Dhabi 2025', '2025-12-07', 'Yas Marina Circuit'
) AS x
JOIN temporada t ON t.ano = 2025
JOIN circuito c ON c.nome = x.nome_circuito;
