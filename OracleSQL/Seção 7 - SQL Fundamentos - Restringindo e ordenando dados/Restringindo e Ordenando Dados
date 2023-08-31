--
-- Seção 7 
-- Restringindo e Ordenando Dados
--
-- Aula 1
-- 

-- Utilizando a cláusula WHERE

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 60;

SELECT employee_id, last_name, job_id, department_id
FROM   employees
WHERE  job_id = 'IT_PROG';

-- Utilizando Strings de caractere na cláusula WHERE

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

-- Utilizando Strings de caractere com datas na cláusula WHERE

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

-- Utilizando operadores de comparação na cláusula WHERE

SELECT last_name, salary
FROM employees
WHERE salary >= 10000;

-- Selecionando faixas de valores utilizando o operador BETWEEN

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 15000;

-- Selecionando valores dentro de uma lista utilizando o operador IN

SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP') ;

-- Utilizando o operador LIKE

SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

-- Combinando o uso de vários caracteres curinga

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '_a%';

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%a';

-- Comparações com valor NULL

SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL ;

-- Utilizando a expressão de comparação IS NULL

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- Utilizando o operador AND

SELECT employee_id, last_name, job_id, salary
FROM    employees
WHERE salary >= 5000
AND   job_id =  'IT_PROG' ;

-- Utilizando o operador OR

SELECT employee_id, last_name, job_id, salary
FROM    employees
WHERE salary >= 5000
OR   job_id =  'IT_PROG';

-- Utilizando o operador NOT

SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

-- Regras de Precedência

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP'  OR job_id = 'IT_PROG' AND salary > 10000;

-- Utilizando parênteses para sobrepor as regras de precedência

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP'  OR
               job_id = 'IT_PROG')
AND salary > 10000;

-- Utilizando a cláusula ORDER BY - Ordem Ascendente

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

-- Utilizando a cláusula ORDER BY – Ordem Descendente

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

-- Utilizando a cláusula ORDER BY – Referenciando ALIAS

SELECT employee_id, last_name, salary*12 salario_anual
FROM employees
ORDER BY salario_anual;

-- Utilizando a cláusula ORDER BY – Referenciando a Posição

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 4;

-- Utilizando a cláusula ORDER BY – Múltiplas colunas ou expressões

SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- Utilizando Variáveis de Substituição - &

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

-- Utilizando Variáveis de Substituição - &&

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&employee_id;

-- Variáveis de substituição com valores tipo Character e Date

SELECT last_name, department_id, job_id, salary*12
FROM employees
WHERE job_id = '&job_id' ;

-- Utilizando o comando DEFINE

DEFINE employee_id = 101

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id ;

DEFINE employee_id

UNDEFINE employee_id