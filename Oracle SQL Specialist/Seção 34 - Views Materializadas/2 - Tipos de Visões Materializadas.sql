--
-- Oracle SQL Avançado 
--
-- Seção 34 - Visões Materializadas
--
-- Aula 2 - Tipos de Visões Materializadas

-- Tipos de Visões Materializadas

-- Conectar como sys

GRANT CREATE MATERIALIZED VIEW to hr; 

-- Conectar como usuário hr

-- Materialized Views com Funções de Agregação

-- Criando Materialized View log

DROP MATERIALIZED VIEW LOG ON employees;

CREATE MATERIALIZED VIEW LOG on employees;

-- Criando Materialized View

DROP MATERIALIZED VIEW mv_department_salaries;

CREATE MATERIALIZED VIEW mv_department_salaries
BUILD IMMEDIATE
REFRESH COMPLETE
ENABLE QUERY REWRITE
AS 
  SELECT e.department_id,
         SUM(e.salary) sum_salary,
         ROUND(AVG(NVL(e.salary,0)),2) avg_salary
  FROM employees e
  GROUP BY e.department_id;

SELECT *
FROM   mv_department_salaries;

-- Materialized Views contendo somente Joins

-- Criando Materialized View

DROP MATERIALIZED VIEW mv_employes_jobs_departments;

CREATE MATERIALIZED VIEW mv_employes_jobs_departments
BUILD IMMEDIATE
REFRESH COMPLETE
ENABLE QUERY REWRITE
AS 
SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.commission_pct,
       e.job_id, j.job_title,
       e.department_id, d.department_name
FROM employees e
     JOIN jobs j ON (e.job_id = j.job_id)
     JOIN departments d ON (e.department_id = d.department_id);
     
SELECT *
FROM   mv_employes_jobs_departments;

-- Nested Materialized Views

-- Criando Materialized View

DROP MATERIALIZED VIEW mv_department_cust_hour;

CREATE MATERIALIZED VIEW mv_department_cust_hour
BUILD IMMEDIATE
REFRESH COMPLETE
ENABLE QUERY REWRITE
AS 
  SELECT mv.department_name,
         SUM(mv.salary) sum_salary,
         ROUND(SUM(mv.salary)/160,2) cust_hour
  FROM   mv_employes_jobs_departments mv
  GROUP BY mv.department_name;

SELECT *
FROM   mv_department_cust_hour;