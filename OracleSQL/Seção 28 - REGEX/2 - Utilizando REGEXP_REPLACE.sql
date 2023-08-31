--
-- Oracle SQL Avançado 
--
-- Seção 28 - Expressões Regulares
--
-- Aula 3 - Utilizando REGEXP_REPLACE
--

-- Utilizando REGEXP_REPLACE

-- Conectar como HR

-- Comparação case sensitivo (default), a partir da posição 1 para todas combinações encontradas

SELECT phone_number, REGEXP_REPLACE(phone_number, '\.','-') as phone
FROM employees;

-- Comparação case sensitivo, a partir da posição 1 para todas combinações encontradas

SELECT phone_number, REGEXP_REPLACE(phone_number, '\.','-',1,0,'c') as phone
FROM employees;

-- Comparação case não sensitivo (default), a partir da posição 1 para todas combinações encontradas

SELECT phone_number, REGEXP_REPLACE(phone_number, '\.','-',1,0,'i') as phone
FROM employees;