# Comando *split*
El comando *split* divide el contenido de un archivo y genera nuevos archivos con el contenido separado. Es muy útil cuando contamos con archivos muy grandes y queremos facilitar su manipulación. La sintaxis básica de *split* es la siguiente:
~~~
split [nombre_archivo]
~~~
Para este comando, usaremos algún alrchivo que deseemos seccionar, el cual se ejemplificará con el nombre *archivo.txt*.

## 1. Dividir un archivo en partes iguales 
Se ejecuta el comando *split* seguido del nombre del archivo. 
~~~
split archivo.txt
~~~
Lo que resultaría en la división del archivo en dos partes: 'xaa' y 'xab'. Por default, cada archivo tendrá 1000 líneas. 
## 2. Dividir un archivo de acuerdo con el número de líneas
Se ejecuta el comando *split* seguido de la opción *-l* y número de líneas que quieres que contenga cada archivo que se generará a partir del archivo principal. Si quisiéramos dividir el archivo en archivos de 100 líneas: 
~~~
split -l 100 archivo.txt
~~~
## 3. Dividir un archivo de acuerdo con el tamaño de archivo
Se ejecuta el comando *split* seguido de la opción *-b* y número de bytes que quieres que contenga cada archivo que se generará a partir del archivo principal. Si quisiéramos dividir el archivo en archivos de 10 megabytes: 
~~~
split -b 10M archivo.txt
~~~
## 4. Dividir el archivo en n fragmentos 
Ejecutamos el comando *split* seguido de la opción *-n* y del número de archivos que queremos que se generen en la salida, limitando así la cantidad de archivos de salida divididos.
~~~
split -n 4 archivo.txt
~~~
Obteniendo 4 archivos en la salida.
## 5. Cambiar el sufijo de los archivos de salida 
En general, los nombres de los archivos de salida tienen un formato de x** donde ** son letras. Si queremos que el sufijo aumente en longitud, podemos usar la opción *-a* seguida del número de caracteres que queremos que contenga el sufijo de los archivos de salida. Por default, el número de caracteres del sufijo es 2. 
~~~
split -l 35 -a 3 archivo.txt
~~~
Obteniendo como sufijo de los archivos: 'xaaa' y 'xaab'. 

Si queremos cambiar el sufijo de los archivos divididos a números en vez de letras, usamos la opción *-d*.
~~~
split -l 35 -d archivo.txt
~~~
Obteniendo como sufijo de los archivos: 'x01' y 'x02'. 

