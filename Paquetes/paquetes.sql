set SERVEROUT on;


/*Encabezado*/
--CREACION DE ESPECIFICACION DE PAQUETE
create or replace package los_productos as
procedure caracteristicas(v_codigo productos.codigo%type);
--funcion
function f_precio(v_codigo int)
return number;

end los_productos;
/
--CREACION DE BODY DE PAQUETE
create or replace package body los_productos as
procedure caracteristicas(v_codigo productos.codigo%type) is
    v_producto productos.nombre%type;
    v_precio productos.precio%type;
begin
    select nombre, precio into v_producto, v_precio
    from productos where codigo = v_codigo;
    dbms_output.put_line('Articulo ' || v_producto);
    dbms_output.put_line('Precio ' || v_precio);
end caracteristicas;
end los_productos;

/
begin
    los_productos.caracteristicas(3);
end;
/

select los_productos.f_precio(3) from dual;
