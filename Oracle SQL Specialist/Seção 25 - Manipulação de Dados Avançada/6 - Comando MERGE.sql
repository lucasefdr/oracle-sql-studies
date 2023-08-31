--
-- Oracle SQL Avançado 
--
-- Seção 25 - Manipulação de Dados Avançada
--
-- Aula 7 - Comando MERGE

-- Comando MERGE

-- Conectar como usuário HR

-- Criando a Tabela employees_copy

DROP TABLE employees_copy;

CREATE TABLE employees_copy
AS
SELECT *
FROM   employees
WHERE  1 = 2;
  
SELECT *
FROM   employees_copy;

-- Comando MERGE

MERGE INTO employees_copy c
USING employees e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
   UPDATE SET 
   c.first_name = e.first_name,
   c.last_name = e.last_name,
   c.email = e.email,
   c.phone_number = e.phone_number,
   c.hire_date = e.hire_date,
   c.job_id = e.job_id,
   c.salary = e.salary,
   c.commission_pct = e.commission_pct,
   c.manager_id = e.manager_id,
   c.department_id = e.department_id
   DELETE WHERE department_id IS NULL
WHEN NOT MATCHED THEN
  INSERT VALUES (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, e.job_id,
                 e.salary, e.commission_pct, e.manager_id, e.department_id);
  
COMMIT;
  
-- Consultando as Tabelas origem employees

SELECT count(*)
FROM employees;

-- Consultando as Tabelas destino employees_copy

SELECT count(*)
FROM employees_copy;

-- Atualizando a Tabela origem employees

UPDATE employees
SET   salary = 90000
WHERE employee_id = 109;

COMMIT;

-- Comando MERGE

MERGE INTO employees_copy c
USING employees e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
   UPDATE SET 
   c.first_name = e.first_name,
   c.last_name = e.last_name,
   c.email = e.email,
   c.phone_number = e.phone_number,
   c.hire_date = e.hire_date,
   c.job_id = e.job_id,
   c.salary = e.salary,
   c.commission_pct = e.commission_pct,
   c.manager_id = e.manager_id,
   c.department_id = e.department_id
   DELETE WHERE department_id IS NULL
WHEN NOT MATCHED THEN
  INSERT VALUES (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, e.job_id,
                 e.salary, e.commission_pct, e.manager_id, e.department_id);
  
COMMIT;
  
-- Consultando as Tabelas origem employees

SELECT count(*)
FROM employees;

-- Consultando as Tabelas destino employees_copy

SELECT count(*)
FROM employees_copy;

SELECT *
FROM employees_copy
WHERE employee_id = 109;