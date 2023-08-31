--
-- Seção 13 - Aula 1
-- Operadores SET
--
-- Aula 1 - Operadores SET
--

-- Utilizando o operador UNION 

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- Utilizando o operador UNION ALL

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
UNION ALL
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id = 60
ORDER BY employee_id;

-- Utilizando operador INTERSECT

SELECT employee_id, job_id
FROM   employees
WHERE  job_id = 'IT_PROG'
INTERSECT
SELECT employee_id, job_id
FROM   employees
WHERE  department_id IN (60, 90, 100)
ORDER BY employee_id;

-- Utilizando operador MINUS

SELECT employee_id, job_id
FROM   employees
WHERE  department_id IN (60, 90, 100)
MINUS
SELECT employee_id, job_id
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- Cuidados com os tipos de dados na lista de colunas ou expressões do SELECT

SELECT employee_id, job_id, hire_date
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- Corrigindo o erro

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
ORDER BY employee_id;

-- Utilizando mais de um operador SET

SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  department_id IN (60, 90, 100)
UNION
(SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  job_id = 'IT_PROG'
INTERSECT
SELECT employee_id, job_id, hire_date, salary
FROM   employees
WHERE  salary > 10000)
ORDER BY employee_id;