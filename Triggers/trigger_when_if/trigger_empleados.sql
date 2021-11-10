--select * from empleados;
--select * from control;
 
 /*Trigger que actualiza el sueldo de los empleados*/
 create or replace trigger tr_aumenasueldo
 before update of sueldo
 on empleados
 for each row when (new.sueldo > old.sueldo)
 begin
    insert into control values(user,sysdate, :old.documento, :old.sueldo, :new.sueldo);
 end tr_aumentarsueldo;
 /
 update empleados set sueldo = 525
 where documento = 22333444;
 
 ---------------------------------------------
  /*Trigger que transforma a mayusculas el apellido 
  y si el campo sueldo esta null o asgina a 0 */
 
 create or replace trigger tr_actualizardatos
 before insert 
 on empleados
 for each row
begin
    :new.apellido :=upper(:new.apellido);
    if :new.sueldo is null then
        :new.sueldo :=0;
    end if;
end tr_actualizardatos;
/
--delete from empleados 
--where nombre='nicolas';

insert into empleados values (12345678,'Cuevas','nicolas','Front-end',null);


 select * from empleados;
 select * from control;
 