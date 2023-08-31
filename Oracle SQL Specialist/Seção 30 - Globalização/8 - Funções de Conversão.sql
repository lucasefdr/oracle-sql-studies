--
-- Oracle SQL Avançado 
--
-- Oracle SQL Avançado 
--
-- Seção 30 - Globalização Tratamento de Datas e diferentes Time Zones
--
-- Aula 7 - Funções de Conversão

-- Funções de Conversão

-- Conectar como usuário HR

-- FROM_TZ

SELECT LOCALTIMESTAMP, 
       FROM_TZ(LOCALTIMESTAMP,'America/Sao_Paulo'), 
       FROM_TZ(LOCALTIMESTAMP,'Asia/Dubai'), 
       FROM_TZ(LOCALTIMESTAMP,'America/Chicago')
FROM dual;

SELECT FROM_TZ(TIMESTAMP '2021-08-08 11:00:00', '-03:00'),
       FROM_TZ(TIMESTAMP '2021-08-08 11:00:00', '-05:00'),
       FROM_TZ(TIMESTAMP '2021-08-08 11:00:00', '-07:00')
FROM DUAL;
  
SELECT FROM_TZ(localtimestamp, '-03:00'),
       FROM_TZ(localtimestamp, '-05:00'),
       FROM_TZ(localtimestamp, '-07:00')
FROM DUAL;
  
-- TO_TIMESTAMP

SELECT TO_TIMESTAMP ('2006-01-18 08:15:32.1234',
                     'YYYY-MM-DD HH24:MI:SS.FF') NOVO_TIMESTAMP
FROM dual;

-- TO_TIMESTAMP_TZ

SELECT TO_TIMESTAMP_TZ ('2006-01-18 08:15:32.1234 -5:00',
                        'YYYY-MM-DD HH24:MI:SS.FF TZH:TZM') NOVO_TIMESTAMP_WITH_TIMEZONE
FROM dual;

SELECT TO_TIMESTAMP_TZ ('2006-01-18 08:15:32.1234 America/Sao_Paulo',
                        'YYYY-MM-DD HH24:MI:SS.FF TZR') NOVO_TIMESTAMP_WITH_TIMEZONE
FROM dual;