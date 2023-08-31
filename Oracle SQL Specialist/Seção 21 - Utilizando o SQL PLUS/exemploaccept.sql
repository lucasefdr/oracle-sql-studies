ACCEPT pnome PROMPT 'Digite o nome do empregado:'
SELECT employee_id, first_name, last_name
FROM employees
WHERE UPPER(first_name) = UPPER('&pnome');