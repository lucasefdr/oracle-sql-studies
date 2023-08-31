SELECT e.first_name,
       e.last_name,
       e.salary,
       e.job_id,
       fnc_consulta_titulo_cargo(pjob_id => e.job_id)
  FROM employees e;
