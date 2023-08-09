PL/SQL Developer Test script 3.0
30
DECLARE
  TYPE t_mlf_notafiscal_perf IS TABLE OF mlf_notafiscal_perf%ROWTYPE;
  v_mlf_notafiscal_perf t_mlf_notafiscal_perf := t_mlf_notafiscal_perf();
  v_idx                 NUMBER := 1;

  CURSOR c_mlf_notafiscal_perf IS
    SELECT *
      FROM mlf_notafiscal_perf;
BEGIN

  OPEN c_mlf_notafiscal_perf;

  LOOP
    FETCH c_mlf_notafiscal_perf BULK COLLECT
      INTO v_mlf_notafiscal_perf LIMIT 1000;
  
    EXIT WHEN v_mlf_notafiscal_perf.COUNT = 0;
  
  
    FORALL x IN v_mlf_notafiscal_perf.FIRST .. v_mlf_notafiscal_perf.LAST
      UPDATE mlf_notafiscal_perf nf
         SET nf.usulancto = 'C5LUCASF'
       WHERE nf.numeronf = v_mlf_notafiscal_perf(x).numeronf
         AND nf.serienf = v_mlf_notafiscal_perf(x).serienf
         AND nf.nroempresa = v_mlf_notafiscal_perf(x).nroempresa;
  
  END LOOP;
  
  CLOSE c_mlf_notafiscal_perf;
END;
0
0
