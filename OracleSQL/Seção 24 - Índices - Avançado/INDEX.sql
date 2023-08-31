SELECT * FROM USER_INDEXES;

-- SELECT FULL na tabela
SELECT * FROM EMPLOYEES;

-- Criando um index para a coluna FIRTS_NAME
CREATE INDEX EMP_FIRST_NAME_IX ON EMPLOYEES(FIRST_NAME);

-- SELECT FULL utilizando o INDEX
SELECT * FROM EMPLOYEES E WHERE E.FIRST_NAME = 'Lucas';

-- Criação de INDEX
CREATE INDEX nomeindex ON tabela(coluna);

-- Criação de INDEX composto
CREATE INDEX nomeindex ON tabela(coluna1, coluna2);

-- Criação de UNIQUE INDEX
CREATE UNIQUE INDEX nomeindex ON tabela(coluna);

-- Dropando um index
DROP INDEX emp_job_ix;

-- SELECT TABLE ACCESS FULL
SELECT * FROM employees e WHERE e.job_id = 'IT_PROG';

-- Criando um index bitmap simples
CREATE INDEX emp_job_ix ON employees(job_id);

-- SELECT com o index criado
SELECT * FROM employees e WHERE e.job_id = 'IT_PROG';

-- 
DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;

SELECT *
  FROM employees e
 WHERE e.first_name = 'Lucas'
   AND e.last_name = 'Rosa';

CREATE INDEX emp_name_ix ON employees(first_name, last_name);

-- Alterando um INDEX
ALTER INDEX emp_name_ix REBUILD ONLINE;

-- Consulta de INDEX no DICT
SELECT ix.*
  FROM user_indexes ix, user_ind_columns ic
 WHERE ix.index_name = ic.index_name
   AND ix.table_name = ic.table_name
   AND ix.table_name = 'EMPLOYEES'
 ORDER BY ix.index_name, ic.column_position;
