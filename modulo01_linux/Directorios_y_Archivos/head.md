# Comando *head*
Este comando es utilizado para visualizar las primeras líneas de un archivo de texto. La sintaxis básica de *head* es la siguiente:
~~~
head [nombre_archivo]
~~~
## 1. Visualización de las primeras líneas de un archivo
Se ejecuta el comando *head* seguido del nombre del archivo, imprimiendo por default las primeras 10 líneas del archivo. 
~~~
head BRCA1transcript.txt
~~~
## 2. Visualización de las primeras líneas especificadas de un archivo 
Se usa la opción *-n* seguida del número de línea del archivo especificado en el argumento hasta la que queremos visualizar. 
~~~
head -n 6 BRCA1transcript.txt
~~~
Obteniendo como resultado la impresión de las primeras 6 líneas del archivo indicado. 
## 3. Visualización de los primeros bytes de un archivo
Se usa la opción *-c* seguida del número de byte hasta el que queremos visualizar del archivo especificado en el argumento. 
~~~
head -c 12 BRCA1transcript.txt
~~~
Obteniendo como resultado la impresión de los primeros 12 bytes del archivo indicado. 
## 4. Visualización de las primeras líneas y nombre del archivo especificado
Se usa la opción -v seguida del nombre del archivo o archivos, imprimiendo los datos del archivo o archivos especificados precedidos por su nombre de archivo.
~~~
head -v BRCA1transcript.txt
~~~
O bien, si queremos visualizar los mismos datos de varios archivos: 
~~~
head -v BRCA1transcript.txt BRCA2transcript.txt PALB2transcript.txt
~~~
Igualmente lo podemos combinar con la opción -n u otras: 
~~~
head -v -n 6 BRCA1transcript.txt BRCA2transcript.txt PALB2transcript.txt
~~~