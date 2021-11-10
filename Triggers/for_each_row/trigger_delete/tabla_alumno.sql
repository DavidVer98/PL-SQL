create table alumno(
    legajo varchar2(10),
    documento char(8),
    nombre varchar2(20),
    curso integer,
    materia varchar2(20),
    nota number(3,2)
)

select * from alumno;
insert into alumno values('A123',222222,'David',5,'Matematica',9.9);
insert into alumno values('A234',233333,'Ana',5,'Matematica',4.25);
insert into alumno values('A645',244444,'Fabia',5,'Lengua',8.1);
insert into alumno values('A457',255555,'Pepe',5,'Lengua',7);