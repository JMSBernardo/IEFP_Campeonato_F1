USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2024);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Bahrain International Circuit', 'Bahrein', NULL),
('Jeddah Corniche Circuit', 'Arábia Saudita', NULL),
('Albert Park Circuit', 'Austrália', NULL),
('Suzuka Circuit', 'Japão', NULL),
('Shanghai International Circuit', 'China', NULL),
('Miami International Autodrome', 'Estados Unidos', NULL),
('Autodromo Enzo e Dino Ferrari', 'Itália', NULL),
('Circuit de Monaco', 'Mónaco', NULL),
('Circuit Gilles Villeneuve', 'Canadá', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Red Bull Ring', 'Áustria', NULL),
('Silverstone Circuit', 'Reino Unido', NULL),
('Hungaroring', 'Hungria', NULL),
('Circuit de Spa-Francorchamps', 'Bélgica', NULL),
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
  SELECT 'GP do Bahrein 2024' AS nome_corrida, '2024-03-02' AS data_corrida, 'Bahrain International Circuit' AS nome_circuito
  UNION ALL SELECT 'GP da Arábia Saudita 2024', '2024-03-09', 'Jeddah Corniche Circuit'
  UNION ALL SELECT 'GP da Austrália 2024', '2024-03-24', 'Albert Park Circuit'
  UNION ALL SELECT 'GP do Japão 2024', '2024-04-07', 'Suzuka Circuit'
  UNION ALL SELECT 'GP da China 2024', '2024-04-21', 'Shanghai International Circuit'
  UNION ALL SELECT 'GP de Miami 2024', '2024-05-05', 'Miami International Autodrome'
  UNION ALL SELECT 'GP da Emília-Romanha 2024', '2024-05-19', 'Autodromo Enzo e Dino Ferrari'
  UNION ALL SELECT 'GP do Mónaco 2024', '2024-05-26', 'Circuit de Monaco'
  UNION ALL SELECT 'GP do Canadá 2024', '2024-06-09', 'Circuit Gilles Villeneuve'
  UNION ALL SELECT 'GP de Espanha 2024', '2024-06-23', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP da Áustria 2024', '2024-06-30', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2024', '2024-07-07', 'Silverstone Circuit'
  UNION ALL SELECT 'GP da Hungria 2024', '2024-07-21', 'Hungaroring'
  UNION ALL SELECT 'GP da Bélgica 2024', '2024-07-28', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP dos Países Baixos 2024', '2024-08-25', 'Circuit Zandvoort'
  UNION ALL SELECT 'GP de Itália 2024', '2024-09-01', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP do Azerbaijão 2024', '2024-09-15', 'Baku City Circuit'
  UNION ALL SELECT 'GP de Singapura 2024', '2024-09-22', 'Marina Bay Street Circuit'
  UNION ALL SELECT 'GP dos EUA 2024', '2024-10-20', 'Circuit of the Americas'
  UNION ALL SELECT 'GP do México 2024', '2024-10-27', 'Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP de São Paulo 2024', '2024-11-03', 'Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP de Las Vegas 2024', '2024-11-23', 'Las Vegas Strip Circuit'
  UNION ALL SELECT 'GP do Catar 2024', '2024-12-01', 'Lusail International Circuit'
  UNION ALL SELECT 'GP de Abu Dhabi 2024', '2024-12-08', 'Yas Marina Circuit'
) AS x
JOIN temporada t ON t.ano = 2024
JOIN circuito c ON c.nome = x.nome_circuito;
