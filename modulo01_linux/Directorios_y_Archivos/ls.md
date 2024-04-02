# Comando *ls*
Este comando es utilizado para enlistar los archivos y directorios de un directorio en específico. La sintaxis básica de ls es la siguiente:
~~~
ls [opcion] [archivo/directorio]
~~~
## 1. Listar archivos y directorios del directorio actual
Se ejecuta el comando *ls* sin ningún argumento, y se obtiene como salida un listado de todos los archivos y directorios contenidos en el directorio actual en orden alfabético. 
~~~
ls
~~~
## 2. Opción -l
Muestra la lista de los archivos y directorios incluyendo permisos, propietario, grupo, tamaño, fecha de modificación y nombre del archivo o directorio desplegados en columnas.
~~~
ls -l
~~~
La salida mostraría:
~~~
drwxr-xr-x 2 gio gio 4096 Apr  1 19:23  alineamientos_y_bacillus
-rw-r--r-- 1 gio gio   67 Mar 11 08:18  awk.txt
~~~
Cabe mencionar que la primera columna combina el contenido del tipo de archivo y los permisos usando 10 caracteres, (el primero determina el tipo de archivo, los restantes 9 despliegan el esquema de asignación de permisos). Este comando nos despliega información en forma de columnas con la siguiente información:
 
 1. Tipo de archivo. Puede ser:
    - \-: archivo normal
    - d: directorio
    - s: socket 
    - l: archivo de enlace
 2. Permisos

    En linux la primera capa de seguridad es provista por el sistema de permisos. Este sistema está formado por dos componentes:

    1. Grupo de permisos
        - Propietario
        - Grupo
        - Otros
    
    2. Tipo de permisos
        - Lectura \(read\)
        - Escritura \(write\)
        - Ejecución \(rexecute\)

    Si se otorgan los tres permisos al propietario, grupo y otros, el formato se vería así: -rwxrwxrwx.
    Si solamente se otorgaran permisos de lectura-escritura-ejecución para el propietario, permiso de lectura para el grupo y permiso de lectura para otros, el formato se vería así: 
    -rwxr--r--.

 3. Número de ligas fuertes al archivo
 4. Usuario propietario
 5. Grupo del archivo
 6. Tamaño (en formarto humanamente legible)

    El tamaño es mostrado en bytes.
 7. Tiempo de la última modificación del archivo
 8. Nombre del archivo

## 3. Opción -a
Muestra todos los archivos y directorios, incluyendo los archivos ocultos, los cuales comienzan con un punto \(.\) en Linux.
~~~
ls -a
~~~
## 4. Opción -t
Lista los archivos y directorios por hora de modificación, mostrando en primer lugar el último archivo editado.
~~~
ls -t
~~~
## 5. Opción -r
Lista todos los archivos y directorios contenidos en el directorio actual en orden reverso.
~~~
ls -r
~~~ 
## 6. Opción -S
Lista todos los archivos y directorios contenidos en el directorio actual de acuerdo con su tamaño, en donde el primer lugar es ocupado por el más pesado.
~~~
ls -S
~~~ 
## 7. Opción -i
Muestra el número de índice (inodo) de cada archivo y directorio.
~~~
ls -i
~~~ 
## 8. Opción -lh
Muestra el tamaño de archivos por tamaño en formato humanamente legible. Ejemplo: 2K, 500M, 10G.
Cabe mencionar que se están juntando las opciones l y h para mostrar la información respectiva de los archivos y directorios, en donde el campo de tamaño del archivo aparecerá en formato humanamente legible. Esta combinación puede realizarse con otras opciones.   
~~~
ls -lh
~~~ 