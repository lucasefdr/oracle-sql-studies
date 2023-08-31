-- SINGLE-ROW FUNCTIONS
-- Funções de manipulação de characteres
SELECT UPPER('SQL Especialista') FROM DUAL;
SELECT LOWER('SQL Especialista') FROM DUAL;
SELECT INITCAP('SQL Especialista') FROM DUAL;
SELECT CONCAT('SQL Especialista ', 2022) FROM DUAL;
SELECT SUBSTR('SQL Especialista', 1, 3) FROM DUAL;
SELECT LENGTH('SQL Especialista') FROM DUAL;
SELECT INSTR('SQL Especialista', 'Especialista') FROM DUAL;
SELECT LPAD('SQL Especialista', 20, '*') FROM DUAL;
SELECT RPAD('SQL Especialista', 20, '*') FROM DUAL;
SELECT REPLACE('SQL Especialista', 'SQL', 'PL/SQL') FROM DUAL;
SELECT TRIM(';' FROM 'nome@email.com;') FROM DUAL;
SELECT LTRIM('  nome@email.com', ' ') FROM DUAL;
SELECT RTRIM('nome@email.com;', ';') FROM DUAL;

-- Funções numéricas
SELECT ROUND(133.216, 2) FROM DUAL;
SELECT TRUNC(133.216, 2) FROM DUAL;
SELECT MOD(133, 2) FROM DUAL;
SELECT ABS(-333) FROM DUAL;
SELECT SQRT(49) FROM DUAL;
