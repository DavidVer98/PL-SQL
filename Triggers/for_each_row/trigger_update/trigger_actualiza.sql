--truncate table control
create or replace trigger tr_actualizar
on update empleados
for each row
    begin
    insert into control values(user,system);

end tr_actualizar;