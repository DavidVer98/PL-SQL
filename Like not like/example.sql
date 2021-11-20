  drop table empleados;

 create table empleados(
  nombre varchar2(30),
  documento char(8) not null,
  domicilio varchar2(30),
  fechaingreso date,
  seccion varchar2(20),
  sueldo number(6,2),
  primary key(documento)
 );

 insert into empleados
  values('Juan Perez','22333444','Colon 123','08/10/1990','Gerencia',900.50);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','18/12/1995','Secretaria',590.30);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','15/05/2005','Sistemas',790);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','12/02/1999','Secretaria',550);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','22/09/2002','Contaduria',630.70);
 insert into empleados
  values('Yolanda perez','35111222','Colon 180','08/10/1990','Administracion',400);
 insert into empleados
  values('Rodolfo perez','35555888','Coronel Olmedo 588','28/05/1990','Sistemas',800);
   insert into empleados
  values('Paco Timon','15255480','Bonifacio Obando 588','28/05/1998','Sistemas',450);

  /*Muestre todos los empleados con apellido "Perez" empleando el operador "like" (1 registro)
Note que no incluye los "perez" (que comienzan con minúscula).*/

select * from empleados
where nombre like '%Perez%';

/*Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)*/
select * from empleados
where domicilio like 'Co%';

/* Seleccione todos los empleados cuyo documento finalice en 0 ó 4 (2 registros)*/

select * from empleados
where documento like '%0' or documento like '%4';

/*Seleccione todos los empleados cuyo documento NO comience con 2 y cuyo nombre finalice en "ez" (1 registro)*/
select * from empleados
where documento not like '2%'
and nombre like '%ez';

/*Recupere todos los nombres que tengan una "G" o una "J" en su nombre o apellido (3 registros)*/
select * from empleados
where nombre like '%G%'
or nombre like '%J%';

/*Muestre los nombres y sección de los empleados que pertenecen a secciones que comiencen con "S" o "G" y tengan 8 caracteres (3 registros)*/
select nombre, seccion from empleados
where seccion like '%S_______%'
or seccion like '%G________%';

/* Muestre los nombres y sección de los empleados que pertenecen a secciones que NO comiencen con "S" (3 registros)*/
select nombre, seccion from empleados
where seccion not like 'S%';

/* Muestre todos los nombres y sueldos de los empleados cuyos sueldos se encuentren entre 500,00 y 599,99 empleando "like" (2 registros) */

select nombre, sueldo from empleados
where sueldo like '5__%';

/*  Muestre los empleados que hayan ingresado en la década del 90 (5 registros) */

select * from empleados
where extract(YEAR from fechaingreso) like '1990';


/*  Agregue 50 centavos a todos los sueldos que no tengan centavos (4 registros) y verifique recuperando todos los registros. */
 update empleados set sueldo = sueldo + 50
 where sueldo not like '%,%';

 /* Elimine todos los empleados cuyos apellidos comiencen con "p" (minúscula) (2 registros) */

  delete from empleados
  where nombre like '% p%';