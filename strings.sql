set SERVEROUT on
DECLARE
    saludos2 varchar2(30) := '###Hola a todos ###'; 
    nombre  varchar2(20);
    direccion varchar2(30);
    detalles clob; 
    eleccion char(1);
BEGIN
    nombre:='pedro Perez';
    direccion := 'Calle primera no 1' ;
    detalles:='Este detalle de la variable clob que iniciamos en la 
    seccion declarativa, es una variable de gran almacenamiento'; 
    
    eleccion  := 'y';
    if eleccion = 'y' then
        dbms_output.put_line(UPPER(nombre)); --funcion UPPER convierte a MAY
        dbms_output.put_line(LOWER(direccion)); --funcion LOWER convierte a MIN
        dbms_output.put_line(INITCAP(nombre)); --funcion INITCAP convierte la primera letra a MAY
        dbms_output.put_line(SUBSTR(nombre,1,3)); --funcion SUBSTR substrae del string
        dbms_output.put_line(INSTR(nombre,'e')); --funcion INSTR busca posicion de una letra en un string y retorna su posicion
        dbms_output.put_line(RTRIM(saludos2,'#')); /**funcion RTRIM busca los primeros valores de la DERECHA que se pasan como parametro y lo borra **/
        dbms_output.put_line(LTRIM(saludos2,'#')); /**funcion RTRIM busca los primeros valores de la IZQUIERDA que se pasan como parametro y lo borra **/
        dbms_output.put_line(TRIM('#' from saludos2)); /**funcion TRIM busca los  valores  que se pasan como parametro y lo borra busca en la   izq y der **/
        dbms_output.put_line(detalles);
    end if;
  
END;