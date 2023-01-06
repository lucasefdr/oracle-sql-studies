DECLARE
  employees_record employees%ROWTYPE;
BEGIN
  prc_consulta_empregado(100,
                         employees_record.first_name,
                         employees_record.last_name,
                         employees_record.email,
                         employees_record.phone_number,
                         employees_record.hire_date,
                         employees_record.job_id,
                         employees_record.salary,
                         employees_record.commission_pct,
                         employees_record.manager_id,
                         employees_record.department_id);

  dbms_output.put_line('Employee full name: ' ||
                       employees_record.first_name || ' ' ||
                       employees_record.last_name);
END;
