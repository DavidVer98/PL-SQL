drop table empleados;
create table empleados (
id_empleado int not null primary key,
nombre varchar(20) not null,
id_puesto char(20),
id_supervisor int null
);
insert into empleados values(100,'Miguel Gonzales','PRESIDENTE',null);           
insert into empleados values(101,'Federico Antillana','VICE_PRESIDENTE',100);
insert into empleados values(102,'MIguel Montero','GERENTE_GRAL',100);
insert into empleados values(103,'Manuel Saldaños','IT_GERENTE',102);
insert into empleados values(104,'Ana Montesinos','SOPORTE_IT',103);
insert into empleados values(105,'Manuel Figueroa','SOPORTE_IT',103);
insert into empleados values(106,'Eliana Sandoval','SOPORTE_IT',103);
insert into empleados values(107,'Iluminada Contreras','SOPORTE_IT',103);
insert into empleados values(108,'Manuela Condado','SECRETARIA',101);
insert into empleados values(109,'Emilia Cortinez','SECRETARIA',102);
insert into empleados values(110,'Denia Soler','SECRETARIA',103);
insert into empleados values(111,'Barbara Eleonor','SECRETARIA',101);
insert into empleados values(112,'Fausto Melaneo','VENDEDOR',102);
insert into empleados values(113,'Adalberto Mirabal','VENDEDOR',102);
insert into empleados values(114,'Estelvina Zorrilla','VENDEDORA',102);
insert into empleados values(115,'Mireya Matos','ASISTENTE_SECRETARIO',108);
insert into empleados values(116,'Elena Martinez','ASISTENTE_SECRETARIO',109);