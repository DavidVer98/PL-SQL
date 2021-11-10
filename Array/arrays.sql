set SERVEROUT on
DECLARE
    type a_paises is varray(5) of varchar2(20);
    nombre a_paises;

BEGIN
    nombre := a_paises('Paraguay', 'Brasil', 'Argentina','Peru','Uruguay');
    for f in 1..5 loop
        dbms_output.put_line('Nombre:' || nombre(f);)
    end loop;

END