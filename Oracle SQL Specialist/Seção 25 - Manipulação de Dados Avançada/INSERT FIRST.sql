-- Criando as tabelas vazias
CREATE TABLE low_salaries
AS 
SELECT e.employee_id, e.department_id, e.salary
  FROM employees e
 WHERE 1 = 2;

CREATE TABLE high_salaries AS
  SELECT e.employee_id, e.department_id, e.salary
    FROM employees e
   WHERE 1 = 2;

CREATE TABLE average_salaries AS
  SELECT e.employee_id, e.department_id, e.salary
    FROM employees e
   WHERE 1 = 2;

-- INSERT FIRST Condicional
INSERT FIRST WHEN condicao THEN INTO tabela1
  (coluna1 [, coluna2 ])
VALUES
  (valor1, [, valor2 ]) WHEN condicao THEN INTO tabela2
  (coluna1 [, coluna2 ])
VALUES
  (valor1, [, valor2 ]) ELSE INTO tabela3
  (coluna1 [, coluna2 ])
VALUES
  (valor1, [, valor2 ])
  SELECT colunas FROM tabelabase;

-- INSERT FIRST Condicional
INSERT FIRST WHEN salary < 5000 THEN INTO low_salaries
VALUES
  (employee_id, department_id, salary) WHEN salary BETWEEN 5000 AND 10000 THEN INTO average_salaries
VALUES
  (employee_id, department_id, salary) ELSE INTO high_salaries
VALUES
  (employee_id, department_id, salary)
  SELECT * FROM employees;

-- Consultas
SELECT * FROM low_salaries;
SELECT * FROM average_salaries;
SELECT * FROM high_salaries;
