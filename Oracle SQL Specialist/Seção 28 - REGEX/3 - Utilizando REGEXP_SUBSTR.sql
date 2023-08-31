--
-- Oracle SQL Avançado 
--
-- Seção 28 - Expressões Regulares
--
-- Aula 4 - Utilizando REGEXP_SUBSTR
--

-- Expressões Regulares

-- utilizando REGEXP_SUBSTR

-- Conectar como HR

DROP TABLE employees_copy;

CREATE TABLE employees_copy
AS 
SELECT employee_id, first_name || ' ' || last_name name, email, phone_number, hire_date, job_id,
       salary, commission_pct, manager_id, department_id
FROM employees;

SELECT *
FROM   employees_copy;

-- Comparação case sensitivo (default), a partir da posição 1 para 1 combinações encontrada

SELECT name, REGEXP_SUBSTR(name, '^[A-Z][[:alpha:]]+ ') as first_name
FROM employees_copy;

-- Comparação case sensitivo, a partir da posição 1 para 1 combinações encontrada

SELECT name, REGEXP_SUBSTR(name, '^[A-Z][[:alpha:]]+ ',1,1,'c') as first_name
FROM employees_copy;
