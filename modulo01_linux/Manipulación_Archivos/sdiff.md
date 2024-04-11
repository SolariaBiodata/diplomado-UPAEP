# Comando *sdiff* 
Este comando al igual que diff, compara archivos o directorios y finalmente los fusiona. La sintaxis correcta de este comando es la siguiente:
~~~
sdiff [opción]... archivo1 archivo2 
~~~
## Tratar archivos como texto
Con esta opción, se aplica *-a* después del comando para tratar a todos los archivos sin importar de qué tipo sean como un texto y los compara línea por línea. Esta es la sintaxis:
~~~
sdiff -a  arabidopsis1 arabidopsis2 
~~~
## Ignorar líneas en blanco
La opción anterior *-B* ignora las líneas en blanco presentes en un archivo. 
~~~
sdiff   -B  arabidopsis1 arabidopsis2
~~~
## Ignorar pestañas y espacios en blanco
Existen tres opciones que funcionan con el motivo de ignorar espacios en blanco. La opción *-w* ignora archivos con demasiados espacios en blanco. De la misma forma, *-z* ignora espacio en blanco con la excepción de que estos estén al final de la línea. Finalmente, *-E* ignora los cambios generados por la expansión de pestañas. Esta es la sintaxis correcta de los tres respectivamente:
~~~
sdiff   -w  arabidopsis1 arabidopsis2 
~~~
~~~
sdiff   -z  arabidopsis1 arabidopsis2 
~~~
~~~
sdiff   -E  arabidopsis1 arabidopsis2 
~~~
## Ignorar mayúsculas y minúsculas 
Al igual que la opción anterior, la *-i* permite ignorar el caso de la presencia de mayúsculas y minúsculas en los archivos y después comparar. 
~~~
sdiff   -E  arabidopsis1 arabidopsis2
~~~
