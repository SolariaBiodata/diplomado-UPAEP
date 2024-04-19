# Comando *top* 
Este comando funciona para administrar el sistema de forma que al usarlo en la terminal, se muestra tiempo de actividad del sistema, uso de CPU, número de hilos, uso de memoria (total, utilizado, libre, etc.), una lista de procesos en ejecución, etcétera.  La sintaxis correcta de este comando es:
~~~
top   
~~~
También es posible usar las opciones *%MEM* o *%CPU* para desplegar la lista de tareas en columnas con un orden por porcentaje de memoria o CPU del equipo.
~~~
top   -o +%MEM
~~~
~~~
top   -o +%CPU
~~~
