DECLARE
  vEntrada NUMBER;
BEGIN
  vEntrada := &pEntrada;

  CASE vEntrada
    WHEN 1 THEN
      DBMS_OUTPUT.put_line('Segunda');
    WHEN 2 THEN
      DBMS_OUTPUT.put_line('Terça');
    WHEN 3 THEN
      DBMS_OUTPUT.put_line('Quarta');
    WHEN 4 THEN
      DBMS_OUTPUT.put_line('Quinta');
    WHEN 5 THEN
      DBMS_OUTPUT.put_line('Sexta');
    WHEN 6 THEN
      DBMS_OUTPUT.put_line('Sábado');
    WHEN 7 THEN
      DBMS_OUTPUT.put_line('Domingo');
    ELSE
      DBMS_OUTPUT.put_line('Entrada inválida');
  END CASE;
END;
