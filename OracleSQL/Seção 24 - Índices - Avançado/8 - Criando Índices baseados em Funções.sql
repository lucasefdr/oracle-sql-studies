--
-- Oracle SQL Avançado 
--
-- Seção 24 - Índices
--
-- Aula 8 - Criando Índices baseados em Funções 

-- Criando um Índice para a coluna first_name

DROP INDEX employees_first_name_idx;

CREATE INDEX employees_first_name_idx ON employees (first_name);

SELECT *
FROM   employees
WHERE  UPPER(first_name) = 'DANIEL';

-- Analize o custo do comando no plano de execução

-- Criando um Índice baseado em Função para a coluna first_name

CREATE INDEX employees_upper_first_name_idx ON employees (UPPER(first_name));

-- Criando Índices baseados em Funções 

SELECT *
FROM   employees
WHERE  UPPER(first_name) = 'DANIEL';

-- Analize o custo do comando no plano de execução