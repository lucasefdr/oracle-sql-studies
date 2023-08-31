--
-- Oracle SQL Avançado 
--
-- Seção 32 - Gerando Scripts SQL Dinâmicos
--
-- Aula 1 - Gerando Scripts SQL Dinâmicos

-- Gerando Scripts SQL Dinâmicos

-- Conectar como usuário sys

-- Criar um usuario curso

DROP USER curso; 

CREATE User curso
IDENTIFIED BY curso
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE TO curso;

-- Crie uma pasta no Windows C:\cursos\oracle\sql_especialista 
-- Na linha de comando do Windows execute:

mkdir C:\cursos\oracle\sql_especialista

-- No SQL Developer crie uma Conexão para o usuário curso

-- Conectar como usuário curso

DROP TABLE alunos;

CREATE TABLE alunos
(aluno_id NUMBER(11),
 nome VARCHAR2(200));

DROP TABLE cursos;

CREATE TABLE cursos
(curso_id NUMBER(11),
 nome VARCHAR2(200),
 preco NUMBER(11,2));
 
 -- Consultando as Tabelas do usuário conectado (curso)
 
 SELECT *
 FROM   user_tables;

-- Criando um script que remove (drop) todas as tabelas do usuário que esta conectado (curso)

SET HEADING OFF
SPOOL C:\cursos\oracle\sql_especialista\drop_tables.sql
SELECT 'DROP TABLE ' || table_name || ' cascade constraints;'
FROM   user_tables;
SPOOL OFF

-- Edite e vizualize o arquivo gerado C:\cursos\oracle\sql_especialista\drop_tables.sql

-- No SQLDeveloper execute o Script C:\cursos\oracle\sql_especialista\drop_tables.sql

@C:\cursos\oracle\sql_especialista\drop_tables.sql

-- Consultando as Tabelas do usuário conectado (curso)
 
 SELECT *
 FROM   user_tables;
