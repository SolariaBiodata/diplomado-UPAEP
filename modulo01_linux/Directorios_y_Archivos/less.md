# Comando *less*
Este comando, al igual que el comando *more*, es una herramienta de visualización de archivos de texto en la terminal, permitiéndonos visualizar su contenido en segmentos o ventanas. No obstante, a diferencia del comando *more*, éste nos permite visualizar el contenido en formato paginado y con una interacción más avanzada en el proceso de inspección. La sintaxis básica de *less* es la siguiente:
~~~
less [nombre_archivo]
~~~
## Visualizar el contenido de un archivo de texto
Se ejecuta el comando *less* seguido del nombre del archivo, obteniendo como salida el contenido del archivo en la terminal.
~~~
less alineamientos.txt
~~~
La navegación del archivo en la terminal sigue las siguientes teclas : 
- Presiona la tecla `↓` para moverte hacia abajo línea por línea.
- Presiona la tecla `↑` para moverte hacia arriba línea por línea.
- Presiona la tecla `Espacio ␣`, `Enter ↵` o `Page Down ⇟` para avanzar una página.
- Presiona la tecla `B` o `Page up ⇞` para retroceder una página.
- Para ir al principio del archivo, presiona la tecla `Home ⇱` o `Inicio`.
- Para ir al final del archivo, presiona la tecla `End ⇲` o `Fin`.

Al llegar al final del documento el prompt no regresa de manera automática, es necesario salirse de la interfaz con la tecla `q`. 