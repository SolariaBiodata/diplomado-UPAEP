# Comando *gzip*
El comando *gzip* es utilizado para comprimir archivos en formato gzip, lo que lo convierte en una herramienta muy versátil para la reducción del tamaño de archivos individuales.
## 1. Generar un archivo *gzip*
Se ejecuta el comando *gzip* seguido del nombre del archivo que queramos comprimir. 
 Suponiendo que quisiéramos comprimir el archivo *secuencia1.txt*:
~~~
gzip secuencia1.txt
~~~
Obteniendo un archivo comprimido llamado *secuencia1.txt.gz*.
## 2. Comprimir varios archivos en un archivo *tar.gz*
Se ejecuta el comando *gzip* seguido de la opción -c, la cual creará un nuevo archivo, seguido del nombre de los archivos que queremos comprimir, el operador de redireccionamiento *>* y el nombre del archivo con extensión *tar.gz* que queremos crear:
~~~
gzip -c secuencia1.txt secuencia2.txt > secuencias.tar.gz
~~~
Obteniendo una salida de un archivo comprimido llamado *secuencias.tar.gz* que contiene de manera comprimida los archivos *secuencia1.txt* y *secuencia2.txt*. 
## 3. Descomprimir un archipo *gzip*
Se ejecuta el comando *gzip* seguido de la opción *-d* y del nombre del archivo con extensión *gz*, previamente creado. Si quisiéramos descomprimir el archivo *secuencia1.txt.gz* y obtener el archivo original sin comprimir:
~~~
gzip -d secuencia1.txt.gz
~~~
Obteniendo como resultado el archivo *secuencia1.txt* original. 
## 4. Conservar el archivo original al comprimir
Por default, cada vez que generamos un archivo comprimido *gzip* se elimina el archivo original y se crea el archivo comprimido. Si queremos conservar el archivo original y el archivo comprimido de manera simultánea, se usa la opción *-k*: 
~~~
gzip -k secuencia1.txt
~~~
Como resultado se conservará el archivo original *secuencia1.txt* y se creará el archivo comprimido *secuencia1.txt.gz*.
## 5. Comprimir múltiples archivos independientes
Si quisiéramos comprimir varios archivos al mismo tiempo, se ejecuta el comando *gzip* seguido del nombre de los archivos que queremos comprimir.
~~~
gzip secuencia1.txt secuencia2.txt secuencia3.txt
~~~
Obteniendo 3 archivos comprimidos llamados *secuencia1.txt.gz*, *secuencia2.txt.gz* y *secuencia3.txt.gz*.
## 6. Determinar el nivel de compresión
Se puede indicar el nivel de compresión usando las opciones -1 hasta -9, en donde -1 es el nivel más rápido y básico de compresión, mientras que el -9 es el más lento, pero el más eficiente en cuanto a compresión de archivos. 
~~~
gzip -9 secuencia1.txt 
~~~
Obteniendo el archivo comprimido *secuencia1.txt.gz* con el más alto nivel de compresión. 