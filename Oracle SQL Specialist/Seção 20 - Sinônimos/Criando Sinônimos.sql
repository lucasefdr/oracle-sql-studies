--
-- Seção 20 
-- Criando Sinônimos
--
-- Aula 1 - Criando Sinônimos
--

-- Criando Sinonimos Privados

CREATE SYNONYM departamentos
FOR departments;

CREATE SYNONYM dept
FOR departments;

-- Utilizando Sinônimos

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Removendo Sinônimos

DROP SYNONYM departamentos;

DROP SYNONYM dept;

-- Criando Sinônimos Públicos para Tabelas em outro Schema

-- Conecte-se como SYS

CREATE PUBLIC SYNONYM departamentos
FOR hr.departments;

CREATE PUBLIC SYNONYM dept
FOR hr.departments;

-- Conecte-se como SYS

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Conecte-se como HR

SELECT *
FROM departamentos;

SELECT *
FROM dept;

-- Removendo Sinônimos Públicos

-- Conecte-se como SYS

DROP PUBLIC SYNONYM departamentos;

DROP PUBLIC SYNONYM dept;