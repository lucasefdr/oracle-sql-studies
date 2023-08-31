--
-- Oracle SQL Avançado 
--
-- Seção 30 - Globalização Tratamento de Datas e diferentes Time Zones
--
-- Aula 1 - Globalização - Time Zones

-- Globalização - Time Zones

-- Conectar como usuário SYS

-- Consultando Time Zones

SELECT *
FROM   v$timezone_names
WHERE  tzname like '%Sao_Paulo%';

SELECT *
FROM   v$timezone_names
WHERE  tzname like '%Brazil%';

SELECT *
FROM   v$timezone_names
WHERE  tzname like '%New_York%';