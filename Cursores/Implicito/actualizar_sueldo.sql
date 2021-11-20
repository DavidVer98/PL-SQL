/*Cursores Implicito*/
set SERVEROUT on  -- salida de datos por consola
DECLARE
    filas number(2);
BEGIN
    update empleados
    set sueldo = sueldo + 500 where sueldo >= 5000;
    if sql%NOTFOUND then
         dbms_output.put_line('=== No hay empleado disponible ==');
    elsif sql%FOUND then
        filas := sql%ROWCOUNT;
        dbms_output.put_line('=== Registros actualizados: ' || filas || ' ==='   );
    end if;

END;
/
zselect * from empleados;