  drop table medicamentos;

 create table medicamentos(
  codigo number(5),
  nombre varchar2(20),
  laboratorio varchar2(20),
  precio number(6,2),
  cantidad number(3),
  fechavencimiento date not null,
  numerolote number(6) default null,
  primary key(codigo)
 );

 insert into medicamentos
  values(120,'Sertal','Roche',5.2,1,'01/02/2015',123456);
 insert into medicamentos 
  values(220,'Buscapina','Roche',4.10,3,'01/02/2016',null);
 insert into medicamentos 
  values(228,'Amoxidal 500','Bayer',15.60,100,'01/05/2017',null);
 insert into medicamentos
  values(324,'Paracetamol 500','Bago',1.90,20,'01/02/2018',null);
 insert into medicamentos 
  values(587,'Bayaspirina',null,2.10,null,'01/12/2019',null); 
  insert into medicamentos 
  values(789,'Amoxidal jarabe','Bayer',null,null,'15/12/2019',null); 

  /* Muestre la cantidad de registros empleando la función "count(*)" (6 registros) */
  select count(*) as "total registros" from medicamentos;

  /* Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros) */
   select count(laboratorio)
   from medicamentos;

/* Cuente la cantidad de medicamentos que tienen precio y cantidad, con alias (5 y 4 respectivamente) */
    select count(precio) as "Con precio",
  count(cantidad) as "Con cantidad"
  from medicamentos;

  /* Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B" (2 registros) */
  select count(nombre) from medicamentos
  where laboratorio like 'B%';

  /* Cuente la cantidad de medicamentos con número de lote distinto de "null" (1 registro) */
  select count(numerolote) from medicamentos
  where numerolote is not null;