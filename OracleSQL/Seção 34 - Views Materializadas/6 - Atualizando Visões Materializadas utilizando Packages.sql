--
-- Oracle SQL Avançado 
--
-- Seção 34 - Visões Materializadas
--
-- Aula 7 - Atualizando Visões Materializadas utilizando Packages

-- Atualizando Visões Materializadas utilizando Packages

-- Conectar como usuário SYS

-- Passando system privilégios necessário para executar componentes da package DBMS_MVIEW

GRANT EXECUTE ON DBMS_MVIEW to hr;

-- Passando system privilégios necessário para executar componentes da package DBMS_SNAPSHOT

GRANT EXECUTE ON DBMS_SNAPSHOT to hr;

-- Conectar como usuário HR

-- Removendo Materialized View Log

DROP MATERIALIZED VIEW LOG ON employees;

-- Criando Materialized View Log

CREATE MATERIALIZED VIEW LOG ON employees;

DROP MATERIALIZED VIEW mv_it_programmers;

-- Criando uma Force Refresh Materialized View

CREATE MATERIALIZED VIEW mv_it_programmers
BUILD IMMEDIATE 
REFRESH FORCE 
ENABLE QUERY REWRITE 
AS
  SELECT *
  FROM employees
  WHERE job_id = 'IT_PROG'
  ORDER BY department_id; 

-- Atualizando Visões Materializadas Manualmente Utilizando a Package DBMS_MVIEW.REFRESH

-- Consultando a Materialized View

SELECT *
FROM   mv_it_programmers;

-- Consultando a Tabela employees

SELECT *
FROM employees;

-- Executando DML sobre a Tabela base da Materialized View 

DELETE FROM employees
WHERE  employee_id IN (504, 505, 506);

COMMIT;

INSERT INTO employees
VALUES (504, 'Richard', 'Wright', 'RWRIGHT', '44444444', sysdate, 'IT_PROG',25000,null,103,60);

COMMIT;  



-- Consultando a Tabela employees

SELECT *
FROM employees
WHERE employee_id = 504;

-- Consultando a Materialized View  que estara desatualizada

SELECT *
FROM   mv_it_programmers;

-- -- Atualizando Visões utilizando a package DBMS_MVIEW

EXECUTE DBMS_MVIEW.REFRESH('mv_it_programmers', 'F')

-- Consultando a Materialized View

SELECT *
FROM   mv_it_programmers;

-- Atualizando Visões Materializadas utilizando a package DBMS_SNAPSHOT

-- Executando DML sobre a Tabela base da Materialized View 

INSERT INTO employees
VALUES (505, 'Billie', 'Holiday', 'BHOLIDAY', '55555555', sysdate, 'IT_PROG', 30000, null, 103, 60);

COMMIT;  

-- Consultando a Tabela employees

SELECT *
FROM employees
WHERE employee_id IN (504,505);

-- Consultando a Materialized View que estara desatualizada

SELECT *
FROM   mv_it_programmers;

-- Executando a procedure DBMS_SNAPSHOT.REFRESH

EXECUTE DBMS_SNAPSHOT.REFRESH('mv_it_programmers', 'C')

-- Consultando a Materialized View

SELECT *
FROM   mv_it_programmers;

-- Atualizando Visões Materializadas Manualmente Utilizando a procedure DBMS_MVIEW.REFRESH_ALL_MVIEWS

-- Consultando a Tabela employees

SELECT *
FROM employees;

-- Consultando a Materialized View

SELECT *
FROM   mv_it_programmers;

-- Executando DML sobre a Tabela base da Materialized View 

INSERT INTO employees
VALUES (506, 'Eddie', 'Vedder', 'EVEDDER', '77777777', sysdate, 'IT_PROG',35000,null,103,60);

COMMIT; 

-- Consultando a Tabela employees

SELECT *
FROM employees
WHERE employee_id IN (504, 505,506);

-- Consultando a Materialized View

SELECT *
FROM   mv_it_programmers;

-- Conectar como usuário SYS

GRANT EXECUTE ON DBMS_MVIEW to hr;

GRANT ALTER ANY MATERIALIZED VIEW to hr;

--- Executando a procedure DBMS_MVIEW.REFRESH_ALL_MVIEWS

DECLARE
  vfailures  NUMBER;
BEGIN        
  DBMS_MVIEW.REFRESH_ALL_MVIEWS(vfailures, 'C','', TRUE, FALSE, FALSE);
END;

-- Consultando a Materialized View

SELECT *
FROM   mv_it_programmers;