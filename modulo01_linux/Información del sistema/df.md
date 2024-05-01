# Comando *df*
Este comando se usa para mostrar información sobre el espacio utilizado y disponible en los sistemas de archivos del sistema, por lo que lo convierte en una herramienta ideal para el monitoreo del disco con el fin de asegurar la ejecución de actividades específicas en tu sistema. 

## 1. Visualizar información básica sobre el uso de disco
Se ejecuta el comando *df*, resultando en el despliegue de información sobre todos los sistemas de archivos del sistema. La salida estándar contiene como columnas los sistemas de archivos, el tamaño de estos, el espacio utilizado, el tamaño disponible, el porcentaje de uso y el punto de montaje. 
~~~
df 
~~~
En caso de querer visualizar esta información en formato humanamente legible, es decir, mostrando estas cantidades con unidades como K, M o G para bytes, se ejecuta el comando *df* seguido de la opción *-h*. 
~~~
df -h
~~~
## 2. Visualizar información sobre un sistema de archivos específico
Se ejecuta el comando *df* seguido de la opción *-h* y de la ruta o nombre del sistema de archivos en el argumento. 
~~~
df -h /mnt/c
~~~ 
La ejecución del comando anterior resultará en la visualización de la información sobre el sistema de archivos montado en */mnt/c*. 

En cambio, si en el argumento se especifica un archivo, se podrá visualizar la información de montaje de ese archivo: 
~~~
df -h awk.txt
~~~ 
Obteniendo, por ejemplo: 
~~~
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdc       1007G  282M  956G   1% /
~~~
Esto se debe a que el archivo del argumento se encuentra en el sistema de archivos llamado /dev/sdc.
## 3. Exclusión de sistemas de archivo 
Se ejecuta el comando *df* seguido de la opción *-x* y del tipo de sistema de archivos que queremos excluir. Si quisiéramos excluir los de tipo *tmpfs*: 
~~~
df -x tmpfs
~~~
Lo que resultará en la visualización de información sobre todos los sistemas de archivos montados, excepto los de tipo tmpfs.
## 4. Obtener información acerca del total de sistemas de archivos
Se ejecuta el comando *df*, seguido de la opción *--total*. 
~~~
df -h --total
~~~
Obteniendo una salida estándar, por ejemplo: 
~~~
Filesystem      Size  Used Avail Use% Mounted on
none            1.5G  4.0K  1.5G   1% /mnt/wsl
none            931G  114G  817G  13% /usr/lib/wsl/drivers
none            1.5G     0  1.5G   0% /usr/lib/modules
none            1.5G     0  1.5G   0% /usr/lib/modules/5.15.146.1-microsoft-standard-WSL2
/dev/sdc       1007G  282M  956G   1% /
none            1.5G   72K  1.5G   1% /mnt/wslg
none            1.5G     0  1.5G   0% /usr/lib/wsl/lib
rootfs          1.5G  1.9M  1.5G   1% /init
none            1.5G     0  1.5G   0% /dev
none            1.5G     0  1.5G   0% /run
none            1.5G     0  1.5G   0% /run/lock
none            1.5G     0  1.5G   0% /run/shm
none            1.5G     0  1.5G   0% /run/user
tmpfs           1.5G     0  1.5G   0% /sys/fs/cgroup
none            1.5G   76K  1.5G   1% /mnt/wslg/versions.txt
none            1.5G   76K  1.5G   1% /mnt/wslg/doc
C:\             931G  114G  817G  13% /mnt/c
total           2.9T  228G  2.6T   9% -
~~~
Observando que se ha añadido una línea que resume el total de todos los parámetros correspondientes a cada columna. 

## 5. Mostrar el tipo de archivo 
Para mostrar el tipo de archivo de un archivo específico se ejecuta el comando *df* seguido de la opción *-T* y del nombre del archivo del cual desconocemos su tipo de archivo.
~~~
df -T awk.txt
~~~
Obteniendo una salida estándar, por ejemplo:
~~~
Filesystem     Type  1K-blocks   Used  Available Use% Mounted on
/dev/sdc       ext4 1055762868 288684 1001770712   1% /
~~~
Observando que *awk.txt* es un archivo de tipo ext4. 