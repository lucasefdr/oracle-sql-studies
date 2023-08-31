-- Seção 30 - Globalização Tratamento de Datas e diferentes Time Zones
--
-- Aula 4 - Funções de Conversão utilizadas com Interval

-- Funções de Conversão utilizadas com Interval

-- Conectar como usuário HR

-- Somando dias a uma data - (no exemplo soma 30 dias a SYSDATE)

SELECT sysdate, sysdate + 30 
FROM dual;

-- Somando horas a uma data - (no exemplo soma 3 horas a SYSDATE)

SELECT TO_CHAR(sysdate,'DD/MM/YYYY HH24:MI:SS'), TO_CHAR(sysdate + 3/24,'DD/MM/YYYY HH24:MI:SS')
FROM dual;

-- Somando minutos a uma data - (no exemplo soma 10 minutos a SYSDATE)

SELECT TO_CHAR(sysdate,'DD/MM/YYYY HH24:MI:SS'), TO_CHAR(sysdate + 10/24/60,'DD/MM/YYYY HH24:MI:SS')
FROM dual;

-- Somando segundos a uma data - (no exemplo soma 10 segundos a SYSDATE)

SELECT TO_CHAR(sysdate,'DD/MM/YYYY HH24:MI:SS'), TO_CHAR(sysdate + 10/24/60/60,'DD/MM/YYYY HH24:MI:SS')
FROM dual;

-- Utilizando a Função TO_YMINTERVAL

-- Adicionar 1 ano e 6 meses a data atual

SELECT sysdate, sysdate + TO_YMINTERVAL('01-06')
FROM dual;

-- Utilizando a Função TO_DSINTERVAL

-- Adicionar 6 dias e 2 horas a data atual

SELECT TO_CHAR(sysdate,'DD/MM/YYYY HH24:MI:SS'), TO_CHAR(sysdate + TO_DSINTERVAL('6 02:00:00'),'DD/MM/YYYY HH24:MI:SS')
FROM dual;