--
-- Oracle SQL Avançado 
--
-- Seção 28 - Expressões Regulares
--
-- Aula 5 - Utilizando REGEXP_INSTR
--

-- Expressões Regulares

-- Conectar como HR

-- utilizando REGEXP_INSTR

DROP TABLE employees_copy;

CREATE TABLE employees_copy
AS 
SELECT employee_id, first_name || ' ' || last_name name, email, phone_number, hire_date, job_id,
       salary, commission_pct, manager_id, department_id
FROM employees;

-- Comparação case sensitivo (default), a partir da posição 1 para primeira ocorrencia encontrada

SELECT name, REGEXP_INSTR(name, '^[A-Z][[:alpha:]]+ ') as position
FROM employees_copy;

-- Comparação case sensitivo (default), a partir da posição 1 para primeira ocorrencia encontrada

SELECT name, REGEXP_INSTR(name, '^[A-Z][[:alpha:]]+ ', 1,1,0,'c') as position
FROM employees_copy;
