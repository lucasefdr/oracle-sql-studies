-- FLASHBACK TABLE
DROP TABLE salary_history;

FLASHBACK TABLE salary_history TO BEFORE DROP;

SELECT * FROM salary_history;

-- Removendo a tabela da lixeira
-- PURGE TABLE tabela;

-- Removendo todos os objetos da lixeira
-- PURGE user_recyclebin;
