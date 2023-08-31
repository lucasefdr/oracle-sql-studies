SELECT * FROM employees WHERE UPPER(first_name) = 'LUCAS';

-- Criação de INDEX com função
CREATE INDEX emp_upper_fn_ix ON employees(UPPER(first_name));
SELECT * FROM employees WHERE UPPER(first_name) = 'LUCAS';

-- Visibilidade do INDEX
CREATE BITMAP INDEX emp_upper_fn_ix2 ON employees(UPPER(first_name));

ALTER INDEX emp_upper_fn_ix INVISIBLE;
ALTER INDEX emp_upper_fn_ix2 INVISIBLE;
ALTER INDEX emp_upper_fn_ix VISIBLE;
