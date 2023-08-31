--
-- Seção 19 
-- Criando e Gerenciando Índices
--
-- Aula 1 - Criando e Gerenciando Índices
--

-- Analize o custo do comando no plano de execução

DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;
DROP INDEX employees_name_idx;

SELECT *
FROM  employees
WHERE last_name = 'Himuro';

-- Criando um Indice Simples

CREATE INDEX employees_last_name_idx
ON employees(last_name);

-- Analize o custo do comando no plano de execução

SELECT *
FROM  employees
WHERE last_name = 'Himuro';

-- Criando um Indice Composto

CREATE INDEX employees_last_name_first_name_idx
ON employees(last_name, first_name);

-- Analize o custo do comando no plano de execução

SELECT *
FROM  employees
WHERE last_name = 'Himuro' AND 
      first_name = 'Guy';

-- Reconstruindo e reorganizando um Índice

ALTER INDEX employees_last_name_first_name_idx REBUILD;

-- Removendo um Índice

DROP INDEX employees_last_name_idx;

-- Consultando Indices

SELECT ix.index_name,
       ic.column_position,
       ic.column_name,
       ix.index_type,
       ix.uniqueness,
       ix.status
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 

-- Removendo um Índice

DROP INDEX employees_last_name_idx;

DROP INDEX employees_last_name_first_name_idx;