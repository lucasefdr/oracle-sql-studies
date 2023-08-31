--
-- Seção 21 
-- Utilizando o SQL*PLUS 
--
-- Aula 1
--

-- No Windows

cmd

--- Na linha de comando do Windows

sqlplus hr/hr@xepdb1

-- Testando  

SQL> SELECT sysdate 
FROM dual;


-- Executando o comando DESC

SQL> DESC employees

-- Executando um comando SQL

SQL> SELECT employee_id, first_name, last_name, salary
FROM   employees;

-- Listando o SQL Buffer

SQL> list

SQL> l

-- Editando o Buffer do SQL*PLUS

SQL> EDIT

SQL> SELECT employee_id, first_name, last_name, salary, commission_pctedit
FROM   employees;

-- Listando o SQL Buffer

SQL> l

-- Executando o comando do SQL Buffer

SQL> /

ou 

SQL> run

-- Salvando o comando do SQL Buffer em um arquivo Script de comandos

SQL> SAVE exemplo01.sql 

-- Editando o arquivo Script de Comandos

SQL> EDIT exemplo01.sql

SELECT employee_id, first_name, last_name,
 salary, commission_pct, department_id
FROM   employees
ORDER BY employee_id;

-- Executando o arquivo Script de Comandos

SQL> @exemplo01.sql

SQL> start exemplo01.sql

-- Sistema Operacional

SQL> host

exit


-- Direcionando a sahostda da execução do comando para um arquivo SPOOL

SQL> SPOOL exemplo01.txt

SQL> SELECT employee_id, first_name, last_name, salary
FROM   employees;

SQL> SPOOL OFF 

-- Visualizando o arquivo SPOOL

SQL> EDIT exemplo01.txt

-- Utilizando o Comando ACCEPT

SQL> EDIT exemplo02.sql

ACCEPT pid PROMPT 'Digite o Id do empregado:'
SELECT employee_id, first_name, last_name, salary
FROM   employees
WHERE  employee_id = &pid
ORDER BY employee_id;

-- Executando o arquivo Script de Comandos

SQL> @exemplo02.sql

Digite o Id do empregado: 110

SQL> EDIT exemplo03.sql

ACCEPT pnome PROMPT 'Digite o primeiro nome:'
SELECT employee_id, first_name, last_name, salary
FROM   employees
WHERE  UPPER(first_name) = UPPER('&pnome')
ORDER BY employee_id;

-- Executando o arquivo Script de Comandos

SQL> @exemplo03.sql

Digite o primeiro nome: John

-- Variáveis de ambiente do SQL*PLUS

SQL> show all

SQL> show verify

- Executando o arquivo Script de Comandos

SQL> @exemplo02.sql


SQL> SET verify OFF

- Executando o arquivo Script de Comandos

SQL> @exemplo02.sql

-- Desconectando e encerrando a Sessão de forma normal no SQL*PLUS

SQL> exit

ou

SQL> quit













