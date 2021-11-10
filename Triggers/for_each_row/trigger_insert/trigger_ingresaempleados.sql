/*Borrar los datos de la tabla control*/
--truncate table control;

create or replace trigger tr_ingresaempleados
before insert 
on empleados
for each row
    begin 
        insert into control values(user,sysdate);
end ingresarempleado;

--INSERTS
 insert into empleados values('22333444','ACOSTA','Ana','Secretaria');
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria');
 insert into empleados values('22999000','FUENTES','Federico','Sistemas');
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria');
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas');
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria');