# Comando *rm* 
El comando *rm* que viene de la palabra remove y tiene el fin de eliminar completamente archivos o directorios. Este debe de usarse con precaución debido a que estos archivos no pueden ser recuperados una vez usado el comando.La sintaxis correcta para este comando es:
~~~
rm [opciones] /nombre/
~~~
También es posible utilizar las opciones de:
## Eliminar directorios de forma recursiva \(*-r*\) 
Se incluye una carpeta con todas sus subcarpetas y su contenido. Es necesario usar esta opción para eliminar directorios.
## Forzar eliminación de archivos \(*-f*\)
Esta permite suprimir todas solicitudes de confirmación. Recordar que al usar este comando de eliminación, no es posible recuperar ningún archivo o directorio.
## Confirmación para eliminar archivos \(*-i*\) 
Esta opción genera una solicitud para confirmar la eliminación de cada archivo o directorio. Esto proporciona seguridad adicional contra accidentes.
## Un ejemplo podría ser lo siguiente:
Se requiere eliminar el directorio */control/* sin solicitudes de confirmación de eliminación. Esto se escribiría de la siguiente forma:
~~~
rm -rf /control/
~~~
