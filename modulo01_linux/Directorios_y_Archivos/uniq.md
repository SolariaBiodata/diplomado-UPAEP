# Comando *uniq*
Este comando es utilizado para encontrar o eliminar líneas duplicadas en archivos de texto. La sintaxis básica de *uniq* es la siguiente:
~~~
uniq [nombre_archivo]
~~~
Para este comando ocuparemos el archivo de texto hitBRCA1.txt obtenido del blast de una sección del gen BRCA1.
## 1. Encontrar líneas duplicadas
Se ejecuta el comando *uniq* seguido del nombre del archivo. Se obtendrá como salida la impresión de las líneas únicas, reduciendo las líneas repetidas consecutivas a una sola.
~~~
uniq hitBRCA1.txt
~~~
## 2. Impresión de líneas únicas y no duplicadas
Se ejecuta el comando *uniq* seguido de la opción *-u* y el nombre del archivo. Se obtendrá como salida la impresión de las líneas únicas, es decir, solamente se visualizarán aquellas líneas que están presentes 1 vez en el archivo.
~~~
uniq -c hitBRCA1.txt
~~~
## 3. Contar líneas duplicadas
Se ejecuta el comando *uniq* seguido de la opción *-c* y el nombre del archivo. Se obtendrá como salida la impresión del número de veces que está repetida la línea junto con la línea respectiva. Para contabilizar líneas repetidas con un número mayor a 1, éstas tendrán que ser consecutivas dentro del archivo.
~~~
uniq -c hitBRCA1.txt
~~~
## 4. Omitir caracteres iniciales 
Si necesitas omitir un número específico de caracteres iniciales al comparar líneas, utiliza la opción *-s* seguida del número de caracteres a ignorar.
~~~
uniq -s 30 hitBRCA1.txt
~~~
El comando ignorará los primeros 30 caracteres antes de empezar a comparar las líneas.
## 5. Omitir caracteres finales 
Si necesitas omitir un número específico de caracteres finales al comparar líneas, utiliza la opción *-w* seguida del número de caracteres a ignorar.
~~~
uniq -w 20 hitBRCA1.txt
~~~
## 6. Omitir campos 
Si necesitas omitir un número específico de campos/secciones al comparar líneas, utiliza la opción *-f* seguida del número de campos a ignorar.
~~~
uniq -f 6 hitBRCA1.txt
~~~
## 7. Visualización de líneas duplicadas
Se ejecuta el comando *uniq* seguido de la opción *-d* y del nombre del archivo, obteniendo como salida la impresión de líneas que aparecen repetidas en el archivo. 
~~~
uniq -d  hitBRCA1.txt
~~~