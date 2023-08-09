-- Consultando objetos
SELECT *
  FROM user_objects a
 WHERE a.object_type IN ('PROCEDURE', 'FUNCTION');
 
-- Consultando código fonte
SELECT *
  FROM user_source a
 WHERE a.type IN ('PROCEDURE', 'FUNCTION');
 
-- Consultando erros
SELECT *
  FROM user_errors a
 WHERE a.type IN ('PROCEDURE', 'FUNCTION');

