--
-- Oracle SQL Avançado 
--
-- Seção 22 - Objetos do Banco de Dados
--
-- Aula 1 - Objetos do Banco de Dados

-- Consultando Objectos do Schema HR - Schema Objects

-- Conectar como usuário HR

DESC user_objects

SELECT   object_name, object_type, status
FROM     user_objects
ORDER BY object_type;

-- Conectar como usuário SYS (DBA)

DESC DBA_OBJECTS

SELECT   owner, object_name, object_type, status
FROM     dba_objects
WHERE    owner = 'HR'
ORDER BY object_type;

-- Exemplos de consultas a Nonschema Objects pelo Dicionário de Dados Oracle

SELECT *
FROM dba_tablespaces;

SELECT *
FROM   dba_users;