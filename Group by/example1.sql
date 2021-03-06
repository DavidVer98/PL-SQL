 create table libros(
  codigo number(5),
  titulo varchar2(40),
  autor varchar2(30) default 'Desconocido',
  editorial varchar2(15),
  precio number(5,2),
  cantidad number(3),
  primary key(codigo)
 );


  insert into libros
  values(100,'El aleph','Borges','Planeta',15,null);
 insert into libros
  values(234,'Martin Fierro','Jose Hernandez','Emece',22.20,200);
 insert into libros
  values(354,'Antologia poetica',default,'Planeta',null,150);
 insert into libros
  values(478,'Aprenda PHP','Mario Molina','Emece',18.20,null);
 insert into libros
  values(512,'Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',28,100);
 insert into libros
  values(643,'Manual de PHP', default, 'Siglo XXI',31.80,120);
 insert into libros
  values(646,'Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
 insert into libros
  values(753,'Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
 insert into libros
  values(889,'Alicia en el pais de las maravillas','Lewis Carroll','Paidos',22.50,200);
 insert into libros
  values(893,'PHP de la A a la Z',null,null,55.90,0);


  /* Queremos saber la cantidad de libros de cada editorial, utilizando la cláusula "group by": */

   select editorial, count(*)
  from libros
  group by editorial;

  /* Obtenemos la cantidad libros con precio no nulo de cada editorial: */

   select editorial, count(precio)
  from libros
  group by editorial;


  /* Obtenemos el máximo y mínimo valor de los libros agrupados por editorial, en una sola sentencia: */

  select editorial,
  max(valor) as mayor,
  min(valor) as mínimo
  from libros
  group by editorial;

  /* Calculamos el promedio del valor de los libros agrupados por editorial: */

  select editorial,
  avg(precio) as Promedio
  from libros
  group by editorial;

  /*Es posible limitar la consulta con "where". Vamos a contar y agrupar por editorial 
  considerando solamente los libros cuyo precio es menor a 30 pesos:*/

  select editorial, count(precio)
  from libros
  where precio < 30
  group by editorial; 