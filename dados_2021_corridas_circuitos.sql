USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2021);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Bahrain International Circuit', 'Bahrein', NULL),
('Autodromo Enzo e Dino Ferrari', 'Itália', NULL),
('Autodromo Internacional do Algarve', 'Portugal', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Circuit de Monaco', 'Mónaco', NULL),
('Baku City Circuit', 'Azerbaijão', NULL),
('Circuit Paul Ricard', 'França', NULL),
('Red Bull Ring', 'Áustria', NULL),
('Silverstone Circuit', 'Reino Unido', NULL),
('Hungaroring', 'Hungria', NULL),
('Circuit de Spa-Francorchamps', 'Bélgica', NULL),
('Circuit Zandvoort', 'Países Baixos', NULL),
('Autodromo Nazionale di Monza', 'Itália', NULL),
('Sochi Autodrom', 'Rússia', NULL),
('Istanbul Park', 'Turquia', NULL),
('Circuit of the Americas', 'Estados Unidos', NULL),
('Autodromo Hermanos Rodriguez', 'México', NULL),
('Autodromo Jose Carlos Pace', 'Brasil', NULL),
('Losail International Circuit', 'Catar', NULL),
('King Abdulaziz Street Circuit', 'Arábia Saudita', NULL),
('Yas Marina Circuit', 'Emirados Árabes Unidos', NULL);

INSERT IGNORE INTO corrida (nome, data, id_temporada, id_circuito)
SELECT x.nome_corrida, x.data_corrida, t.id_temporada, c.id_circuito
FROM (
  SELECT 'GP do Bahrein 2021', '2021-03-28', 'Bahrain International Circuit'
  UNION ALL SELECT 'GP da Emília-Romanha 2021', '2021-04-18', 'Autodromo Enzo e Dino Ferrari'
  UNION ALL SELECT 'GP de Portugal 2021', '2021-05-02', 'Autodromo Internacional do Algarve'
  UNION ALL SELECT 'GP de Espanha 2021', '2021-05-09', 'Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP do Mónaco 2021', '2021-05-23', 'Circuit de Monaco'
  UNION ALL SELECT 'GP do Azerbaijão 2021', '2021-06-06', 'Baku City Circuit'
  UNION ALL SELECT 'GP de França 2021', '2021-06-20', 'Circuit Paul Ricard'
  UNION ALL SELECT 'GP da Estíria 2021', '2021-06-27', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Áustria 2021', '2021-07-04', 'Red Bull Ring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2021', '2021-07-18', 'Silverstone Circuit'
  UNION ALL SELECT 'GP da Hungria 2021', '2021-08-01', 'Hungaroring'
  UNION ALL SELECT 'GP da Bélgica 2021', '2021-08-29', 'Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP dos Países Baixos 2021', '2021-09-05', 'Circuit Zandvoort'
  UNION ALL SELECT 'GP de Itália 2021', '2021-09-12', 'Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP da Rússia 2021', '2021-09-26', 'Sochi Autodrom'
  UNION ALL SELECT 'GP da Turquia 2021', '2021-10-10', 'Istanbul Park'
  UNION ALL SELECT 'GP dos EUA 2021', '2021-10-24', 'Circuit of the Americas'
  UNION ALL SELECT 'GP do México 2021', '2021-11-07', 'Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP do Brasil 2021', '2021-11-14', 'Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP do Catar 2021', '2021-11-21', 'Losail International Circuit'
  UNION ALL SELECT 'GP da Arábia Saudita 2021', '2021-12-05', 'King Abdulaziz Street Circuit'
  UNION ALL SELECT 'GP de Abu Dhabi 2021', '2021-12-12', 'Yas Marina Circuit'
) AS x(nome_corrida, data_corrida, nome_circuito)
JOIN temporada t ON t.ano = 2021
JOIN circuito c ON c.nome = x.nome_circuito;
