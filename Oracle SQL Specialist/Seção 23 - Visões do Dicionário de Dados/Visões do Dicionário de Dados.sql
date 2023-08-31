--
-- Oracle SQL Avançado 
--
-- Seção 23 - Objetos do Banco de Dados
--
-- Aula 1 - Visões do Dicionário de Dados

-- Consultando a Visão Dictionary

DESC dictionary

SELECT *
FROM dictionary
ORDER BY table_name;

SELECT *
FROM dictionary
WHERE table_name = 'USER_TABLES'
ORDER BY table_name;

SELECT *
FROM   dictionary
WHERE  table_name LIKE '%TABLES%'
ORDER BY table_name;

SELECT *
FROM   dict
WHERE  table_name LIKE '%TABLES%'
ORDER BY table_name;

-- Exemplos de consultas as Visões do Dicionário de Dados

-- Conectar como usuário hr

SELECT *
FROM   user_objects;

SELECT *
FROM   user_tables;

SELECT *
FROM   user_sequences;

SELECT *
FROM   user_views;

-- Conectar como usuário sys

SELECT *
FROM   dba_objects 
WHERE  owner = 'HR';

SELECT *
FROM   dba_tables
WHERE  owner = 'HR';

SELECT *
FROM   dba_sequences
WHERE  sequence_owner = 'HR';

SELECT *
FROM   dba_views
WHERE  owner = 'HR';

SELECT *
FROM   dba_users;

SELECT *
FROM   dba_tablespaces;

SELECT * 
FROM   dba_data_files;

SELECT * 
FROM   dba_temp_files;