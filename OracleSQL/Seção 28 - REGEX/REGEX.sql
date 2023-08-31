-- REGEXP_LIKE
REGEXP_LIKE(string, padrão [, opçãodematch])

SELECT * FROM employees IKHERE REGEXP_LIKE(e.last_name, '.osa$', 'c');

DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees WHERE 1 = 2;

-- Criando uma CONSTRAINT com REGEX
ALTER TABLE employees_copy ADD CONSTRAINT phone_number_ck CHECK(REGEXP_LIKE(phone_number,
                                                                            '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$'));
-- REGEXP_REPLACE
REGEXP_REPLACE(string, 
               padrão 
							 [, stringsubstituicao 
							 [, posicao
							 [, ocorrencia
							 [, opçaãodematch]]]]);
							 
SELECT * FROM employees;

SELECT e.phone_number, REGEXP_REPLACE(e.phone_number, '\.', '-') phone_number2 FROM employees e;

-- REGEXP_SUBSTR
REGEXP_SUBSTR(string, 
               padrão 
               [, posicao
               [, ocorrencia
               [, opçaãodematch]]]]);
							 
DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT e.employee_id, e.first_name || ' ' || e.last_name name, e.salary FROM employees e;

SELECT * FROM employees_copy;

SELECT e.name, REGEXP_SUBSTR(e.name, '^[A-Z][[:alpha:]]+ ') AS first_name, REGEXP_SUBSTR(e.name, ' [A-Z]+[[:alpha:]]+$') AS last_name
  FROM employees_copy e;

-- REGEXP_COUNT
SELECT e.name, REGEXP_COUNT(e.name, 'a|e|i|o|u', 1, 1) vogais FROM employees_copy e;
