-- Cargar el archivo 'usuarios.csv' desde HDFS, usando comas como delimitador entre columnas.
-- Definir los campos con sus respectivos tipos de datos: 'nombre' como cadena de caracteres (chararray),
-- 'edad' como entero (int), 'localidad' como cadena de caracteres y 'publicaciones' como entero.
usuarios = LOAD 'usuarios.csv' USING PigStorage(',') AS (nombre:chararray, edad:int, localidad:chararray, publicaciones:int);

-- Mostrar el contenido completo de la relación 'usuarios' para verificar que los datos se hayan cargado correctamente.
DUMP usuarios;

-- Filtrar los registros de la relación 'usuarios' para obtener solo aquellos que tienen
-- más de 10 publicaciones. Esto crea una nueva relación llamada 'usuarios_activos'.
usuarios_activos = FILTER usuarios BY publicaciones > 10;

-- Mostrar el contenido de 'usuarios_activos' para verificar que el filtro ha funcionado correctamente.
DUMP usuarios_activos;

-- Ordenar la relación 'usuarios_activos' en función del número de publicaciones en orden descendente
-- para obtener una nueva relación llamada 'usuarios_ordenados'.
usuarios_ordenados = ORDER usuarios_activos BY publicaciones DESC;

-- Mostrar el contenido de 'usuarios_ordenados' para verificar el orden de los datos.
DUMP usuarios_ordenados;

-- Almacenar los resultados de 'usuarios_activos' en un directorio de salida en HDFS llamado
-- '/user/hadoop/salida/usuarios_activos', usando comas como delimitador.
STORE usuarios_activos INTO '/user/hadoop/salida/usuarios_activos' USING PigStorage(',');

-- Almacenar los resultados de 'usuarios_ordenados' en un directorio de salida en HDFS llamado
-- '/user/hadoop/salida/usuarios_ordenados', también usando comas como delimitador.
STORE usuarios_ordenados INTO '/user/hadoop/salida/usuarios_ordenados' USING PigStorage(',');
