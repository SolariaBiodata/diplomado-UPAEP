# Comando *diff* 
Este comando tiene como función ser una herramienta de diferenciación entre dos archivos o directorios completos. A continuación se muestra ejemplo para comparar dos archivos:
~~~
diff   archivoA.txt  archivoB.txt
~~~
## Comparar directorios \(*-r*\)
Para comparar directorios completos es necesario recurrir al uso de la opción *-r* la cual recurre al argumento recursivo, es decir, tomar en cuenta el directorio por completo. El siguiente ejemplo compara dos directorios:
~~~
diff  -r  secuenciasA secuenciasB
~~~
## Ignorar espacios en blanco \(*-b*\)
Es posible pedir al programa que ignore los espacios en blanco durante la comparación mediante el uso de la opción *-b*, por ejemplo:
~~~
diff  -b  arabidopsisA.txt  arabidopsisB.txt
~~~
## Creación de parches \(*-u*\)
Al comparar también es posible generar un parche con un archivo que englobe las diferencias entre los archivos o directorios comparados, como por ejemplo:
~~~
diff  -u  vaccineA.txt vaccineB.txt  > patch.diff
~~~
Aquí la *>* está señalando en la dirección de la creación de un archivo llamado *patch.diff* donde contendrá las diferencias de los archivos.
## Comparar archivos binarios
En este caso, es necesario utilizar *-c* para obtener el contexto de los archivos mientras que se usa *-s* para que se muestre archivos idénticos, por ejemplo:
~~~
diff  -c -s  secuenciasA secuenciasB
~~~
