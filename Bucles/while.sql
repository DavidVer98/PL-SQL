set SERVEROUT on

DECLARE
    numero1 integer := 0;
BEGIN
    while numero1 < 5 loop
        numero1 := numero1 + 1;
        dbms_output.put_line('Numero:' || numero1);
    end loop;
    dbms_output.put_line('Numero final:' || numero1);

END;