--
-- Oracle SQL Avançado 
--
-- Seção 31 - Subconsultas 
--
-- Aula 1 - Utilizando a Cláusula WITH

-- Utilizando a Cláusula WITH

-- Conectar como usuário hr

WITH max_salaries as 
       (SELECT department_id,
               MAX(salary) maximum_salary,
               ROUND(AVG(salary),2) average_salary        
        FROM employees e
        GROUP BY department_id
       )
SELECT e.employee_id, e.salary, e.department_id, max_salaries.maximum_salary, max_salaries.average_salary
FROM   employees e
  JOIN max_salaries ON (e.department_id = max_salaries.department_id);