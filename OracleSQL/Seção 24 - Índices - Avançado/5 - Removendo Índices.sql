--
-- Oracle SQL Avançado 
--
-- Seção 24 - Índices
--
-- Aula 5 - Removendo Índices

-- Removendo Índices

DROP INDEX employees_job_id_idx;

-- Consultando índices 

SELECT ix.index_name,
       ic.column_name,
       ic.column_position,
       ix.index_type,
       ix.uniqueness,
       ix.status,
       ix.tablespace_name,
       visibility
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 

-- Criando Índice employees_job_id_idx

CREATE INDEX employees_job_id_idx
ON employees(job_id);

-- Consultando índices 

DESC all_indexes

SELECT ix.owner,
       ix.index_name,
       ic.column_name,
       ic.column_position,
       ix.index_type,
       ix.uniqueness,
       ix.status,
       ix.tablespace_name,
       visibility
FROM    all_indexes ix
  JOIN  all_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 

-- Removendo Índices ONLINE

DROP INDEX employees_job_id_idx ONLINE;

-- Consultando índices 

SELECT ix.index_name,
       ic.column_name,
       ic.column_position,
       ix.index_type,
       ix.uniqueness,
       ix.status,
       ix.tablespace_name,
       visibility
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position; 