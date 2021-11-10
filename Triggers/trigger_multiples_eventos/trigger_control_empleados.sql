create or replace trigger tr_control_empleados
before insert or update or delete
on empleados
    begin
    if inserting then
        insert into control_empleado values(user,sysdate, 'Ingreso');
    end if;
    if deleting then
        insert into control_empleado values(user,sysdate,'Borrado');
    end if;
    if updating then
        insert into control_empleado values(user,sysdate,'Actualizacion');
    end if;
end tr_control_empleados;
/

select * from empleados;
select * from control_empleado;

--insert
insert into empleados values(99999,'GONZALES','Jose','Soporte');
--update
update empleados set seccion = 'Desarrollador'
where nombre = 'David';
--delete
delete from empleados 
where documento = 99999;
