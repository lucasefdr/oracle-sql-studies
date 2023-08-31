--
-- Seção 10 
-- Agregando dados utilizando Funções de Grupo
--
-- Aula 1
--

-- Utilizando as Funções AVG e SUM

SELECT AVG(salary), SUM(salary)
FROM   employees;

-- Utilizando as Funções MIN e MAX

SELECT MIN(hire_date), MAX(hire_date)
FROM   employees;

SELECT MIN(salary), MAX(salary)
FROM   employees;

-- Utilizando a Função COUNT

SELECT COUNT(*)
FROM   employees;

SELECT COUNT(commission_pct)
FROM   employees;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct,0))
FROM employees;

-- Utilizando a Função COUNT com DISTINCT

SELECT COUNT(DISTINCT department_id)
FROM   employees;

SELECT COUNT(department_id)
FROM   employees;

-- Funções de Grupo e valores NULOS

SELECT AVG(commission_pct)
FROM   employees;

-- Tratamento de NULOS em Funções de Grupo 

SELECT AVG(NVL(commission_pct, 0))
FROM   employees;
