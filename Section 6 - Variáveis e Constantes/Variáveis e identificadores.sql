DECLARE
  -- Quoted identifier
  "vNumero" NUMBER := 1;

  -- String
  vTexto VARCHAR2(2000) := 'Texto';

  -- Date
  vData DATE := '31/12/1997';

  -- Numeric
  vValor1 NUMBER := 1;
  vValor2 NUMBER := 1.8;
  vValor3 NUMBER := 112E10;
	
	-- Constant
	vPi CONSTANT NUMBER := 3.14;

BEGIN
  DBMS_OUTPUT.PUT_LINE("vNumero");
  DBMS_OUTPUT.PUT_LINE(vTexto);
  DBMS_OUTPUT.PUT_LINE(vData);
  DBMS_OUTPUT.PUT_LINE(vValor1);
  DBMS_OUTPUT.PUT_LINE(vValor2);
  DBMS_OUTPUT.PUT_LINE(vValor3);
	DBMS_OUTPUT.PUT_LINE(vPi);
	-- Forçando erro de constant
	-- vPi := 3.141;
	
END;
