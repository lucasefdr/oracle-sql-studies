--
-- Oracle SQL Avançado 
--
-- Seção 25 - Manipulação de Dados Avançada
--
-- Aula 5 - Comando INSERT FIRST Condicional

-- Comando Comando INSERT FIRST Condicional

-- Conectar como usuário HR

-- Criando a Tabela low_salaries vazia

DROP TABLE low_salaries;

CREATE TABLE low_salaries
AS
SELECT employee_id, department_id, salary
FROM   employees
WHERE  1 = 2;

SELECT *
FROM   low_salaries;

-- Criando a Tabela high_salaries vazia

DROP TABLE high_salaries;

CREATE TABLE high_salaries
AS
SELECT employee_id, department_id, salary
FROM   employees
WHERE  1 = 2;

SELECT *
FROM   high_salaries;

-- Criando a Tabela average_salaries vazia

DROP TABLE average_salaries;

CREATE TABLE average_salaries
AS
SELECT employee_id, department_id, salary
FROM   employees
WHERE  1 = 2;

SELECT *
FROM   average_salaries;

-- Comando INSERT FIRST Condicional

INSERT FIRST
  WHEN salary < 5000 
  THEN
       INTO low_salaries     VALUES (employee_id, department_id, salary)
  WHEN  salary BETWEEN 5000 AND 10000
  THEN 
       INTO average_salaries VALUES (employee_id, department_id, salary)
  ELSE
       INTO high_salaries    VALUES (employee_id, department_id, salary) 
  SELECT *
  FROM   employees;


COMMIT;

-- Consultando as Tabelas destino

SELECT *
FROM low_salaries;

SELECT *
FROM average_salaries;

SELECT *
FROM high_salaries;
