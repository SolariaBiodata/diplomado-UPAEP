# Comando *du*
Este comando se usa para mostrar información sobre el uso del espacio en disco de directorios y archivos, por lo que lo convierte en una herramienta ideal para el monitoreo de espacio y la identificación de archivos o directorios que ocupan más espacio en el disco. 
## 1. Visualizar el uso del espacio de un directorio en el disco
Se ejecuta el comando *du* seguido del nombre de la ruta del directorio: 
~~~
du home/gio/Recursoslinux
~~~
De igual manera, si nos encontramos en un directorio que contiene el directorio del cual queremos saber su uso de espacio en el disco, directamente podemos escribir el nombre del directorio en el argumento: 
~~~
du gio
~~~
Obteniendo una salida, por ejemplo:
~~~ 
4       gio/secuencias alineamientos_y_bacillus
16      gio/pruebas2
16      gio/reposi
4       gio/alineamientos_y_bacillus
4       gio/secuencias
4       gio/pruebas
8       gio/.local/share/nano
12      gio/.local/share
16      gio/.local
68      gio/Recursoslinux
292     gio
~~~
Por default, se muestra el tamaño total de cada subdirectorio en bloques de 1024 bytes.
## 2. Visualizar el uso del espacio en el disco en formato legible
Se ejecuta el comando *du* seguido de la opción *-h* y de la ruta del directorio. 
~~~
du -h gio
~~~
Obteniendo una salida, por ejemplo: 
~~~
4.0K    gio/secuencias alineamientos_y_bacillus
16K     gio/pruebas2
16K     gio/reposi
4.0K    gio/alineamientos_y_bacillus
4.0K    gio/secuencias
4.0K    gio/pruebas
8.0K    gio/.local/share/nano
12K     gio/.local/share
16K     gio/.local
68K     gio/Recursoslinux
292K    gio
~~~
Podemos observar que el tamaño de los subdirectorios están en formato humanamente legible (K, M y G bytes). 
## 3. Visualizar solo el tamaño total de un directorio 
Se ejecuta el comando *du* seguido de la opción *-s* y de la ruta del directorio. Se pueden combinar las opciones *-h* y *-s*:
~~~
du -sh gio
~~~
Obteniendo una salida, por ejemplo: 
~~~
292K    gio
~~~
## 4. Excluir tipos de archivos en el cálculo del uso del espacio
Se ejecuta el comando *du* seguido de la opción *--exclude*, del patrón que se quiere excluir \(ejemplo: '*.txt'\) y la ruta del directorio.
 
Teniendo en cuenta que el directorio 'Recursoslinux' contiene varios archivos en formato *.txt*: 
~~~
du -h Recursoslinux
~~~
Obteniendo una salida: 
~~~
68K     Recursoslinux
~~~
Posteriormente, excluiremos los archivos en formato *.txt*:
~~~
du -h --exclude='*.txt' Recursoslinux
~~~
Obteniendo una salida: 
~~~
4.0K    Recursoslinux
~~~
## 5. Visualizar el uso del espacio de múltiples directorios en el disco
Se ejecuta el comando *du* seguido de las rutas de los múltiples directorios:
~~~
du -h Recursoslinux secuencias reposi
~~~
Obteniendo una salida:
~~~ 
68K     Recursoslinux
4.0K    secuencias
16K     reposi
~~~
## 6. Visualizar el espacio que ocupan los archivos en cada directorio
Se ejecuta el comando *du* seguido de la opción *-a* y de la ruta del directorio: 
~~~
du -ah gio
~~~
Obteniendo una salida, por ejemplo: 
~~~
4.0K    gio/secuencias alineamientos_y_bacillus
4.0K    gio/prueba
0       gio/literatura.txt
20K     gio/secuencias.tar
4.0K    gio/archivoseq.tar.gz
4.0K    gio/pruebas2/comandos1.txt.gz
4.0K    gio/pruebas2/comandos2.txt
0       gio/pruebas2/comandosn.tar
0       gio/pruebas2/comandos1.txt
4.0K    gio/pruebas2/comandos.tar
16K     gio/pruebas2
0       gio/SARS_DEU
0       gio/listus.txt
4.0K    gio/xab
0       gio/listos.txt
4.0K    gio/line2.txt
4.0K    gio/state.txt
4.0K    gio/xaa
0       gio/listas.txt
4.0K    gio/newfile.txt
4.0K    gio/reposi/touch.md
4.0K    gio/reposi/mkdir.md
4.0K    gio/reposi/cat.md
16K     gio/reposi
4.0K    gio/.profile
4.0K    gio/alineamientos_y_bacillus
4.0K    gio/secuencias
4.0K    gio/line.txt
12K     gio/SARS_DELTA
4.0K    gio/sarsvariantes.txt
4.0K    gio/xac
4.0K    gio/diana.txt~
4.0K    gio/sed.txt
36K     gio/.bash_history
4.0K    gio/pruebas
4.0K    gio/history1.txt
0       gio/lina.txt
4.0K    gio/.lesshst
4.0K    gio/.bash_logout
0       gio/sarsvariantes.fasta
4.0K    gio/list.txt
4.0K    gio/.bashrc
4.0K    gio/awk.txt
4.0K    gio/multiscr.fasta
4.0K    gio/diana.txt
0       gio/SARS_USA
4.0K    gio/.local/share/nano/search_history
8.0K    gio/.local/share/nano
12K     gio/.local/share
16K     gio/.local
4.0K    gio/employee.txt
20K     gio/Recursoslinux/blastBRCA1.txt
8.0K    gio/Recursoslinux/BRCA1transcript.txt
12K     gio/Recursoslinux/hitBRCA1.txt
8.0K    gio/Recursoslinux/PALB2transcript.txt
16K     gio/Recursoslinux/BRCA2transcript.txt
68K     gio/Recursoslinux
292K    gio
~~~

