drop table empleados;

create table empleados(
    documento char(8),
    nombre varchar2(20),
    apellido varchar2(20),
    sueldo number(6,2),
    fechaingreso date
);


insert into empleados values('1111111','David','Perez',250,to_date('10/10/2010','dd/mm/yyyy'));
insert into empleados values('1111112','Jose','Sanchez',100,to_date('10/10/2011','dd/mm/yyyy'));
insert into empleados values('1111113','Pablo','Vera',300,to_date('10/10/2018','dd/mm/yyyy'));
insert into empleados values('1111114','Diego','Gonzales',400,to_date('10/10/2020','dd/mm/yyyy'));

select * from empleados;