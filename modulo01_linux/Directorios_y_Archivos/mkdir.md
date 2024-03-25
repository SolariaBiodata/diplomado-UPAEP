# Comando *mkdir*
Este comando se utiliza para la creación de directorios en el sistema de archivos, y es esencial en la organización y estructuración de la jerarquía de directorios en Linux. 
## 1. Crear un directorio simple
Se ejecuta el comando *mkdir* seguido del nombre del directorio \(carpeta\) que desees crear. 
~~~
mkdir directorionuevo
~~~
El comando anterior generará un directorio con el nombre *nombredirectorio* dentro del directorio en el que te encuentres, el cual puedes conocer a través de la ejecución del comando *pwd*. Si quieres cambiar de directorio hacia atrás, ejecuta el comando `cd ..`, si quieres acceder a un directorio dentro del directorio actual, ejecuta el comando `cd nombre_directorio_al_que_quieres_acceder`.

Si deseas crear un directorio que contenga espacios o caracteres especiales en su nombre, encierra el nombre del directorio entre comillas.
~~~
mkdir "directorio nuevo"
~~~
## 2. Crear múltiples directorios de manera simultánea
En el argumento del comando *mkdir* se enlistan los nombres de los directorios que se desean crear en el directorio actual.
~~~
mkdir directorio1 directorio2 directorio3
~~~
## 3. Crear directorios anidados
Con este comando se pueden crear directorios dentro de otros directorios al usar la opción *-p* seguida de la ruta completa de los directorios a generar. El siguiente ejemplo generará el *subdirectorio1* dentro del directorio con el nombre *directorio*, aunque éste último no exista aún en el directorio actual.
~~~
mkdir -p directorio/subdirectorio1
~~~
## 4. Crear directorios con permisos específicos
Se usa la opción *-m* seguida de los permisos en forma octal y del nombre del directorio. 
~~~
mkdir -m 775 directorio
~~~