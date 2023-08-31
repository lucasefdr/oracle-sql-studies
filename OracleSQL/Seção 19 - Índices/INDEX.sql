DROP INDEX emp_name_ix;
DROP INDEX employees_name_idx;
DROP INDEX employees_last_name_idx;

SELECT * FROM employees e WHERE e.last_name = 'Himuro';

-- INDEX
CREATE INDEX employees_last_name_idx
ON employees(last_name);
