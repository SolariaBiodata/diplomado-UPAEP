# Comando *tar*
El comando *tar* es utilizado para crear, manipular y extraer archivos comprimidos en formato **tar**, lo que lo convierte en una herramienta muy versátil para la creación de copias de seguridad, compresión de archivos y transferencia de grandes cantidades de datos de manera eficiente. 
## 1. Generar un archivo comprimido
Se ejecuta el comando *tar* seguido de la combinación de las opciones *-cvf*, el nombre del archivo con extensión *tar* que queremos generar y los archivos que queramos que contenga el archivo comprimido. Las opciones usadas ejecutan las siguientes instrucciones:
- c: crea un nuevo archivo.
- v: muestra el progreso del proceso en la consola.
- f: especifica el nombre del archivo comprimido.

 Suponiendo que quisiéramos crear un archivo comprimido llamado *secuencias.tar* de tres secuencias de ADN aleatorias:
~~~
tar -cvf secuencias.tar secuencia1.txt secuencia2.txt secuencia3.txt
~~~

## 2. Visualizar el contenido de un archivo comprimido *tar*
Se ejecuta el comando *tar* seguido de la combinación de las opciones *-tf* y el nombre del archivo con extensión *tar* que queremos visualizar sin la necesidad de extraerlo. Las opciones usadas ejecutan las siguientes instrucciones:
- t: muestra los archivos y directorios contenidos en un archivo.
- f: especifica el nombre del archivo comprimido.
~~~
tar -tf secuencias.tar
~~~
Obteniendo una salida de los archivos que se encuentran en dicho archivo comprimido, que de acuerdo con el ejemplo anterior serían secuencia1.txt, secuencia2.txt y secuencia3.txt.
## 3. Extraer el contenido de un archivo comprimido *tar*
Se ejecuta el comando *tar* seguido de la combinación de las opciones *-xvf* y el nombre del archivo con extensión *tar* del que queremos extraer los archivos que contiene. Las opciones usadas ejecutan las siguientes instrucciones:
- x: extrae archivos y directorios de un archivo existente.
- v: muestra el progreso del proceso en la consola.
- f: especifica el nombre del archivo comprimido.
~~~
tar -xvf secuencias.tar
~~~
Como resultado, los archivos contenidos en el archivo comprimido se extraerán en el directorio actual. 
## 4. Compresión gzip en el archivo comprimido *tar*
Se ejecuta el comando *tar* seguido de la combinación de las opciones *-cvzf* y el nombre del archivo con extensión *tar.gz* que queremos crear.Las opciones usadas ejecutan las siguientes instrucciones:
- c: crea un nuevo archivo.
- z: compresión zip en el archivo tar.
- v: muestra el progreso del proceso en la consola.
- f: especifica el nombre del archivo comprimido.

Otros formatos de compresión están indicados por las opciones:
- j : compresión bzip2 \(extensión .tbz\).
- J: compresión xz.
~~~
tar -cvzf archivoseq.tar.gz secuencia1.txt secuencia2.txt secuencia3.txt
~~~
## 5. Extraer el contenido de un archivo comprimido *tar.gz*
Se ejecuta el comando *tar* seguido de la combinación de las opciones *-xvzf* y el nombre del archivo con extensión *tar.gz* del que queremos extraer los archivos que contiene. Las opciones usadas ejecutan las siguientes instrucciones:
- x: extrae archivos y directorios de un archivo existente.
- z: compresión gzip.
- v: muestra el progreso del proceso en la consola.
- f: especifica el nombre del archivo comprimido.
~~~
tar -xvzf archivoseq.tar.gz
~~~
Como resultado, los archivos contenidos en el archivo comprimido se extraerán en el directorio actual. 
