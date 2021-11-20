  drop table libros;
 create table libros(
  titulo varchar2(40) not null,
  autor varchar2(20) default 'Desconocido',
  editorial varchar2(20),
  edicion date,
  precio number(6,2)
 );
 
  insert into libros values('El aleph','Borges','Emece','10/10/1980',25.33);
 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI','05/05/2000',50.65);
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','08/09/2000',19.95);
 insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI','02/04/2000',45);
 
select titulo, extract( year from edicion) as Año from libros;
select titulo, extract( month from edicion) as Año from libros;
select titulo, (extract(year from sysdate)- extract( year from edicion)) as Añosdesalida from libros;
select titulo, extract( year from edicion) as Año from libros
where  extract( year from edicion)=2000;