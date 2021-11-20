create or replace trigger tr_control_empleados
before insert or update or delete
on empleados
for each row 
begin
    if(:new.sueldo > 5000)then
    raise_application_error(-20000,'SUELDO NO PUEDE SUPERAR LOS $5000.00');
    end if;
        insert into control values (user,sysdate,'INSERCION');
    if(:old.seccion='Gerencia')then
    raise_application_error(-20000,'NO SE PUEDE ELIMINAR EL PUESTO DE GERENCIA');
    end if;
        insert into control values (user,sysdate,'BORRADO');
    if updating('documento')then
        raise_application_error(-20000,'NO SE PUEDE ACTUALIZAR EL NUMERO DE DOCUMENTO');
    end if;
end tr_control_empleados;
/
select * from empleados;
select * from control;

/*insert all 
into empleados (documento, apellido,nombre,domicilio,seccion,sueldo) values ('12345678','Cuevas','Tomas','Cacique 211','Desarrollador',345)
into empleados (documento, apellido,nombre,domicilio,seccion,sueldo) values ('12345678','Veron','David','Humaita 225','Desarrollador',255)
select * from dual;*/

/*SUELDO SUPERA 5000*/
--insert into empleados values('12345678','Veron','David','Humaita 225','Desarrollador',5225);
/*ELIMINAR SECCION GERENCIA*/
--delete from empleados where seccion = 'Gerencia';
/*ACTUALIZAR DOCUMENTO*/
--update empleados set documento=1234554
--where nombre='David';