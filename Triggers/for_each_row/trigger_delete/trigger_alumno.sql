create or replace trigger borraralumnos
before delete
on alumno
for each row
    begin
    insert into control values(user,sysdate);
end borraralumnos;
/
select * from control;
delete from alumno where curso=5;

