# Comando *tail*
Este comando es utilizado para visualizar las últimas líneas de un archivo de texto. La sintaxis básica de *tail* es la siguiente:
~~~
tail [nombre_archivo]
~~~
## 1. Visualización de las últimas líneas de un archivo
Se ejecuta el comando *tail* seguido del nombre del archivo, imprimiendo por default las últimas 10 líneas del archivo. 
~~~
tail bacillus.txt
~~~
## 2. Visualización de las últimas líneas especificadas de un archivo 
Se usa la opción *-n* seguida del número de las últimas líneas del archivo especificado en el argumento que queremos visualizar. 
~~~
tail -n 6 bacillus.txt
~~~
Obteniendo como resultado la impresión de las últimas 6 líneas del archivo indicado. 
## 3. Visualización de los últimos bytes de un archivo
Se usa la opción *-c* seguida del número de los últimos bytes que queremos visualizar del archivo especificado en el argumento. 
~~~
tail -c 12 bacillus.txt
~~~
Obteniendo como resultado la impresión de los últimos 12 bytes del archivo indicado. 
## 4. Visualización de las últimas líneas y nombre del archivo especificado
Se usa la opción *-v* seguida del nombre del archivo o archivos, imprimiendo los datos del archivo o archivos especificados precedidos por su nombre de archivo.
~~~
tail -v bacillus.txt
~~~
O bien, si queremos visualizar los mismos datos de varios archivos: 
~~~
tail -v bacillus.txt pseudomonas.txt
~~~
Igualmente lo podemos combinar con la opción -n u otras: 
~~~
tail -v -n 6 bacillus.txt pseudomonas.txt
~~~
## 5. Visualización de las últimas líneas de varios archivos sin sus nombres
Si por lo contrario, queremos desplegar la información de las últimas líneas de varios archivos sin que aparezca su nombre, usamos la opción *-q* seguida de los nombres de archivos. 
~~~
tail -q bacillus.txt pseudomonas.txt
~~~