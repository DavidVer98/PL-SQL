set SERVEROUT on

DECLARE
    numero1 number(2);
BEGIN
    for numero1 in 10..12 loop
        dbms_output.put_line(numero1);
    end loop;
    dbms_output.put_line('--------------');
    for f in reverse 0..5 loop
        dbms_output.put_line(f);
    end loop;
END;