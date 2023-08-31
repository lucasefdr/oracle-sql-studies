DECLARE
  vNumInicial NUMBER := 1;
  vNumFinal   NUMBER := 20;
  vNum        NUMBER;
BEGIN
  vNum := vNumInicial;
  LOOP
    DBMS_OUTPUT.put_line('Número: ' || vNum);
		
    EXIT WHEN vNum = vNumFinal; -- saia quando...
    vNum := vNum + 1;
  END LOOP;

  DBMS_OUTPUT.new_line;

  FOR i IN REVERSE 1 .. 10 LOOP
    DBMS_OUTPUT.put_line(i);
  END LOOP;

  DBMS_OUTPUT.new_line;

  vNum := 1;

  WHILE vNum <= vNumFinal LOOP
    DBMS_OUTPUT.put_line('Número: ' || vNum);
		
    EXIT WHEN vNum = vNumFinal; -- saia quando...
    vNum := vNum + 1;
  END LOOP;
END;
