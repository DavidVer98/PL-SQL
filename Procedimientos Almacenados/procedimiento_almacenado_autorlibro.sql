drop table tabla1;

create table tabla1( 
   titulo varchar2(40),
   precio number(6,2)
  );
/
select * from tabla1;
/
create or replace procedure autorlibro(atitulo in varchar2)

as 
    v_autor varchar2(20);
    BEGIN
        /*Selecciona la columna autor de la tabla libros y lo guarda en v_autor*/
        select autor into v_autor from libros where titulo = atitulo;
        insert into tabla1
        select titulo, precio from libros
        where autor = v_autor;
    END autorlibro;
/

execute autorlibro('El quijote');
execute autorlibro('Cien años');

/

select * from tabla1;