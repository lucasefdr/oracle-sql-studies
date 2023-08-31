--
-- Oracle SQL Avançado 
--
-- Seção 29 - Tabelas Temporárias
--
-- Aula 1 - Tabelas Temporárias
--

-- Tabelas Temporárias

-- Conectar como HR (primeira Sessão)

-- Criando uma Tabela Temporária

CREATE GLOBAL TEMPORARY TABLE hr.tmp_employees
(employee_id  NUMBER(6),
 first_name VARCHAR2(20),
 last_name VARCHAR2(25),
 email VARCHAR2(25),
 phone_number VARCHAR2(20),
 hire_date DATE,
 job_id VARCHAR2(10),
 salary NUMBER(8,2),
 commission_pct NUMBER(2,2),
 manager_id NUMBER(6),
 department_id NUMBER(4))
 ON COMMIT PRESERVE ROWS;
 
-- Consultando a Tabela Temporária 

SELECT *
FROM   hr.tmp_employees;

-- Conectar como SYS (Segunda Sessão)

-- Consultando a Tabela Temporária 

SELECT *
FROM hr.tmp_employees;

-- Voltar para primeira Sessão hr

-- Inserir linhas na Tabela Temporária

INSERT INTO hr.tmp_employees
  SELECT *
  FROM hr.employees;
  
COMMIT;

-- Consultando a Tabela Temporária 

SELECT *
FROM hr.tmp_employees;

-- Voltar para segunda Sessão SYS

-- Consultando a Tabela Temporária 

SELECT *
FROM hr.tmp_employees;

-- Voltar para primeira Sessão hr

-- Encerrar a Sessão

-- Conectar como SYS (Segunda Sessão)

-- Consultando a Tabela Temporária 

SELECT *
FROM hr.tmp_employees;

-- Inserir linhas na Tabela Temporária

INSERT INTO hr.tmp_employees
  SELECT *
  FROM hr.employees;

-- Conectar como hr (Terceira Sessão)

-- Consultando a Tabela Temporária 

SELECT *
FROM hr.tmp_employees;

-- Conectar como sys (Quarta Sessão)

-- Consultando a Tabela Temporária 

SELECT *
FROM hr.tmp_employees;
