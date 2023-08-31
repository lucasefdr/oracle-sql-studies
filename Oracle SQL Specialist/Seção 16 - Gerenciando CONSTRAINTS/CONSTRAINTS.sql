DROP TABLE projects;

-- Primary Key a nível de coluna
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL);
 
 -- Primary Key a nível de tabela
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL, 
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code));
 
  -- Foreign Key a nível de coluna
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 department_id NUMBER(4) NOT NULL
 CONSTRAINT projects_department_id_fk REFERENCES departments (department_id),
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL, 
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_id_ul UNIQUE (project_code));
 
   -- Foreign Key a nível de tabela
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 department_id NUMBER(4) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL, 
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id) REFERENCES departments (department_id));
 
DROP TABLE teams;

 -- Foreign Key - NO ACTION 
CREATE TABLE teams
(project_id NUMBER(6) NOT NULL,
 employee_id NUMBER(6) NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects (project_id),
 CONSTRAINT team_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees (employee_id));
 
 -- Foreign Key - ON DELETE CASCADE
(project_id NUMBER(6) NOT NULL,
 employee_id NUMBER(6) NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects (project_id) ON DELETE CASCADE,
 CONSTRAINT team_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees (employee_id));
 
  -- Foreign Key - ON DELETE SET NULL
(project_id NUMBER(6) NOT NULL,
 employee_id NUMBER(6) NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects (project_id) ON DELETE SET NULL,
 CONSTRAINT team_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees (employee_id));
