![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](../)

## Introducción a Linux

### Operaciones avanzadas con archivos

#### Uso de comodines

En linux, cuando se utilizan comandos que requieren argumentos que son rutas de ficheros, se pueden utilizar comodines para hacer coincidencias entre los nombres _o rutas_ de los archivos que tienen un patrón en común. Los caracteres que se usan para generar esos comodines se explican a continuación:

 - `?` Se utiliza cuando hay varios ficheros que solo difieren en un caracter, si se usa el caracter `?` en lugar de los caracteres diferentes, los ficheros cumplen la condición. Por ejemplo `list?s.txt` es una coincidencia para `listas.txt` y `listos.txt`.
 - `*` Es el más usual, se utiliza cuando sin importar el tamaño en caracteres de la subcadena de texto diferente, existe una cadena que hace coincidir a los nombres de los archivos. Por ejemplo `li*.txt` es una coincidencia para `listas.txt`, `listos.txt` y `literatura.txt`. 
 - `[]` Se usan cuando hay ficheros que difieren en un solo caracter, y además ese caracter corresponde a una lista de caracteres permitidos. A diferencia de `?`, que admite cualquier caracter, con este comodín podemos definir un conjunto de caracteres. Por ejemplo `list[au]s.txt` es una coincidencia para `listas.txt` pero no para `listos.txt` (si existiese un fichero `listus.txt`, sí sería coincidencia).
 - `!` Se utiliza en combinación con `[]`, significa que el caracter que es diferente entre los nombres de los ficheros puede ser cualquiera, excepto los que se definen en el conjunto. Por ejemplo `list[!au]s.txt` es una coincidencia para `listos.txt` pero no para `listas.txt` (si existiera el fichero `listus.txt` tampoco sería coincidencia).

Cuando se utilizan los comodines, cada fichero que tenga un nombre que coincide con la expresión que usa el o los comodines, se convierte en un argumento separado de los demás por espacios, así
```bash
comando li*.txt
```
se interpreta como
```bash
comando listas.txt listos.txt literatura.txt
```
Practicamente todos los comandos que operan con archivos de texto pueden beneficiarse de este uso de comodines.

#### Comandos de inspección

Cuando se inicia un proceso de procesamiento de datos en linux siempre conviene iniciar mediante una exploración general de los archivos. Es muy usual que una vez que nos encontremos en el directorio de trabajo, existan diversos archivos que podemos utilizar. Por esa razón lo primero que se suele hacer es hacer una inspección rápida de los ficheros en el directorio, desplegando información importante como permisos, tamaño, propietarios, etc:

```bash
ls -lh
```
 
 este comando nos despliega información en forma de columnas con la siguiente información:
 
 1. Tipo de archivo
 2. Permisos
 3. Número de ligas fuertes al archivo
 4. Usuario propietario
 5. Grupo del archivo
 6. Tamaño (en formarto humanamente legible)
 7. Tiempo de la última modificación del archivo
 8. Nombre del archivo

Cabe mencionar que la primera columna combina el contenido del tipo de archivo y los permisos usando 10 caracteres, (el primero determina el tipo de archivo, los restantes 9 despliegan el esquema de asignación de permisos). A continuación un ejemplo del resultado de usar el comando `ls -lh`:

```bash
total 48K
-rwxrw-r-- 1 roberto roberto  39K Apr 13 10:04 ejemplo.txt
-rw-r--r-- 1 example grupo   6.9K Apr 13 10:19 file.txt
```

Con esta aproximación obtenemos información muy relevante, como el tamaño de los archivos, las extensiones de los mismos, y una mirada rápida al esquema de permisos para poder interaccionar con los archivos.

Es muy conveniente utilizar entonces un comando adicional para cerciorarse de que un archivo es del tipo de archivo que esperamos de acuerdo al nombre, para ello usamos el comando `file`:

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

Con esa información podemos descartar algunos escenarios desde el inicio. Tipicamente lo que nos interesa descartar en este punto es que un archivo a pesar de tener una extensión en específico, contenga datos correspondientes a un formato diferente. A contuniación se muestra como pudiera verse un archivo binario con la información desplegada por este comando:

```bash
mi_archivo.xxx: PDF document, version 1.6
```
```bash
mi_archivo.xxx: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, with debug_info, not stripped 
```

Finalmente, otro comando muy útil, una vez que estamos seguros de que trabajamos con un archivo de texto  es utilizar el comando `wc`. Este comando sirve para obtener mediciones generales del contenido de texto en nuestro archivo, el comando usa la siguiente sintáxis:

```bash
wc [OPCIONES] [ARCHIVO]
```

Una forma general de ejecutarlo es de la siguiente forma:

```bash
wc mi_archivo.txt
```

el resultado está desplegado en 4 columnas:

 1. Cantidad de líneas (caracteres de nueva línea)
 2. Cantidad de palabras (cadenas de texto que se separan por caracteres de nueva línea, espacios o tabuladores)
 3. Cantidad de bytes (normalmente un byte equivale a un caracter _excepto en codificaciones de mas de 8 bits_)
 4. Nombre del archivo

#### Comandos de descomposición

```bash
head [OPCIONES] [ARCHIVOS]
```

El comando `head` retorna las primeras `10` líneas de un archivo de texto, con el modificador `-n` se puede agregar el número de líneas que necesitamos desplegar de vuelta:

```bash
head -n 15 file.txt
```
***
```bash
tail [OPCIONES] [ARCHIVOS]
```

El comando `tail` retorna las últimas `10` líneas de un archivo de texto, con el modificador `-n` se puede agregar el número de líneas que necesitamos desplegar de vuelta:

```bash
tail -n 20 file.txt
```
***

```bash
split [OPCIONES] [ARCHIVO]
```

El comando `split` divide el contenido de un archivo y genera nuevos archivos con el contenido separado. La opción `-n` define la cantidad de archivos de salida, en ese caso cada archivo de salida tiende a tener el mismo tamaño. La opción `-l` genera tantos archivos como sean necesarios, todos con una cantidad de líneas establecidas. Los archivos que son generados siguen nombres que si se ordenan lexicográficamente y se concatenan sus contenidos, se recuperaría el archivo original.

```bash
split -n 15 file.txt
split -l 30 file.txt
```

#### Comandos de lectura amortiguada

```bash
more archivo.txt
```
El comando `more` permite leer un archivo por segmentos o ventanas. Para avanzar se usa la tecla `<ENTER>`, al llegar al final del documento, la interfaz del comando more se cerrará devolviendo el prompt. Si se desea salir de la interfaz antes de llegar al final se puede hacer con la tecla `q`.

***

```bash
less archivo.txt
```
El comando `less` también permite leer un archivo por segmentos o ventanas. La ventaja de este comando es que permite una interacción más avanzada en el proceso de inspección. Para moverse por el archivo se pueden usar las teclas de navegación ( ⬆️ ⬇️ ⬅️ ➡️ ) , al llegar al final del documento el prompt no regresa de manera automática, es necesario salirse de la interfaz con la tecla `q`. 


[Menú Principal](../)

[Atras](./operacionesArchivosTexto)

[Siguiente](#)
