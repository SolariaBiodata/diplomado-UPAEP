# Comando *free*
Este comando es útil para monitorear la memoria física y de intercambio en el sistema, por lo que lo convierte en una herramienta útil para asegurarse de que se cuenta con la memoria necesaria para ejecutar ciertas actividades. 

## 1. Visualizar el uso de la memoria
Se ejecuta el comando *free*.
~~~
free
~~~
Obteniendo una salida, por ejemplo: 
~~~
               total        used        free      shared  buff/cache   available
Mem:         3003212      413276     2615840        7120      113756     2589936
Swap:        1048576           0     1048576
~~~
Si se quiere visualizar esta información en formato humanamente legible, se usa la opción *-h*: 
~~~
free -h
~~~
Obteniendo una salida, por ejemplo: 
~~~
               total        used        free      shared  buff/cache   available
Mem:           2.9Gi       403Mi       2.5Gi       7.0Mi       111Mi       2.5Gi
Swap:          1.0Gi          0B       1.0Gi
~~~
Como se observa, la información se muestra en columnas y éstas se interpretan para la línea de *mem* de la siguiente manera: 
- Total: Cantidad total de RAM física en el sistema.
- Usado: cantidad de RAM que se está usando actualmente por ejecución de programas y procesos. 
- Libre: Cantidad RAM física que no se está utilizando actualmente por ningún proceso y está libre para que sea asignada a nuevos procesos. 
- Compartida: Cantidad de memoria utilizada por el sistema de archivos temporal \(tmpfs\), último el cual es un sistema de archivos que almacena archivos en la memoria RAM  en lugar del disco duro. 
- Caché/buff: Cantidad de memoria que el sistema operativo usa para almacenar los datos que recientemente fueron utilizados para agilizar el acceso a ellos. 
- Disponible: Valor estimado de la cantidad de recursos de memoria que aún están disponibles para su uso. 

Por otro lado, *swap*, conocido como memoria virtual, es el mecanismo que le permite al sistema usar memoria adicional. Esto sucede cuando la RAM transfiere datos al espacio swap debido a que la RAM física está llena, lo que le permite al sistema seguir funcionando sin inconvenientes. Por lo que, al correr el comando *free*, podríamos visualizar: 
- Total: Tamaño total del archivo swap. 
- Usado: Cantidad de espacio swap que se está utilizando. 
- Libre: Cantidad de espacio  swap que aún no está en uso. 
