USE campeonato_f1;

INSERT INTO temporada (ano)
WITH RECURSIVE anos AS (
    SELECT 2016 AS ano
    UNION ALL
    SELECT ano + 1 FROM anos WHERE ano < 2026
)
SELECT ano FROM anos;
