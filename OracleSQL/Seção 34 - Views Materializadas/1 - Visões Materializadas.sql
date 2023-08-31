--
-- Oracle SQL Avançado 
--
-- Seção 34 - Visões Materializadas
--
-- Aula 1 - Visões Materializadas

-- Conectar como usuário SYS

-- Passando system privilege necessário para criar uma Materialized View 

GRANT CREATE MATERIALIZED VIEW to hr;

-- Conectar como usuário HR

-- Removendo uma Materialized View 

DROP MATERIALIZED VIEW mv_department_max_salaries;

-- Criando uma Materialized View  

CREATE MATERIALIZED VIEW mv_department_max_salaries
BUILD IMMEDIATE 
REFRESH COMPLETE 
ON DEMAND
ENABLE QUERY REWRITE 
AS 
  SELECT department_id, MAX(salary) 
  FROM employees
  GROUP BY department_id
  ORDER BY department_id;
       
-- Consultando a Materialized View

SELECT *
FROM   mv_department_max_salaries;

