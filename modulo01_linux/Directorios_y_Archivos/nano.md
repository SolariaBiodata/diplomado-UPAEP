# Comando *nano*
Este comando es una herramienta de edición de texto basada en la terminal, por lo que es útil para crear y editar archivos desde la terminal. 

## 1. Abrir un archivo 
Se ejecuta el comando *nano* seguido del nombre del archivo.
~~~
nano hitBRCA1.txt
~~~
Si el archivo existe, se abrirá el archivo desde la terminal y se mostrará el contenido. No obstante, si éste no existe, se creará uno nuevo y se abrirá en el editor de la terminal. 
## 2. Edición del archivo abierto y navegación
Para navegar a través del documento:
- Presiona la tecla `↓` para moverte hacia abajo línea por línea.
- Presiona la tecla `↑` para moverte hacia arriba línea por línea.
- Presiona las teclas `←` y `→` para moverte de manera horizontal dentro de las líneas. 

 La edición del texto funciona como cualquier otro editor de texto, así que puedes escribir, modificar y borrar. 
## 3. Guardar cambios 
Para guardar los cambios que se le han realizado al archivo, presiona `Ctrl + O`. Posteriormente, presiona `Enter ↵` para confirmar el nombre del archivo y guardarlo.
## 4. Salir de nano 
Para salir del editor nano, presiona `Ctrl + X`. Si has realizado cambios, el editor te preguntará si deseas guardar los cambios, en donde podrás presionar   `Y` para guardar los cambios o `N` para no guardarlos. 
## 5. Búsqueda 
`Ctrl + W` realiza una búsqueda en el archivo. Después de haber presionado el shortcut, en la parte inferior del editor de texto se te pedirá introducir la palabra que quieres buscar, por lo que la escribirás y presionarás `Enter ↵`. Como resultado, el cursor se posicionará en la primera letra de la primer palabra que coincida y encuentre dentro del texto.
## 6. Reemplazo
- `Ctrl + \` realiza una búsqueda y reemplazo en el archivo. Después de haber presionado el shortcut, en la parte inferior del editor del texto se te pedirá introducir la palabra que quieres reemplazar, por lo que la escribirás y presionarás `Enter ↵`. Posteriormente, se te pedirá introducir la palabra con la que las coincidencias van a ser reemplazadas. Un ejercicio interesante sería reemplazar las timinas del archivo de un transcrito de un gen por uracilos.
## 7. Otros shortcuts 
- `Ctrl + G`: Muestra la ayuda y enlista los shortcuts de teclado disponibles.
- `Ctrl + K`: Elimina la línea en la que actualmente nos encontramos posicionados.
- `Ctrl + U`: Pega la línea que hemos eliminado con anterioridad en la posición actual.
- `Ctrl + R`: Abre un archivo y se inserta en la posición del cursor actual.
- `Alt + W`: Busca la siguiente coincidencia de la palabra que previamente has ingresado con `Ctrl + W`.
- `Alt + Q`: Busca la anterior coincidencia de la palabra que previamente has ingresado con `Ctrl + W`.
- `Ctrl + J`: Justifica el párrafo en donde se encuentre el cursor, o bien, el texto seleccionado.  
- `Alt + U`: Deshacer un cambio.
- `Alt + E`: Rehacer un cambio.
- `Alt + R`: Reemplaza el texto, así que primero ingresarás el texto a buscar y luego el texto con el que quieres reemplazar éste. 
## 8. Hacer un backup 
Se ejecuta el comando *nano* seguido de la opción *-B* y del nombre del archivo.
~~~
nano -B BRCA1transcript.txt
~~~
Esto nos generará un archivo de respaldo de la versión original de BRCA1transcript.txt antes de ser modificada. 
## 9. Visualizar el cursor mientras navegas 
Se ejecuta el comando *nano* seguido de la opción *-c* y del nombre del archivo.
~~~
nano -c BRCA1transcript.txt
~~~
Así podremos ver el cursor en todo momento, lo que facilita la navegación por el archivo en el editor de texto. 