--Aumentar Sueldo del empleado
create or replace procedure aumentasueldo(anio in number, porcentaje in number)

as 
    BEGIN
        update empleados set sueldo = sueldo + ( sueldo * porcentaje/100) 
        where (extract(year from current_date) - extract(year from fechaingreso) > anio );

    end aumentasueldo;
    
--Ingresar nuevos empleado
/*-----------------------------------------------------------------------------------------*/
create or replace procedure ingresarempleado(docu char, nombre varchar2, apellido varchar2)
as
    BEGIN
        insert into empleados values(docu,nombre,apellido, null, null); 
    END ingresarempleado;