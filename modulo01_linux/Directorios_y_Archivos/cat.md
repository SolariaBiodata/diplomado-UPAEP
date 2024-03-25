# Comando *cat*
Este comando es utilizado para concatenar archivos y mostrar el contenido de éstos en la salida estándar. 
Teniendo un archivo de texto con el nombre *fasta.txt* que contiene el siguiente texto:
~~~
>Secuencia_1
ATCGGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAG
CTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCT
AGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAG

>Secuencia_2
CTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCT
AGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAG
CTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCT
AGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAG
~~~
## 1. Mostrar el contenido de un archivo 
Se ejecuta el comando *cat* seguido del nombre del archivo. Como resultado, se mostrará el contenido del archivo correspondiente en la salida estándar. 
~~~
cat fasta.txt
~~~
## 2. Mostrar el número de líneas 
Se usa la opción *-n* para mostrar el número de línea junto al contendio correspondiente del archivo. 
~~~
cat -n fasta.txt
~~~
En la salida estándar se mostraría:
~~~
     1 >Secuencia_1
     2 ATCGGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAG
     3 CTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGC
     4 TAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCT
     5 AGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAG
     6 
     7 >Secuencia_2
     8 CTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCT
     9 AGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAG
     10 CTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCT
     11 AGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAG
~~~
## 3. Concatenar archivos 
La sintaxis del comando consiste en *cat* seguido por la lista de los nombres de los archivos que se desean concatenar en un archivo de salida específico. En el siguiente ejemplo, se concatenarán los archivos *fasta1.txt*, *fasta2.txt* y *fasta3.txt* en el archivo *archivoconcatenado.txt*.
~~~
cat fasta1.txt fasta2.txt fasta3.txt > archivoconcatenado.txt
~~~
En el caso particular de solamente desear concatenar múltiples archivos en la salida estándar de la terminal, sin generar un archivo de salida, se enlistan los archivos en el argumento del comando *cat* sin usar redirección de salida. 
~~~
cat fasta1.txt fasta2.txt fasta3.txt
~~~
## 4. Crear o editar un archivo
Para crear o editar un archivo de texto desde la terminal, el comando *cat* se ejecuta junto con la redirección de salida *>*. Una vez terminada la edición del contenido del archivo se presiona *"Ctrl + D"* para guardar y salir. 
~~~
cat > fasta.txt
~~~
## 5. Usar cat con pipes \(tuberías\)
Se puede utilizar *cat* junto con pipes para enviar el contenido de un archivo a otro comando. En el siguiente ejemplo el contenido del archivo *fasta.txt* se envía a otro comando *grep*, último el cual busca el patrón especificado. 
~~~
cat fasta.txt | grep "patrónquequierobuscar"
~~~