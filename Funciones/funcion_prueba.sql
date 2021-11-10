create or replace function f_prueba(valor number)
return number
is 
    begin 
        return valor*2;
end;
/
/*se crea la pseudo tabla dual para mostrar el resultado*/
select f_prueba(4) as total from dual ;


/*---------------------------------------------------*/
create or replace function f_costo(valor number)
return varchar
is 
    costo varchar(20);
    begin
        costo := '';
        if valor <= 500 then
            costo:='Economico';
        else
            costo:='Caro';
        end if;
        return costo;
end;
/

select titulo,autor,precio, f_costo(precio) from libros;