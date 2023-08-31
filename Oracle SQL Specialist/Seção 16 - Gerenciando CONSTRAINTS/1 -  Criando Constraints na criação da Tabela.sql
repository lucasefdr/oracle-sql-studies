--
-- Seção 16 
-- Criando e Gerenciando Constraints 
--
-- Aula 1 - Criando e Gerenciando Constraints na criação da Tabela
--

-- Definindo Constraint NOT NULL

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint PRIMARY KEY a nível de Coluna

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint PRIMARY KEY a nível de Tabela

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id));
 
 -- Definindo Constraint UNIQUE a nível de Coluna

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint UNIQUE a nível de Tabela

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code));
 
  -- Definindo Constraint FOREIGN KEY a nível de Coluna

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL
 CONSTRAINT projects_department_id_fk REFERENCES departments,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint FOREIGN KEY a nível de Tabela

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
 REFERENCES departments(department_id));
 
 -- FOREIGN KEY – Regras de deleção -- Default No Action
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id),
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));
 
 -- FOREIGN KEY – Regras de deleção -- ON DELETE CASCADE
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id) ON DELETE CASCADE,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));
 
 -- FOREIGN KEY – Regras de deleção -- ON DELETE SET NULL
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6),
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id) ON DELETE SET NULL,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));
 
 -- Definindo Constraint CHECK a nível de Coluna
 
DROP TABLE projects cascade constraints;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL
 CONSTRAINT projects_department_id_fk REFERENCES departments,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL 
 CONSTRAINT projects_budget_ck CHECK (budget > 0),
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint FOREIGN KEY a nível de Tabela

DROP TABLE projects cascade constraints;
--
-- Seção 16 - Aula 1
-- Criando e Gerenciando Constraints na criação da Tabela
--

-- Definindo Constraint NOT NULL

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint PRIMARY KEY a nível de Coluna

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint PRIMARY KEY a nível de Tabela

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id));
 
 -- Definindo Constraint UNIQUE a nível de Coluna

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint UNIQUE a nível de Tabela

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code));
 
  -- Definindo Constraint FOREIGN KEY a nível de Coluna

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL
 CONSTRAINT projects_department_id_fk REFERENCES departments (department_id),
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint FOREIGN KEY a nível de Tabela

DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
 REFERENCES departments(department_id));
 
 -- FOREIGN KEY – Regras de deleção -- Default No Action
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id),
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));
 
 -- FOREIGN KEY – Regras de deleção -- ON DELETE CASCADE
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id) ON DELETE CASCADE,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));
 
 -- FOREIGN KEY – Regras de deleção -- ON DELETE SET NULL
 
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6),
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id) ON DELETE SET NULL,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));

 -- Oracle Functions (não podem ser referenciadas na constraint CHECK
 
 SELECT uid, userenv('language'), user, sysdate
 from   dual;
 
 SELECT employee_id, first_name, rownum
 FROM   employees;
 
-- Definindo Constraint CHECK a nível de Coluna

DROP TABLE projects cascade constraints;

CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL
 CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL
 CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL
 CONSTRAINT projects_department_id_fk REFERENCES departments,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL 
 CONSTRAINT projects_budget_ck CHECK (budget > 0),
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint CHECK a nível de Tabela

DROP TABLE projects cascade constraints;

CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)
 REFERENCES departments(department_id),
 CONSTRAINT projects_budget_ck CHECK (budget > 0));
 
 -- Violando Constraints - Erro
 
 INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description) 
    VALUES (
    1, 'ERPIMP', 'ERP Implementation', 77,
    sysdate, null, null, 'Aproved', 'HIGH',
    1000000.00, 'Oracle ERP Implementation');
    
-- Violando Constraints - Corrigindo 

INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description) 
    VALUES (
    1, 'ERPIMP', 'ERP Implementation', 60,
    sysdate, null, null, 'Aproved', 'HIGH',
    1000000.00, 'Oracle ERP Implementation');

COMMIT;

-- Consultando Constraints pelo Dicionário de Dados

DESC user_constraints

DESC user_cons_columns

SELECT co.constraint_name,
       co.constraint_type,
       co.search_condition,
       co.r_constraint_name,
       co.delete_rule,
       cc.column_name,
       cc.position,
       co.status
 FROM   user_constraints co
   JOIN user_cons_columns cc ON (co.constraint_name = cc.constraint_name) AND 
                                (co.table_name = cc.table_name)
 WHERE  co.table_name = 'PROJECTS'
 ORDER BY co.constraint_name,
          cc.position;