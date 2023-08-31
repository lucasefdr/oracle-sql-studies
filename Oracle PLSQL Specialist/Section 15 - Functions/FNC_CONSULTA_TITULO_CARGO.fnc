CREATE OR REPLACE FUNCTION fnc_consulta_titulo_cargo(pjob_id IN jobs.job_id%TYPE)
  RETURN VARCHAR2 IS
  vjob_title jobs.job_title%TYPE;
BEGIN

  SELECT j.job_title INTO vjob_title FROM jobs j WHERE j.job_id = pjob_id;

  RETURN vjob_title;
EXCEPTION
  WHEN no_data_found THEN
    raise_application_error(-20001, 'Cargo não existe: ' || pjob_id);
  WHEN OTHERS THEN
    raise_application_error(-20002,
                            'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;
