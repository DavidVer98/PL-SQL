 drop table visitantes;

 create table visitantes(
  nombre varchar2(30),
  edad number(2),
  sexo char(1) default 'f',
  domicilio varchar2(30),
  ciudad varchar2(20) default 'Cordoba',
  telefono varchar2(11),
  mail varchar2(30) default 'no tiene',
  montocompra number(6,2)
 );

  insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

  /*Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)*/

  select ciudad, count(ciudad) as "Población"
  from visitantes
  group by ciudad;

  /*Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas) */
  
  select telefono, count(telefono)
  from visitantes
  where telefono is not null
  group by telefono;

  /* Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)
Note que los registros con valor nulo en el campo "sexo" se procesan como un grupo diferente.*/

select  sexo ,sum(montocompra)
from visitantes
group by visitantes;

/* Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)*/

  select sexo, ciudad,
max(montocompra) as Maximo,
min(montocompra) as Minimo
from visitantes
group by sexo, ciudad
order by ciudad;

/* Calcule el promedio del valor de compra agrupados por ciudad (4 filas) */

select ciudad, avg(montocompra) as "Promedio de compras"
from visitantes
group by ciudad;

/* Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas) */

select ciudad, count(ciudad) as "Contador"
from visitantes
where mail <> 'no tiene'
group by ciudad;