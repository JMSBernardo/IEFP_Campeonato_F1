USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2023);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Bahrain International Circuit', 'Bahrein', NULL),
('Jeddah Corniche Circuit', 'Arábia Saudita', NULL),
('Albert Park Circuit', 'Austrália', NULL),
('Baku City Circuit', 'Azerbaijão', NULL),
('Miami International Autodrome', 'Estados Unidos', NULL),
('Circuit de Monaco', 'Mónaco', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Circuit Gilles Villeneuve', 'Canadá', NULL),
('Red Bull Ring', 'Áustria', NULL),
('Silverstone Circuit', 'Reino Unido', NULL),
('Hungaroring', 'Hungria', NULL),
('Circuit de Spa-Francorchamps', 'Bélgica', NULL),
('Circuit Zandvoort', 'Países Baixos', NULL),
('Autodromo Nazionale di Monza', 'Itália', NULL),
('Marina Bay Street Circuit', 'Singapura', NULL),
('Suzuka Circuit', 'Japão', NULL),
('Lusail International Circuit', 'Catar', NULL),
('Circuit of the Americas', 'Estados Unidos', NULL),
('Autodromo Hermanos Rodriguez', 'México', NULL),
('Autodromo Jose Carlos Pace', 'Brasil', NULL),
('Las Vegas Strip Circuit', 'Estados Unidos', NULL),
('Yas Marina Circuit', 'Emirados Árabes Unidos', NULL);

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT x.nome_corrida, x.data_corrida, t.id_temporada, c.id_circuito
FROM (
  SELECT 'GP do Bahrein 2023' AS nome_corrida, '2023-03-05' AS data_corrida, 'Bahrain International Circuit' AS nome_circuito
  UNION ALL SELECT 'GP da Arábia Saudita 2023', '2023-03-19', 'Jeddah Corniche Circuit'
  UNION ALL SELECT 'GP da Austrália 2023', '2023-04-02', 'Albert Park Circuit'
  UNION ALL SELECT 'GP do Azerbaijão 2023', '2023-04-30', 'Baku City Circuit'
  UNION ALL SELECT 'GP de Miami 2023', '2023-05-07', 'Miami International Autodrome'
  UNION ALL SELECT 'GP do Mónaco 2023', '2023-05-28', 'Circuit de Monaco'
  UNION ALL SELECT 'GP de Espanha 2023', '2023-06-04', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP do Canadá 2023', '2023-06-18', 'Circuit Gilles Villeneuve'
  UNION ALL SELECT 'GP da Áustria 2023', '2023-07-02', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2023', '2023-07-09', 'Silverstone Circuit'
  UNION ALL SELECT 'GP da Hungria 2023', '2023-07-23', 'Hungaroring'
  UNION ALL SELECT 'GP da Bélgica 2023', '2023-07-30', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP dos Países Baixos 2023', '2023-08-27', 'Circuit Zandvoort'
  UNION ALL SELECT 'GP de Itália 2023', '2023-09-03', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP de Singapura 2023', '2023-09-17', 'Marina Bay Street Circuit'
  UNION ALL SELECT 'GP do Japão 2023', '2023-09-24', 'Suzuka Circuit'
  UNION ALL SELECT 'GP do Catar 2023', '2023-10-08', 'Lusail International Circuit'
  UNION ALL SELECT 'GP dos EUA 2023', '2023-10-22', 'Circuit of the Americas'
  UNION ALL SELECT 'GP do México 2023', '2023-10-29', 'Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP de São Paulo 2023', '2023-11-05', 'Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP de Las Vegas 2023', '2023-11-18', 'Las Vegas Strip Circuit'
  UNION ALL SELECT 'GP de Abu Dhabi 2023', '2023-11-26', 'Yas Marina Circuit'
) AS x
JOIN temporada t ON t.ano = 2023
JOIN circuito c ON c.nome = x.nome_circuito;
