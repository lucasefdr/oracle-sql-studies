--
-- Oracle SQL Avançado 
--
-- Seção 24 - Índices
--
-- Aula 6 - Criando Índice para Primary Key na criação da Tabela

-- Criando Índice para Primary Key na criação da Tabela com nome default

DROP TABLE projects;

CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL 
   CONSTRAINT project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL);
 
 -- Consultando o Indice

SELECT ix.index_name,
       ic.column_name,
       ic.column_position,
       ix.index_type,
       ix.uniqueness,
       ix.status,
       ix.tablespace_name
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'PROJECTS'
ORDER BY ix.index_name, ic.column_position; 

-- Criando Índice para Primary Key na criação da Tabela com um nome específico

DROP TABLE projects;

CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL 
   CONSTRAINT project_id_pk PRIMARY KEY 
   USING INDEX (CREATE INDEX project_id_idx ON projects (project_id)),
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL);
 
 -- Consultando o Indice

SELECT ix.index_name,
       ic.column_name,
       ic.column_position,
       ix.index_type,
       ix.uniqueness,
       ix.status,
       ix.tablespace_name
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'PROJECTS'
ORDER BY ix.index_name, ic.column_position; 

-- Criando Índice para Primary Key na criação da Tabela com propriedades específicas

DROP TABLE projects;

CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL 
   CONSTRAINT project_id_pk PRIMARY KEY 
   USING INDEX (CREATE INDEX project_id_idx ON projects (project_id)
                TABLESPACE USERS),
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL);
 
-- Consultando o Indice

SELECT ix.index_name,
       ic.column_name,
       ic.column_position,
       ix.index_type,
       ix.uniqueness,
       ix.status,
       ix.tablespace_name
FROM    user_indexes ix
  JOIN user_ind_columns ic ON (ix.index_name = ic.index_name) AND 
                              (ix.table_name = ic.table_name)
WHERE ix.table_name = 'PROJECTS'
ORDER BY ix.index_name, ic.column_position; 