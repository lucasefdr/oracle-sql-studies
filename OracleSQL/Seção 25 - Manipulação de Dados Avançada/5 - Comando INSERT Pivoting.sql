--
-- Oracle SQL Avançado 
--
-- Seção 25 - Manipulação de Dados Avançada
--
-- Aula 6 - Comando INSERT Pivoting

-- Comando INSERT Pivoting

-- Conectar como usuário HR

-- Criando a Tabela job_salaries

DROP TABLE job_salaries;
CREATE TABLE job_salaries
(year  NUMBER (4) NOT NULL,
 month NUMBER (2) NOT NULL,
 it_prog NUMBER (8,2) NOT NULL, 
 sa_man NUMBER (8,2) NOT NULL, 
 st_man NUMBER (8,2) NOT NULL);
 
-- Inserindo linhas  na Tabela job_salaries

INSERT INTO job_salaries (year, month, it_prog, sa_man, st_man)
VALUES (2015, 9, 31300, 61000, 36400);

INSERT INTO job_salaries (year, month, it_prog, sa_man, st_man)
VALUES (2015, 8, 35000, 79500, 37000);

COMMIT;

-- Consultando a Tabela job_salaries

SELECT *
FROM   job_salaries;

-- Criando a Tabela job_sal

DROP TABLE job_sal;

CREATE TABLE job_sal
(year  NUMBER (4) NOT NULL,
 month NUMBER (2) NOT NULL,
 job_id VARCHAR2(10) NOT NULL, 
 total_salary NUMBER (8,2) NOT NULL);

-- Consultando a Tabela job_sal
 
SELECT *
FROM   job_sal;

-- Comando INSERT Pivoting

INSERT ALL
  INTO job_sal VALUES (year, month, 'IT_PROG', it_prog)
  INTO job_sal VALUES (year, month, 'SA_MAN', sa_man)
  INTO job_sal VALUES (year, month, 'ST_MAN', st_man)
  SELECT *
  FROM   job_salaries;
  
COMMIT;
  
-- Consultando a Tabelas origem

SELECT *
FROM   job_salaries;

-- Consultando a Tabelas destino

SELECT *
FROM   job_sal;