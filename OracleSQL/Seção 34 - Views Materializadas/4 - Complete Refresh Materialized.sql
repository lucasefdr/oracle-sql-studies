--
-- Oracle SQL Avançado 
--
-- Seção 34 - Visões Materializadas
--
-- Aula 5 - Complete Refresh Materialized View 

-- Complete Refresh Materialized View 
		  
-- Conectar como usuário HR

DROP MATERIALIZED VIEW mv_sales_manager;

-- Criando uma Complete Refresh Materialized View

CREATE MATERIALIZED VIEW mv_sales_manager
BUILD IMMEDIATE 
REFRESH COMPLETE 
ON COMMIT 
AS
  SELECT *
  FROM   employees
  WHERE  job_id = 'SA_MAN'; 

-- Consultando uma Complete Refreshed Materialized View 

SELECT *
FROM   mv_sales_manager;

-- Execundo DML sobre a Tabela base de uma Complete Refreshed Materialized View

INSERT INTO employees
VALUES (501, 'Robert', 'Jonhson', 'RJONHSON', '22222222', sysdate, 'SA_MAN',15000,null,102,60);

COMMIT;   

-- Consultando novamente uma Complete Refreshed Materialized View após o DML

SELECT *
FROM   mv_sales_manager;

DELETE FROM employees
WHERE  employee_id=501;

commit;

-- Consultando novamente a Complete Refreshed Materialized View após o DML

SELECT *
FROM   mv_sales_manager;

DROP MATERIALIZED VIEW mv_department_max_salaries;

CREATE MATERIALIZED VIEW mv_department_max_salaries
BUILD IMMEDIATE
REFRESH COMPLETE 
ENABLE QUERY REWRITE
AS SELECT d.department_name, e.* 
   FROM employees e JOIN departments d ON (e.department_id = d.department_id)
   WHERE (e.department_id, salary) IN 
                                   (SELECT department_id, MAX(salary) salary
                                    FROM employees
                                    GROUP BY department_id)
   ORDER BY e.department_id, salary;

-- Consultando a Materialized View

SELECT *
FROM   mv_department_max_salaries;