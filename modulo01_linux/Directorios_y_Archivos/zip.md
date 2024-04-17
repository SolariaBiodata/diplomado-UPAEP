 # Comando *zip*
El comando *zip* es utilizado para crear, manipular y extraer archivos comprimidos en formato **zip**, lo que lo convierte en una herramienta muy versátil para la creación de archivos comprimidos que ocupan menos espacio en el disco, al igual que extraer archivos zip existentes. 
## 1. Generar un archivo comprimido ZIP
Se ejecuta el comando *zip* seguido del nombre del archivo zip que queramos crear y los nombres de los archivos que queramos que contenga el archivo comprimido. 

 Suponiendo que quisiéramos crear un archivo comprimido llamado *secuencias.zip* de tres secuencias de ADN aleatorias:
~~~
zip secuencias.zip secuencia1.txt secuencia2.txt secuencia3.txt
~~~
O bien, si quisiéramos comprimir todos los archivos de un directorio en un archivo zip: 
~~~
zip -r secuencias.zip directorio1/
~~~
Obteniendo un archivo comprimido ZIP de los archivos contenidos en el *directorio1*.
## 2. Visualizar el contenido de un archivo comprimido *ZIP*
Se ejecuta el comando *unzip* seguido de la opción -l y el nombre del archivo con extensión *zip* que queremos visualizar sin la necesidad de extraerlo.
~~~
unzip -l secuencias.zip
~~~
Obteniendo una salida de los archivos que se encuentran en dicho archivo comprimido, que de acuerdo con el ejemplo anterior serían secuencia1.txt, secuencia2.txt y secuencia3.txt.
## 3. Extraer el contenido de un archivo comprimido *ZIP*
Se ejecuta el comando *unzip* seguido del nombre del archivo con extensión *zip* del que queremos extraer los archivos que contiene. 
~~~
unzip secuencias.zip
~~~
Obteniendo como resultado la extracción de los archivos de dicho archivo comprimido en el directorio actual. 

En el caso de que queramos especificar un directorio, se usa la opción -d seguida del directorio destino. 
~~~
unzip secuencias.zip -d directorio1
~~~
## 4. Comprimir archivos con contraseña 
Si se desea agregar contraseña al archivo comprimido que se generará, se usa la opción -P seguida de la contraseña misma: 
~~~
zip -P acuario secuencias.zip secuencia1.txt secuencia2.txt secuencia3.txt
~~~
La palabra *acuario* será la contraseña del archivo comprimido.
## 5. Descomprimir archivos ZIP con contraseña 
Si se desea descomprimir un archivo ZIP con contraseña, se usa el comando *unzip* seguido del nombre del archivo. Posteriormente se ingresa la contraseña en el momento en que se solicite. 
~~~
unzip secuencias.zip 
~~~
## 6. Eliminar archivo de un archivo ZIP
Si se desea eliminar un archivo específico contenido en un archivo ZIP se usa el comando *zip* seguido de la opción -d, el nombre del archivo comprimido y el archivo a eliminar.
~~~
zip -d secuencias.zip secuencia1.txt
~~~ 
El archivo zip ingresado tendrá todos los archivos que originalmente tenía a excepción de *secuencia1.txt*.
## 7. Agregar archivo a un archivo ZIP
Si se desea argregar un archivo específico a un archivo ZIP se usa el comando *zip* seguido de la opción -u, el nombre del archivo comprimido y el archivo a agregar.
~~~
zip -u secuencias.zip secuencia4.txt
~~~ 
El archivo zip ingresado tendrá todos los archivos que originalmente tenía y un nuevo archivo *secuencia4.txt*