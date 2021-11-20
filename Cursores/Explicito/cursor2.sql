set SERVEROUT on;

DECLARE
v_empleados empleados%rowtype;

BEGIN
for v_empleados in (select * from empleados) loop
    dbms_output.put_line(v_empleados.nombre || ', Sueldo:' || v_empleados.sueldo);
end loop;
END;

/*----------------------------------------------------------*/

DECLARE

BEGIN

update empleados set sueldo = 10000
where documento = 23333333;

if sql%notfound then
    dbms_output.put_line('No se actualizaron los registros');
end if;

END;