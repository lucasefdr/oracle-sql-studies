rem PL/SQL Developer Test Script

set feedback off
set autoprint off

rem Declare variables
variable vNota1 varchar2(2000)

rem Set variables
begin
  :vNota1 := null;
end;
/

rem Execute PL/SQL Block
DECLARE
  vNota1 NUMBER(11, 2) := 7.0;
  vNota2 NUMBER(11, 2) := 5.0;
  vNota3 NUMBER(11, 2) := 9.0;
  vNota4 NUMBER(11, 2) := 9.0;
  vMedia NUMBER(11, 2);
BEGIN
  -- Regra de precedência com o parenteses
  vMedia := (vNota1 + vNota2 + vNota3 + vNota4) / 4;
  DBMS_OUTPUT.PUT_LINE('Média: ' || vMedia);

  -- Estrutura IF para ver se o aluno passou de ano
  IF (vMedia >= 6) THEN
    DBMS_OUTPUT.PUT_LINE('O aluno está aprovado');
  ELSIF (vMedia >= 5) THEN
    DBMS_OUTPUT.PUT_LINE('O aluno está de recuperação');
  ELSE
    DBMS_OUTPUT.PUT_LINE('O aluno está reprovado');
  END IF;
END;
/

rem Print variables
print vNota1
