delete visitas;

  insert into visitas values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina',to_date('2020/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile',to_date('2020/02/13 11:08:10', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Juancito','JuanJosePerez@hotmail.com','Argentina',to_date('2020/07/02 14:12:00', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',to_date('2020/06/17 20:00:00', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',to_date('2020/02/08 20:05:40', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Juancito','JuanJosePerez@hotmail.com','Argentina',to_date('2020/07/06 18:00:00', 'yyyy/mm/dd hh24:mi:ss'));
 insert into visitas values ('Juancito','JuanJosePerez@hotmail.com','Argentina',to_date('2019/10/05 23:00:00', 'yyyy/mm/dd hh24:mi:ss'));
 
select * from visitas
order by fecha desc;

 select nombre,pais,extract(month from fecha) as mes
from visitas 
order by 2,3 desc;
--order by pais asc,extract(month from fecha) desc;


 select mail, pais
  from visitas
  where extract(month from fecha)=10
  order by 2;