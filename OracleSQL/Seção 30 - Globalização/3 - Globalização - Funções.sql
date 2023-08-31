--
-- Oracle SQL Avançado 
--
-- Seção 30 - Globalização Tratamento de Datas e diferentes Time Zones
--
-- Aula 3 - Globalização - Funções

-- Globalização - Funções

-- Conectar como usuário SYS

-- Consultar a UTC do banco de dados 

SELECT DBTIMEZONE
FROM dual;

-- Alterar a UTC do banco de dados 

-- Conectar como usuario SYS 

ALTER DATABASE SET TIME_ZONE='-03:00'; 

-- Shutdown da Instancia
-- Startup da Instancia

-- DBTIMEZONE - Retorna a UTC do banco de dados

SELECT DBTIMEZONE
FROM dual;

- SESSIONTIMEZONE - Retorna o Timezone do banco de dados

SELECT SESSIONTIMEZONE
FROM dual;

-- Conectar como usuário HR

-- SYSDATE - Retorna a data (Tipo DATE) do servidor de banco de dados

SELEct sysdate
FROM dual;

-- SYSTIMESTAMP - Retorna a data (tipo TIMESTAMP) do servidor de banco de dados

SELEct systimestamp
FROM dual;

-- CURRENT_DATE - Retorna a data da sessão do usuário do banco de dados (Tipo DATE) 

SELECT CURRENT_DATE
FROM dual;

-- CURRENT_TIMESTAMP - Retorna a data da sessão do usuário do banco de dados (Tipo TIMESTAMP WITH TIME ZONE) 

SELECT CURRENT_TIMESTAMP
FROM   dual;

-- LOCALTIMESTAMP -  Retorna um timestamp local sem fuso horário da sessão do usuário (Tipo TIMESTAMP) 

SELECT LOCALTIMESTAMP
FROM dual;

-



