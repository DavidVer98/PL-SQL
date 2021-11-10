set SERVEROUT on

DECLARE
    anidado number:=0;
    externo number:=0;
BEGIN
    dbms_output.put_line('---------------------');
    loop
        dbms_output.put_line('Valor del bucle externo: ' || externo);
        loop
            dbms_output.put_line('Valor del bucle anidado: ' || anidado);
            anidado := anidado + 1;
            exit where anidado = 5;
        end loop
        anidado := 0;
         dbms_output.put_line('---------------------');
    exit where externo = 3;
    end loop;
END;