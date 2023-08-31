--
-- Seção 11 
-- Exibindo dados a partir de Múltiplas Tabelas
--
-- Aula 2 - Nonequijoins
--

-- Nonequijoins

-- Removendo a Tabela JOB_GRADES

DROP TABLE job_grades;

-- Criando a tabela JOB_GRADES

CREATE TABLE job_grades (
 grade_level  VARCHAR2 (2) NOT NULL,
 lowest_sal    NUMBER (11,2),
 highest_sal   NUMBER (11,2),
 CONSTRAINT job_grades_pk PRIMARY KEY (grade_level));
 
-- Inserindo linhas na tabela JOB_GRADES

INSERT INTO job_grades VALUES ('A',1000,2999); 
INSERT INTO job_grades VALUES ('B',3000,5999);
INSERT INTO job_grades VALUES ('C',6000,9999);
INSERT INTO job_grades VALUES ('D',10000,14999);
INSERT INTO job_grades VALUES ('E',15000,24999);
INSERT INTO job_grades VALUES ('F',25000,40000);

-- Efetivando a Transação

COMMIT;

-- Nonequijoins

SELECT   e.employee_id, e.salary, j.grade_level, j.lowest_sal, j.highest_sal
FROM     employees e 
  JOIN   job_grades j
     ON  NVL(e.salary,0) BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY e.salary;

--
-- Seção 11 - Aula 2
-- Exibindo dados a partir de Múltiplas Tabelas
--

-- Nonequijoins

-- Removendo a Tabela JOB_GRADES

DROP TABLE job_grades;

-- Criando a tabela JOB_GRADES

CREATE TABLE job_grades (
 grade_level  VARCHAR2 (2) NOT NULL,
 lowest_sal    NUMBER (11,2),
 highest_sal   NUMBER (11,2),
 CONSTRAINT job_grades_pk PRIMARY KEY (grade_level));
 
-- Inserindo linhas na tabela JOB_GRADES

INSERT INTO job_grades VALUES ('A',1000,2999); 
INSERT INTO job_grades VALUES ('B',3000,5999);
INSERT INTO job_grades VALUES ('C',6000,9999);
INSERT INTO job_grades VALUES ('D',10000,14999);
INSERT INTO job_grades VALUES ('E',15000,24999);
INSERT INTO job_grades VALUES ('F',25000,40000);

-- Efetivando a Transação

COMMIT;

SELECT *
FROM   job_grades;

-- Nonequijoins

SELECT   e.employee_id, e.salary, j.grade_level, j.lowest_sal, j.highest_sal
FROM     employees e 
  JOIN   job_grades j
     ON  NVL(e.salary,0) BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY e.salary;

SELECT   e.employee_id, e.salary, j.grade_level, j.lowest_sal, j.highest_sal
FROM     employees e 
  JOIN   job_grades j
     ON  NVL(e.salary,0) >= j.lowest_sal AND 
         NVL(e.salary,0) <= j.highest_sal
ORDER BY e.salary;

