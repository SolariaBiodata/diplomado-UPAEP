# Comando *more*
Este comando es una herramienta de visualización de archivos de texto en la terminal, permitiéndonos visualizar su contenido en segmentos o ventanas. La sintaxis básica de *more* es la siguiente:
~~~
more [nombre_archivo]
~~~
## 1. Visualizar el contenido de un archivo de texto
Se ejecuta el comando *more* seguido del nombre del archivo, obteniendo como salida el contenido del archivo en la terminal.
~~~
more alineamientos.txt
~~~
La navegación del archivo en la terminal sigue las siguientes teclas : 
- Presiona la tecla `Espacio ␣` o `Enter ↵` para avanzar una página.
- Presiona la tecla `B` o `Backspace ⌫` para retroceder una página.
- Presiona la tecla `↑` para moverte hacia arriba en el contenido.
- Presiona la tecla `↓` para moverte hacia abajo en el contenido.

Al llegar al final del documento, la interfaz del comando more se cerrará devolviendo el prompt. Si se desea salir de la interfaz antes de llegar al final se puede hacer con la tecla `q`.
## 2. Opción +num
Muestra el texto después del número de línea especificado. 
~~~
more +5 alineamientos.txt
~~~
Arrojando como salida el contenido de la línea 5 hasta el final del documento.