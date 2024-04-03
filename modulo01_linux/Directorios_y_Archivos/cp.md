# Comando *cp* 
El comando *cp* de copy, tiene el fin de generar copias o respaldos de archivos o directorios de una ubicación a otra. La sintaxis correcta es:
~~~
cp [nombre_directorio] /origen/ /destino/
~~~
También tiene las opciones de:
## Copiar directorios de forma recursiva \(*-r*\) 
Al copiar de forma recursiva se permite incluir una carpeta con todas sus subcarpetas y el contenido de cada una de ellas. Específicamente para copiar directorios es necesaria utilizarla como en el siguiente ejemplo:
~~~
cp -r /home/usuario/documentos /respaldos/
~~~
## Confirmación de sobreescribir archivos \(*-i*\) 
Funciona para evitar sobreescribir datos accidentalmente en el destino al que se van a copiar.
## Indicar detalles de copia \(*-v*\)
Con este se muestra a detalle el resultado de la copia de cada archivo y así confirmar que se copió lo que se buscaba.
