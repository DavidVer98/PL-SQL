set SERVEROUT on;

-- Variable compuesta basada en una tabla

DECLARE
    reg_productos productos%rowtype;
BEGIN
    select * into reg_productos from productos
    where codigo = 3;
    dbms_output.put_line('CARACTERISTICA DEL PRODUCTO');
    dbms_output.put_line('Codigo de producto: '|| reg_productos.Codigo);
    dbms_output.put_line('Articulo :'|| reg_productos.nombre);
    dbms_output.put_line('Precio :' || reg_productos.precio);
    dbms_output.put_line('Serial :'|| reg_productos.codigo_fabricante);
END;
