 --borrar tablas (si existen)
 drop table libros;
 drop table control;

 --crear tablas
 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );
 create table control(
  usuario varchar2(30),
  fecha date
 );