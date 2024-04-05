# Comando *file*
Es utilizado para determinar el tipo de un archivo sin abrir el archivo. La sintaxis básica de *file* es la siguiente:
~~~
file [nombre_archivo]
~~~
Es muy conveniente utilizar este comando para cerciorarse de que un archivo es del tipo de archivo que esperamos de acuerdo al nombre, como por ejemplo :

```bash
file mi_archivo.xxx
```
Este comando puede aportar información muy interesante:

```bash
mi_archivo.xxx: ASCII text, with very long lines
```
```bash
mi_archivo.xxx: ASCII text, with CRLF line terminators
```
```bash
mi_archivo.xxx: Variant Call Format (VCF) version 4.2, ASCII text
```
```bash
mi_archivo.xxx: Bourne-Again shell script, ASCII text executable 
```

Con la información que nos arroja en la salida podemos descartar algunos escenarios desde el inicio. Típicamente lo que nos interesa descartar en este punto es que un archivo a pesar de tener una extensión en específico, contenga datos correspondientes a un formato diferente. A continuación se muestra como pudiera verse un archivo binario con la información desplegada por este comando:

```bash
mi_archivo.xxx: PDF document, version 1.6
```
```bash
mi_archivo.xxx: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, with debug_info, not stripped 
```
Se muestran algunos delos usos más comunes de este comando:
## 1. Determinar el tipo de archivo de un único archivo
Se ejecuta el comando *file* seguido del nombre del archivo, obteniendo como salida el tipo de archivo. El tipo de archivo puede ser documento pdf, imagen jpeg, archivo de texto, ASCII text, entre otros formatos.
~~~
file alineamientos.txt
~~~
## 2. Determinar el tipo de archivo de varios archivos
En el argumento del comando se añaden los diferentes archivos que queremos consultar.
~~~
file alineamientos.txt bacillus.txt pseudomonas.txt
~~~
## 3. Determinar el tipo de archivo de los archivos de un directorio
Se usa el comodín **\*** en el argumento y en la salida se enlistarán los tipos de archivos de todos los archivos contenidos en el directorio actual.
~~~
file *
~~~
En caso de querer consultar un directorio en específico, se agrega el nombre del directorio al argumento: 
~~~
file nombre_directorio/*
~~~
## 4. Determinar un rango para el orden de determinación de tipo de archivos contenidos en el directorio
Se agrega el rango en el que se quiere que se presenten los archivos analizados, es decir, de la a-z, o de la r-z, obteniendo una salida de los archivos enlistados de la a-z y de la r-z respectivamente. 
~~~
file [a-z]*
~~~
## 5. Opción -b
Esta opción significa *brief*, generando una salida con el tipo de archivo, pero sin el nombre del archivo.
~~~
file alineamientos.pdf 
~~~
Generando una salida:
~~~
PDF document, version 1.4
~~~ 