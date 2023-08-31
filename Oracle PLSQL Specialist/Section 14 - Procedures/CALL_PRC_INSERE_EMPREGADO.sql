BEGIN
  prc_aumenta_salario_empregado(pnemployee_id => 207, pnpercentural => 30);
END;

SELECT * FROM employees a WHERE a.first_name = 'LROSA';

DECLARE
  employees_record employees%ROWTYPE;

BEGIN
  prc_consulta_empregado(pemployee_id    => 207,
                         pfirst_name     => employees_record.first_name,
                         plast_name      => employees_record.last_name,
                         pemail          => employees_record.email,
                         pphone_number   => employees_record.phone_number,
                         phire_date      => employees_record.hire_date,
                         pjob_id         => employees_record.job_id,
                         psalary         => employees_record.salary,
                         pcommission_pct => employees_record.commission_pct,
                         pmanager_id     => employees_record.manager_id,
                         pdepartment_id  => employees_record.department_id);

  dbms_output.put_line('First name: ' || employees_record.first_name);
  dbms_output.put_line('Last name: ' || employees_record.last_name);
  dbms_output.put_line('Email: ' || employees_record.email);
END;
