CREATE OR REPLACE PROCEDURE PRC_FETCH_EMPRESA_CD(pnNroEmpresa IN max_empresa.nroempresa%TYPE DEFAULT NULL) IS
  -- Declara cursor dinâmico
  TYPE tMaxEmpresa IS REF CURSOR;

  -- Atribui à uma variável o tipo de cursor criado a cima
  vcMaxEmpresa tMaxEmpresa;
  vrMaxEmpresa max_empresa%ROWTYPE;
  vsSQL        VARCHAR(600) := 'SELECT * FROM max_empresa emp WHERE 1 = 1';
BEGIN

  IF pnNroEmpresa IS NOT NULL THEN
    vsSQL := vsSQL || ' AND emp.nroempresa = :nroempresa';
    OPEN vcMaxEmpresa FOR vsSQL
      USING pnNroEmpresa;
  ELSE
    OPEN vcMaxEmpresa FOR vsSQL;
  END IF;

  DBMS_OUTPUT.PUT_LINE(vsSQL);

  LOOP
    -- Atribui a variável record o resultado do cursor
    FETCH vcMaxEmpresa
      INTO vrMaxEmpresa;

    EXIT WHEN vcMaxEmpresa%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Empresa: ' || vrMaxEmpresa.nroempresa || ' - Razão social: ' || vrMaxEmpresa.razaosocial);
  END LOOP;
  
  CLOSE vcMaxEmpresa;
END;
/
