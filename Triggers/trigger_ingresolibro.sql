create or replace trigger tr_ingresolibros
/*El trigger se dispara cuando se inserta nuevos datos en la tabla libros*/
before insert
on libros

begin
    insert into control values(user,sysdate);
end tr_ingresolibros;

/
--insert into libros values(12,'Psicoanalista','Juan Tofler','Punisher',200);

select * from control;
--select * from libros;

select * from user_triggers where trigger_name = 'TR_INGRESELIBROS';