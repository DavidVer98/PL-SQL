create or replace function f_datoempleado(v_documento in number)
return sys_refcursor
is
    v_ref sys_refcursor;
BEGIN
    open v_ref for select * from empleados
    where documento = v_documento;
    return v_ref;
END;
/
var rc1 refcursor;
exec :rc1:=f_datoempleado(22222222);
print rc1;

