-- Criando tabelas
CREATE TABLE projects
(project_id number(6) not null,
project_code varchar2(10) not null, 
project_name varchar2(100) not null,
creation_date date default sysdate not null,
start_date date,
end_date date,
status varchar2(20) not null,
priority varchar2(10) not null,
budget number(11,2) not null,
description varchar2(400) not null);

CREATE TABLE teams
(project_id NUMBER(6) NOT NULL,
employee_id NUMBER(6) NOT NULL);

-- Consultando tabelas do usuário
SELECT table_name FROM user_tables;

SELECT object_name, object_type
  FROM user_objects
 WHERE object_type = 'TABLE';

-- Alterando tabelas
ALTER TABLE projects ADD(department_id NUMBER(3));
ALTER TABLE projects DROP COLUMN department_id;
ALTER TABLE projects MODIFY(project_code VARCHAR2(6));
ALTER TABLE projects RENAME COLUMN project_name TO name;
ALTER TABLE projects READ ONLY; 
