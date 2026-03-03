USE campeonato_f1;

INSERT IGNORE INTO temporada (ano) VALUES (2026);

INSERT IGNORE INTO circuito (nome, pais, comprimento_km) VALUES
('Bahrain International Circuit', 'Bahrein', NULL),
('Jeddah Corniche Circuit', 'Arábia Saudita', NULL),
('Albert Park Circuit', 'Austrália', NULL),
('Suzuka Circuit', 'Japão', NULL),
('Shanghai International Circuit', 'China', NULL),
('Miami International Autodrome', 'Estados Unidos', NULL),
('Autodromo Enzo e Dino Ferrari', 'Itália', NULL),
('Circuit de Monaco', 'Mónaco', NULL),
('Circuit de Barcelona-Catalunya', 'Espanha', NULL),
('Circuit Gilles Villeneuve', 'Canadá', NULL),
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
  SELECT 'GP do Bahrein 2026','2026-03-08','Bahrain International Circuit'
  UNION ALL SELECT 'GP da Arábia Saudita 2026','2026-03-15','Jeddah Corniche Circuit'
  UNION ALL SELECT 'GP da Austrália 2026','2026-03-29','Albert Park Circuit'
  UNION ALL SELECT 'GP do Japão 2026','2026-04-12','Suzuka Circuit'
  UNION ALL SELECT 'GP da China 2026','2026-04-19','Shanghai International Circuit'
  UNION ALL SELECT 'GP de Miami 2026','2026-05-03','Miami International Autodrome'
  UNION ALL SELECT 'GP da Emília-Romanha 2026','2026-05-17','Autodromo Enzo e Dino Ferrari'
  UNION ALL SELECT 'GP do Mónaco 2026','2026-05-24','Circuit de Monaco'
  UNION ALL SELECT 'GP de Espanha 2026','2026-06-07','Circuit de Barcelona-Catalunya'
  UNION ALL SELECT 'GP do Canadá 2026','2026-06-14','Circuit Gilles Villeneuve'
  UNION ALL SELECT 'GP da Áustria 2026','2026-06-28','Red Bull Ring'
  UNION ALL SELECT 'GP da Grã-Bretanha 2026','2026-07-05','Silverstone Circuit'
  UNION ALL SELECT 'GP da Bélgica 2026','2026-07-26','Circuit de Spa-Francorchamps'
  UNION ALL SELECT 'GP da Hungria 2026','2026-08-02','Hungaroring'
  UNION ALL SELECT 'GP dos Países Baixos 2026','2026-08-30','Circuit Zandvoort'
  UNION ALL SELECT 'GP de Itália 2026','2026-09-06','Autodromo Nazionale di Monza'
  UNION ALL SELECT 'GP do Azerbaijão 2026','2026-09-20','Baku City Circuit'
  UNION ALL SELECT 'GP de Singapura 2026','2026-10-04','Marina Bay Street Circuit'
  UNION ALL SELECT 'GP dos EUA 2026','2026-10-18','Circuit of the Americas'
  UNION ALL SELECT 'GP do México 2026','2026-10-25','Autodromo Hermanos Rodriguez'
  UNION ALL SELECT 'GP de São Paulo 2026','2026-11-08','Autodromo Jose Carlos Pace'
  UNION ALL SELECT 'GP de Las Vegas 2026','2026-11-21','Las Vegas Strip Circuit'
  UNION ALL SELECT 'GP do Catar 2026','2026-11-29','Lusail International Circuit'
  UNION ALL SELECT 'GP de Abu Dhabi 2026','2026-12-06','Yas Marina Circuit'
) x(nome_corrida,data_corrida,nome_circuito)
JOIN temporada t ON t.ano = 2026
JOIN circuito c ON c.nome = x.nome_circuito;
