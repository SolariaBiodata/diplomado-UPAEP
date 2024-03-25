# Comando *touch* 
Este comando es utilizado para crear archivos vacíos. Además, con éste se pueden actualizar la modificación y la fecha de acceso de archivos existentes.
## 1. Crear un archivo vacío
 El comando se ejecuta escribiendo *touch* seguido del nombre que quieras asignarle al archivo que deseas crear. A continuación se presenta un ejemplo en donde se creará un archivo con el nombre "nombrearchivo.txt" en el directorio actual, último el cual se puede conocer con el comando *pwd*.
~~~
touch nombrearchivo.txt
~~~
## 2. Crear múltiples archivos de manera simultánea 
El comando sigue la misma sintaxis, separando por espacios la lista de archivos que se desea crear en el directorio actual. 
~~~
touch nombrearchivo1.txt nombrearchivo2.txt nombrearchivo3.txt
~~~
## 3. Actualizar la modificación y fecha de acceso de archivos existentes
Para actualizar la fecha de modificación y acceso de un archivo existente sin entrar o modificar su contenido, el comando se ejecuta escribiendo *touch* seguido del nombre del archivo existente.
~~~
touch archivoexistente.txt
~~~
## 4. Opción -t para la creación o actualización de archivos con tiempo específico 
Si se quiere especificar la fecha y hora para la creación o actualización de archivos, se ejecuta el comando escribiendo *touch* seguido de la opción *-t*, seguida por el formato del tiempo *[[CC]YY]MMDDhhmm[.ss]*, seguido del nombre del archivo a modificar. El siguiente ejemplo muestra la actualización de un archivo con el nombre de *archivoexistente.txt* al 1 de marzo del 2024 a las 13:00:00 PM.
~~~
touch -t 202403011300.00 archivoexistente.txt
~~~
## 5. Opción -a para la actualización de la fecha de acceso
Únicamente se actualiza la fecha de *acceso* del archivo, sin alterar su fecha de modificación, lo cual puede ser útil cuando se quiere indicar que se ha accedido a un archivo de manera reciente sin modificar su contenido. 
~~~
touch -a archivo.txt
~~~
## 6. Opción -m para la actualización de la fecha de modificación
Únicamente se actualiza la fecha de *modificación* del archivo, sin alterar su fecha de acceso.
~~~
touch -m archivo.txt
~~~
## 7. Opción -c para modificación de fechas en archivos existentes
Únicamente modifica la fecha de acceso y modificación de archivos existentes, sin crear archivos nuevos, es decir, si el archivo especificado en la sintaxis del comando no existe, no se ejecutará acción alguna. 
~~~
touch -c archivoexistente.txt
~~~
## 8. Opción -d para especificar cadena de fecha y hora
Usa una cadena de fecha/hora en lugar de la actual. El siguiente ejemplo después de ser ejecutado actualizará la fecha de acceso y modificación del archivo *archivo.txt* al día anterior. 
~~~
touch -d "yesterday" archivo.txt
~~~
## 9. Opción -r para especificar fecha a partir de referencia
Permite utilizar la fecha de acceso y modificación de otro archivo como referencia. El siguiente comando, al ser ejecutado. cambiará la fecha de acceso y modificación de *archivo.txt* con base en las fechas correspondientes de *archivoreferencia.txt*.
~~~
touch -r archivoreferencia.txt archivo.txt
~~~
## 10. ¿Cómo verificar la fecha de acceso y modificación de un archivo? 
El comando stat se utiliza para mostrar información detallada sobre archivos y sistemas de archivos. Su sintaxis se muestra en el siguiente ejemplo.
~~~
stat archivo.txt
~~~