
select trigger_name, triggering_event, table_name, status
from user_triggers
where table_name='EMPLEADOS';

alter trigger tr_aumentasueldo enable;
alter trigger tr_aumentasueldo disable;

--select * from empleados;

/*update empleados set sueldo = 1000
where documento = '22333444' */