-- Funções para o tipo DATE
-- O format default de data é definido pelo DBA
SELECT SYSDATE FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD/MM/YY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL;

-- Quando realizamos operações do com datas, estamos trabalhando com dias
SELECT SYSDATE + 30 FROM DUAL;

-- MONTHS_BETWEEN: retorna o número de meses entre duas datas
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('31-12-1997', 'DD-MM-YYYY'))) NASCIMENTO_ATÉ_HOJE
  FROM DUAL;

-- ADD_MONTHS: adiciona meses em uma data
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;

-- NEXT_DAY: próximo dia em relação ao argunmento passado
SELECT NEXT_DAY(SYSDATE, 'SEXTA-FEIRA') FROM DUAL;

-- LAST_DAY: último dia do mês
SELECT LAST_DAY(SYSDATE) FROM DUAL;
