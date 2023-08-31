--
-- Oracle SQL Avançado 
--
-- Seção 23 - Objetos do Banco de Dados
--
-- Aula 2 - Diferenças entre as Visões com prefixo USER, ALL e DBA

-- Consultando visões do Dicionário de Dados

-- Consultando informações sobre objetos

-- Conectar como usuário hr

SELECT *
FROM   USER_OBJECTS;

SELECT *
FROM   ALL_OBJECTS;

-- Conectar como usuário SYS

SELECT *
FROM   DBA_OBJECTS
WHERE  owner = 'HR';

-- Consultando informações sobre tabelas

-- Conectar como usuário hr

SELECT *
FROM   USER_TABLES;

SELECT *
FROM   ALL_TABLES;

-- Conectar como usuário SYS

SELECT *
FROM   DBA_TABLES
WHERE  owner = 'HR';

-- Consultando informações sobre colunas de tabelas

-- Conectar como usuário hr

SELECT *
FROM   USER_TAB_COLUMNS
WHERE  table_name = 'EMPLOYEES' 
ORDER BY column_id;


SELECT *
FROM   ALL_TAB_COLUMNS
WHERE  owner = 'HR'  AND 
       table_name = 'EMPLOYEES' 
ORDER BY column_id;

-- Conectar como usuário SYS

SELECT *
FROM   DBA_TAB_COLUMNS
WHERE  owner = 'HR'  AND 
       table_name = 'EMPLOYEES' 
ORDER BY column_id;

-- Consultando informações sobre constraints de tabelas

-- Conectar como usuário hr

SELECT *
FROM   USER_CONSTRAINTS
WHERE  table_name = 'EMPLOYEES';

SELECT *
FROM   ALL_CONSTRAINTS
WHERE  owner = 'HR'  AND
       table_name = 'EMPLOYEES';


-- Conectar como usuário SYS

SELECT *
FROM   DBA_CONSTRAINTS
WHERE  owner = 'HR'  AND
       table_name = 'EMPLOYEES';

-- Consultando informações sobre colunas de uma constraint

-- Conectar como usuário hr

SELECT *
FROM   USER_CONS_COLUMNS
WHERE  table_name = 'EMPLOYEES'  AND
       constraint_name = 'EMP_EMP_ID_PK'
ORDER BY position;

SELECT *
FROM   ALL_CONS_COLUMNS
WHERE  owner = 'HR' AND 
       table_name = 'EMPLOYEES'  AND
       constraint_name = 'EMP_EMP_ID_PK'
ORDER BY position;

-- Conectar como usuário SYS

SELECT *
FROM   DBA_CONS_COLUMNS
WHERE  owner = 'HR' AND 
       table_name = 'EMPLOYEES'  AND
       constraint_name = 'EMP_EMP_ID_PK'
ORDER BY position;

-- Consultando informações sobre indices de tabelas

-- Conectar como usuário hr

SELECT *
FROM   USER_INDEXES
WHERE  table_name = 'EMPLOYEES';

SELECT *
FROM   ALL_INDEXES
WHERE  owner = 'HR' AND 
       table_name = 'EMPLOYEES';

-- Conectar como usuário SYS

SELECT *
FROM   DBA_INDEXES
WHERE  owner = 'HR' AND 
       table_name = 'EMPLOYEES';

-- Consultando informações sobre colunas que compõem indices de tabelas

-- Conectar como usuário hr

SELECT *
FROM   USER_IND_COLUMNS
WHERE  table_name = 'EMPLOYEES'  AND
       index_name = 'EMP_EMP_ID_PK';

SELECT *
FROM   ALL_IND_COLUMNS
WHERE  index_owner = 'HR' AND 
       table_name = 'EMPLOYEES'  AND
       index_name = 'EMP_EMP_ID_PK';

-- Conectar como usuário SYS

SELECT *
FROM   DBA_IND_COLUMNS
WHERE  index_owner = 'HR' AND 
       table_name = 'EMPLOYEES'  AND
       index_name = 'EMP_EMP_ID_PK';
       
-- Consultando informações sobre sequences

-- Conectar como usuário hr

SELECT *
FROM   USER_SEQUENCES;

SELECT *
FROM   ALL_SEQUENCES
WHERE  sequence_owner = 'HR';

-- Conectar como usuário sys

SELECT *
FROM dba_sequences
WHERE sequence_owner = 'HR';

-- Consultando informações sobre views

-- Conectar como usuário hr

SELECT *
FROM   USER_VIEWS;

SELECT *
FROM   ALL_VIEWS
WHERE  owner = 'HR';

-- Conectar como usuário sys

SELECT *
FROM dba_views
WHERE owner = 'HR';

-- Consultando informações sobre o banco de dados

-- Conectar como usuário sys

SELECT *
FROM dba_users;

SELECT *
FROM dba_tablespaces;

SELECT * 
FROM dba_data_files;

SELECT * 
FROM dba_temp_files;