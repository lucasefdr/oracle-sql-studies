--
-- Oracle SQL Avançado 
--
-- Seção 34 - Visões Materializadas
--
-- Aula 4 - Fast Refresh Materialized View 

-- Fast Refresh Materialized View 

-- Conectar como usuário HR
		  
-- Removendo uma Fast Refreshed Materialized View 

-- Removendo Materialized View Log

DROP MATERIALIZED VIEW LOG ON employees;

-- Criando Materialized View Log

CREATE MATERIALIZED VIEW LOG ON employees;

DROP MATERIALIZED VIEW mv_sales_manager;

-- Criando uma Fast Refreshed Materialized View 

CREATE MATERIALIZED VIEW mv_sales_manager
BUILD IMMEDIATE 
REFRESH FAST ON COMMIT 
AS
  SELECT *
  FROM employees
  WHERE job_id = 'SA_MAN'; 

-- Consultando uma Fast Refreshed Materialized View 

SELECT *
FROM   mv_sales_manager;

-- Execundo DML sobre a Tabela base de uma Fast Refreshed Materialized View 

INSERT INTO employees 
VALUES (500, 'Alex', 'Brown', 'ABROWN', '11111111', sysdate, 'SA_MAN',10000,null,102,60);

COMMIT;

-- Consultando novamente a Fast Refreshed Materialized View após o DML

SELECT *
FROM   mv_sales_manager;

DELETE FROM employees
WHERE  employee_id=500;

commit;

-- Consultando novamente a Fast Refreshed Materialized View após o DML

SELECT *
FROM   mv_sales_manager;
		  
-- Erro na criação de uma Fast Refreshed Complex Materialized View 

-- Removendo Materialized View Log

DROP MATERIALIZED VIEW LOG ON departments;

-- Criando Materialized View Log

CREATE MATERIALIZED VIEW LOG ON departments;

DROP MATERIALIZED VIEW mv_department_max_salaries;

CREATE MATERIALIZED VIEW mv_department_max_salaries
BUILD IMMEDIATE
REFRESH FAST ON COMMIT
ENABLE QUERY REWRITE
AS SELECT d.department_name, e.* 
   FROM employees e JOIN departments d ON (e.department_id = d.department_id)
   WHERE (e.department_id, salary) IN 
                                   (SELECT department_id, MAX(salary) salary
                                    FROM employees
                                    GROUP BY department_id)
   ORDER BY e.department_id, salary;
		  
CREATE MATERIALIZED VIEW mv_department_max_salaries
BUILD IMMEDIATE
REFRESH FAST 
ENABLE QUERY REWRITE
AS SELECT d.department_name, e.* 
   FROM employees e JOIN departments d ON (e.department_id = d.department_id)
   WHERE (e.department_id, salary) IN 
                                   (SELECT department_id, MAX(salary) salary
                                    FROM employees
                                    GROUP BY department_id)
   ORDER BY e.department_id, salary;
   
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