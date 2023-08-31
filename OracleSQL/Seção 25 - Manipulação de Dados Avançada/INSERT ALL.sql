-- INSERT INTO com DEFAULT
INSERT INTO projects
  (project_id,
   project_code,
   project_name,
   department_id,
   creation_date,
   start_date,
   end_date,
   status,
   priority,
   budget,
   description)
VALUES
  (1,
   'PROJERP001',
   'ORACLE ERP',
   80,
   DEFAULT,
   NULL,
   NULL,
   'PLANNING',
   'HIGH',
   10000,
   'Implantação Oracle ERP');

SELECT * FROM DEPARTMENTS;
SELECT * FROM PROJECTS;

DELETE FROM EMPLOYEES E WHERE E.EMPLOYEE_ID >= 207;
COMMIT;

-- Criando tabela SALARY_HISTORY
CREATE TABLE salary_history AS
  SELECT e.employee_id,
         EXTRACT(YEAR FROM e.hire_date) YEAR,
         EXTRACT(MONTH FROM e.hire_date) MONTH,
         e.salary,
         e.commission_pct
    FROM employees e
   WHERE e.hire_date <= SYSDATE - 365;

SELECT * FROM salary_history;

-- Criando tabela EMPLOYEES_HISTORY
CREATE TABLE employees_history AS
  SELECT e.employee_id, e.first_name, e.last_name, e.hire_date
    FROM employees e
   WHERE e.hire_date <= SYSDATE - 365;

SELECT * FROM employees_history;

INSERT INTO employees
  (employee_id,
   first_name,
   last_name,
   email,
   phone_number,
   hire_date,
   job_id,
   salary,
   commission_pct,
   manager_id,
   department_id)
VALUES
  (207,
   'Lucas',
   'Rosa',
   'LROSA',
   '111-222-333',
   SYSDATE,
   'IT_PROG',
   1750,
   0.1,
   100,
   40);

-- INSERT ALL Incondicional
INSERT ALL INTO tabela1
  (coluna1 [, coluna2 ])
VALUES
  (valor1, [, valor2 ]) INTO tabela2
  (coluna1 [, coluna2 ])
VALUES
  (valor1, [, valor2 ])
  SELECT colunas FROM tabelabase;

-- INSERT ALL Incondicional nas tabelas criadas
INSERT ALL INTO employees_history
VALUES
  (employee_id, first_name, last_name, hire_date) INTO salary_history
VALUES
  (employee_id,
   EXTRACT(YEAR FROM hire_date),
   EXTRACT(MONTH FROM hire_date),
   salary,
   commission_pct)
  SELECT * FROM EMPLOYEES E WHERE HIRE_DATE > SYSDATE - 365;

-- INSERT ALL Condicional
INSERT ALL WHEN condicao THEN INTO tabela1
  (coluna1 [, coluna2 ])
VALUES
  (valor1, [, valor2 ]) WHEN condicao THEN INTO tabela2
  (coluna1 [, coluna2 ])
VALUES
  (valor1, [, valor2 ])
  SELECT colunas FROM tabelabase;

-- INSERT ALL Condicional nas tabelas criadas 
SELECT * FROM SALARY_HISTORY;
TRUNCATE TABLE SALARY_HISTORY;

-- Criando tabela de programadores
CREATE TABLE IT_PROGRAMMERS AS
  SELECT e.employee_id, e.first_name, e.last_name, e.hire_date
    FROM employees e
   WHERE e.job_id = 'IT_PROG'
     AND e.hire_date <= SYSDATE - 365;

SELECT * FROM IT_PROGRAMMERS;

DROP TABLE LIVING_IN_US;

-- Criando tabela de pessoas que vivem no US
CREATE TABLE LIVING_IN_US AS
  SELECT e.employee_id, e.first_name, e.last_name, e.hire_date
    FROM employees e
   WHERE (e.hire_date <= SYSDATE - 365)
     AND EXISTS
   (SELECT 1
            FROM departments d
           WHERE e.department_id = d.department_id
             AND EXISTS (SELECT 1
                    FROM locations l
                   WHERE d.location_id = l.location_id
                     AND l.country_id = 'US'));

SELECT COUNT(e.employee_id)
  FROM employees e, departments d, locations l
 WHERE e.department_id = d.department_id
   AND d.location_id = l.location_id
   AND l.country_id = 'US';

SELECT COUNT(liu.employee_id) FROM living_in_us liu;

INSERT INTO employees
  (employee_id,
   first_name,
   last_name,
   email,
   phone_number,
   hire_date,
   job_id,
   salary,
   commission_pct,
   manager_id,
   department_id)
VALUES
  (208,
   'Carl',
   'Palmer',
   'CPALMER',
   '111-222-333',
   SYSDATE,
   'IT_PROG',
   1750,
   0.1,
   100,
   40);

INSERT INTO employees
  (employee_id,
   first_name,
   last_name,
   email,
   phone_number,
   hire_date,
   job_id,
   salary,
   commission_pct,
   manager_id,
   department_id)
VALUES
  (209,
   'John',
   'Textor',
   'JTEXTOR',
   '111-222-333',
   SYSDATE,
   'IT_PROG',
   1750,
   0.1,
   100,
   40);

-- INSERT ALL Condicional
INSERT ALL WHEN
  (hire_date > SYSDATE - 365) THEN INTO employees_history
VALUES
  (employee_id, first_name, last_name, hire_date) INTO salary_history
VALUES
  (employee_id,
   EXTRACT(YEAR FROM hire_date),
   EXTRACT(MONTH FROM hire_date),
   salary,
   commission_pct) WHEN
  (hire_date > SYSDATE - 365) AND job_id = 'IT_PROG' THEN INTO it_programmers
VALUES
  (employee_id, first_name, last_name, hire_date) WHEN
  (hire_date > SYSDATE - 365) AND EXISTS
  (SELECT 1
     FROM departments d
    WHERE EXISTS (SELECT 1
             FROM locations l
            WHERE d.location_id = l.location_id
              AND l.country_id = 'US')) THEN INTO living_in_us
VALUES
  (employee_id, first_name, last_name, hire_date)
  SELECT * FROM employees e WHERE e.hire_date > SYSDATE - 365;

TRUNCATE TABLE employees_history;
TRUNCATE TABLE salary_history;
TRUNCATE TABLE it_programmers;
TRUNCATE TABLE living_in_us;

-- Consultas
SELECT * FROM employees_history eh WHERE eh.hire_date > SYSDATE - 365;
SELECT * FROM salary_history;
SELECT * FROM it_programmers ip WHERE ip.hire_date > SYSDATE - 365;
SELECT * FROM living_in_us liu WHERE liu.hire_date > SYSDATE - 365;
