-- Criação de uma tabela temporária preservando linhas após o commit
CREATE GLOBAL TEMPORARY TABLE nometabela 
(coluna1 [, coluna2, ...]) 
ON COMMIT PRESERVE ROWS;

-- Criação de uma tabela temporária eliminando linhas após o commit
CREATE GLOBAL TEMPORARY TABLE nometabela 
(coluna1 [, coluna2, ...]) 
ON COMMIT DELETE ROWS;

-- Criando uma tabela temporária
CREATE GLOBAL TEMPORARY TABLE tmp_employees
(employee_id    NUMBER(6) NOT NULL,
 first_name     VARCHAR2(20),
 last_name      VARCHAR2(25),
 email          VARCHAR2(25),
 phone_number   VARCHAR2(20),
 hire_date      DATE,
 job_id         VARCHAR2(10),
 salary         NUMBER(8,2),
 commission_pct NUMBER(2,2),
 manager_id     NUMBER(6),
 department_id  NUMBER(4))
ON COMMIT PRESERVE ROWS;

SELECT * FROM tmp_employees;
