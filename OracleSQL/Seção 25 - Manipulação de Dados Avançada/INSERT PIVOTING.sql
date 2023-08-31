-- Criando a tabela job_salaries
CREATE TABLE job_salaries
(year NUMBER(4) NOT NULL,
month NUMBER(2) NOT NULL,
it_prog NUMBER(8,2) NOT NULL,
sa_man NUMBER(8,2) NOT NULL,
st_man NUMBER(8,2) NOT NULL);

-- Inserindo linhas
INSERT INTO job_salaries
  (year, month, it_prog, sa_man, st_man)
VALUES
  (2015, 9, 31300, 71000, 44220);

INSERT INTO job_salaries
  (year, month, it_prog, sa_man, st_man)
VALUES
  (2015, 8, 36300, 81000, 49220);

-- Criando a tabela job_sal
CREATE TABLE job_sal
(year NUMBER(4) NOT NULL,
month NUMBER(2) NOT NULL,
job_id VARCHAR2(10) NOT NULL,
total_salary NUMBER (8,2) NOT NULL); 

-- INSERT PIVOTING
INSERT ALL
 INTO tabela VALUES (coluna1, coluna2, 'REF_COL_TB1', REF_COL_TB1)
 INTO tabela VALUES (coluna1, coluna2, 'REF_COL_TB2', REF_COL_TB2)
 INTO tabela VALUES (coluna1, coluna2, 'REF_COL_TB3', REF_COL_TB3)
 SELECT * FROM tabelabase;

-- INSERT PIVOTING
INSERT ALL
 INTO job_sal VALUES (year, month, 'IT_PROG', it_prog)
 INTO job_sal VALUES (year, month, 'SA_MAN', sa_man)
 INTO job_sal VALUES (year, month, 'ST_MAN', st_man)
 SELECT * FROM job_salaries;
 
SELECT * FROM job_sal;
