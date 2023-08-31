--
-- Oracle SQL Avançado 
--
-- Seção 23 - Objetos do Banco de Dados
--
-- Aula 3 - Visões Dinâmicas de Performance

-- Consultando Visões Dinâmicas de Performance

-- Conectar como usuário sys

SELECT *
FROM   v$tablespace;

SELECT * 
FROM   v$datafile;

SELECT file#, name, bytes/1024/1024 MB, blocks, status
FROM   v$datafile;

SELECT * 
FROM v$tempfile;

SELECT file#, name, bytes/1024/1024 MB, blocks, status 
FROM   v$tempfile;

SELECT * 
FROM   v$controlfile;

SELECT * 
FROM   v$parameter;

SELECT * 
FROM   v$parameter
WHERE  name = 'db_block_size';