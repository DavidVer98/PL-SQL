 drop table medicamentos;
 create table medicamentos(
  codigo number(5),
  nombre varchar2(20),
  laboratorio varchar2(20),
  precio number(5,2),
  cantidad number(3),
  primary key(codigo)
 );
 
insert into medicamentos values(100,'Sertal','Roche',5.2,100);
insert into medicamentos values(102,'Buscapina','Roche',4.10,200);
insert into medicamentos values(205,'Amoxidal 500','Bayer',15.60,100);
insert into medicamentos values(230,'Paracetamol 500','Bago',1.90,200);
insert into medicamentos values(345,'Bayaspirina','Bayer',2.10,150); 
insert into medicamentos values(347,'Amoxidal jarabe','Bayer',5.10,250);

select * from medicamentos;

select codigo,nombre from medicamentos
where laboratorio='Roche' and precio < 5;

select * from medicamentos
where laboratorio <> 'Bayer' and cantidad <>100;

select * from medicamentos
where precio >=2 and precio <=5;

delete medicamentos 
where laboratorio = 'Bayer' and precio > 10;

update medicamentos set cantidad = 200
where laboratorio='Roche' and precio > 5;

