# Comando *history*
Este comando es útil para visualizar el historial de comandos ejecutados en la terminal con el propósito de revisar o repetir lo que has ejecutado. 

## 1. Visualizar el historial de comandos
Se ejecuta el comando *history*.
~~~
history
~~~
Lo que nos devoverá una lista numerada de todos los comandos que hemos ejecutado, desde el más antiguo hasta el más reciente.

Si queremos delimitar el número de comandos que nos devolverá en el historial, se ejecuta el comando *history* seguido del número de comandos que queremos visualizar. 
~~~
history 20
~~~
Nos devolverá los últimos 20 comandos ejecutados. 
## 2. Repetir un comando del historial 
Una vez que tenemos identificado el número asignado de cada comando en nuestro historial, podemos repetir un comando únicamente ejecutando `!` seguido del número del comando. Si en nuestro historial el comando que queremos repetir es el 101: 
~~~
!101
~~~
Si queremos asegurarnos de que sea el comando correcto antes de ejecutarlo, agregamos `:p`. 
~~~
!101:p
~~~
En la salida podremos visualizar el comando que corresponde a ese número sin ser ejecutado.
## 3. Guardar el historial de comandos en un archivo
Se ejecuta el comando *history* seguido de la redirección de salida `>` y del nombre del archivo que queremos que contenga nuestro historial. 
~~~
history > historialjunio.txt
~~~
El archivo historialjunio.txt contendrá nuestro historial registrado. 
## 4. Borrar el historial de comandos
Se ejecuta el comando *history* seguido de la opción *-c* para borrar todos los comandos almacenados en el historial. 
~~~
history -c
~~~
## 5. Cargar un historial de comandos a partir de un archivo
Si contamos con un archivo de un historial de comandos y nuestro propósito es cargarlo a nuestro historial actual, se ejecuta el comando *history* seguido de la opción *-r* y el nombre del archivo con el historial que queremos cargar. 
~~~
history -r historialagosto.txt
~~~
Es importante que el archivo que vamos a cargar no esté numerado. 