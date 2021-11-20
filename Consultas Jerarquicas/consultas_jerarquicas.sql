select nombre, id_puesto, level
from empleados
start with nombre = 'Miguel Gonzales'
connect by prior id_empleado = id_supervisor;