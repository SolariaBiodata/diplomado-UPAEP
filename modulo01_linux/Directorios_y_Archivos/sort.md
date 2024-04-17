# Comando *sort*
Este comando es utilizado para visualizar el contenido de un archivo en un orden particular, es decir, imprime los datos de acuerdo con el orden especificado en el argumento del comando. El texto puede ser procesado línea por línea en orden alfabético, en reverso, numérico, entre otras maneras. La sintaxis básica de *sort* es la siguiente:
~~~
sort [nombre_archivo]
~~~
Para este comando ocuparemos los archivos blastBRCA1.txt y hitBRCA1.txt obtenidos del blast de una sección del gen BRCA1.
## 1. Ordenar un archivo alfabéticamente
Se ejecuta el comando *sort* seguido del nombre del archivo.
~~~
sort blastBRCA1.txt
~~~
## 2. Ordenar un archivo de manera inversa
Se ejecuta el comando *sort* seguido de la opción *-r* y del nombre del archivo. Obteniendo en la salida las líneas ordenadas alfabéticamente de manera inversa. 
~~~
sort -r blastBRCA1.txt
~~~
## 3. Ordenar de manera numérica
Se ejecuta el comando *sort*, seguido de la opción *-n* y del nombre del archivo. Las líneas serán ordenadas de menor a mayor. No obstante, los datos numéricos del blast se muestran a partir de la columna 3, por lo que tenemos que usar la opción *-k* para especificar el campo que queremos considerar para ordenar las líneas. Los campos de acuerdo con el número de columna son: query acc.ver, subject acc.ver, % identity, alignment length, mismatches, gap opens, q. start, q. end, s. start, s. end, evalue, bit score. Si quisiéramos ordenar los resultados del blast por el número de mismatches de los alineamientos, dato que se encuentra en la columna 5: 
~~~
sort -k 5 -n hitBRCA1.txt
~~~

## 4. Ordenar líneas únicas
Se ejecuta el comando *sort*, seguido de la opción *-u* y del nombre del archivo. Imprimiendo en la salida únicamente las líneas únicas, eliminando aquellas duplicadas. 
~~~
sort -u blastBRCA1.txt
~~~
## 5. Ordenar por campo específico
Esta opción permite ordenar las líneas de acuerdo con el campo especificado de la línea. Es decir, una línea puede contener varios campos, los cuales pueden estar separados por espacios u otros caracteres. Si quisiéramos ordenar las líneas del archivo basándonos en el tercer campo, el cual contiene el porcentaje de identidad, ejecutaríamos el comando *sort* seguido de la opción *-k \[número de campo\]* y nombre del archivo. En este caso específico, tendríamos que agregar la opción *-n* porque el objetivo sería ordenar numéricamente las líneas de acuerdo con la puntuación de los alineamientos. 
~~~
sort -k 3 -n hitBRCA1.txt
~~~
