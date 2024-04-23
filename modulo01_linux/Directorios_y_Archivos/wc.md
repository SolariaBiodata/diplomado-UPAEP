# Comando *wc*
Este comando proviene de las palabras *"word count"*, y es utilizado para contar el número de líneas, palabras, bytes y caracteres en los archivos especificados en el argumento del comando. La sintaxis básica de *wc* es la siguiente:
~~~
wc [nombre_archivo]
~~~
La salida del comando está desplegada en 4 columnas:

 1. Cantidad de líneas (caracteres de nueva línea).
 2. Cantidad de palabras (cadenas de texto que se separan por caracteres de nueva línea, espacios o tabuladores).
 3. Cantidad de bytes (normalmente un byte equivale a un caracter _excepto en codificaciones de más de 8 bits_).
 4. Nombre del archivo.

## 1. Contar líneas, palabras y bytes
Se ejecuta el comando seguido del nombre del archivo. 
~~~
wc BRCA1transcript.txt 
~~~
Arrojando, por ejemplo, una salida de cuatro columnas: el número de líneas, palabras, bytes y nombre del archivo respectivamente. 
~~~
  104  115 7452 BRCA1transcript.txt
~~~
Se pueden introducir varios archivos en el argumento del comando, obteniendo una salida de cuatro columnas y un número de filas correspondiente a la cantidad de archivos especificados, además de una última fila que suma el total de todos los archivos para cada variable de las columnas:
~~~
wc BRCA1transcript.txt BRCA2transcript.txt PALB2transcript.txt
~~~
Obteniendo una salida: 
~~~
  104   115  7452 BRCA1transcript.txt
  171   183 12385 BRCA2transcript.txt
   57    70  4157 PALB2transcript.txt
  332   368 23994 total
 ~~~

## 2. Opción -l
Esta opción solamente imprime el número de líneas del archivo especificado. 
~~~
wc -l BRCA1transcript.txt
~~~
Obteniendo una salida compuesta por 2 columnas que corresponden al número de líneas y al nombre del archivo: 
~~~
104 BRCA1transcript.txt
~~~
## 3. Opción -w
Esta opción solamente imprime el número de palabras del archivo especificado.
~~~
wc -w BRCA1transcript.txt
~~~
Obteniendo una salida compuesta por 2 columnas que corresponden al número de palabras y al nombre del archivo: 
~~~
115 BRCA1transcript.txt
~~~
## 4. Opción -c
Esta opción solamente imprime el número de bytes del archivo especificado.
~~~
wc -c BRCA1transcript.txt
~~~
Obteniendo una salida compuesta por 2 columnas que corresponden al número de bytes y al nombre del archivo: 
~~~
7452 BRCA1transcript.txt
~~~
## 5. Opción -m
Esta opción solamente imprime el número de caracteres del archivo especificado.
~~~
wc -m BRCA1transcript.txt
~~~
Obteniendo una salida compuesta por 2 columnas que corresponden al número de caracteres y al nombre del archivo:
~~~
7452 BRCA1transcript.txt
~~~