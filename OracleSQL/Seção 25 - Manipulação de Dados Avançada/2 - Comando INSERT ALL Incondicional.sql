--
-- Oracle SQL Avançado 
--
-- Seção 25 - Manipulação de Dados Avançada
--
-- Aula 3 - Comando INSERT ALL Incondicional

-- Comando INSERT ALL Incondicional

-- Conectar como usuário HR

-- Limpando a Tabela employees

DELETE FROM employees
WHERE employee_id >= 207;

COMMIT;

-- Criando a Tabela salary_history

DROP TABLE salary_history;

CREATE TABLE salary_history
AS
SELECT employee_id, extract(year from hire_date) year, extract(month from hire_date) month, salary, commission_pct
FROM employees
WHERE hire_date <= sysdate - 365;

SELECT *
FROM salary_history;

-- Criando a Tabela employees_history

DROP TABLE employees_history;

CREATE TABLE employees_history
AS
SELECT employee_id, first_name, last_name, hire_date
FROM   employees
WHERE  hire_date <= sysdate - 365;

SELECT *
FROM   employees_history;

-- Comando INSERT ALL Incondicional

INSERT ALL
  INTO employees_history VALUES (employee_id, first_name, last_name, hire_date)
  INTO salary_history    VALUES (employee_id, extract(year from hire_date), extract(month from hire_date), salary, commission_pct)
  SELECT *
  FROM   employees
  WHERE  hire_date > sysdate-365;

-- Consultando as Tabelas destino

SELECT *
FROM   employees_history
WHERE  hire_date > sysdate-365;

SELECT *
FROM   salary_history
WHERE  year = 2020;

-- Inserindo um novo Empregado

INSERT INTO EMPLOYEES
VALUES (207, 'Carl', 'Palmer', 'CPALMER', '515.123.8182', sysdate, 'IT_PROG', 15000,null,103,60);

COMMIT;

-- Comando INSERT ALL Incondicional

INSERT ALL
INTO employees_history VALUES (employee_id, first_name, last_name, hire_date)
INTO salary_history VALUES (employee_id, extract(year from hire_date), extract(month from hire_date), salary, commission_pct)
SELECT *
FROM employees
WHERE hire_date > sysdate-365;

COMMIT;

-- Consultando as Tabelas destino

SELECT *
FROM   employees_history
WHERE  hire_date > sysdate-365;

SELECT *
FROM   salary_history
WHERE  year = 2020;