# Comando *vi*
Este comando es un editor de texto basado en la terminal, por lo que es útil para crear y editar archivos desde la terminal. Tiene dos modos de operación, incluyendo el modo de comando y el modo de inserción. 

## 1. Abrir un archivo 
Se ejecuta el comando *vi* seguido del nombre del archivo.
~~~
vi hitBRCA1.txt
~~~
Si el archivo existe, se abrirá el archivo desde la terminal y se mostrará el contenido. No obstante, si éste no existe, se creará uno nuevo y se abrirá en el editor de la terminal. 
## 2. Edición del archivo y modos de operación
Como se había mencionado anteriormente, *vi* tiene dos modos de operación: 
1. Modo de comando

    Por default este es el modo que rige al editor cuando se ejecuta el comando *vi*, y como su nombre lo dice, la edición del archivo depende de la utilización de comandos específicos. 
2. Modo de inserción 

    Este modo es utilizado para insertar texto. Para ingresar texto antes del cursor, se presiona la tecla `i`, en cambio, si se quiere insertar después de éste se presiona la tecla `a`.
Si se quiere cambiar del modo de inserción al modo de comando, presiona la tecla `Esc`. 
## 3. Navegar por el archivo
Para navegar a través del documento:
- Presiona la tecla `↓` para moverte hacia abajo línea por línea.
- Presiona la tecla `↑` para moverte hacia arriba línea por línea.
- Presiona las teclas `←` y `→` para moverte de manera horizontal dentro de las líneas. 
- Presiona `0` para ir al principio de la línea.
- Presiona `$` para ir al final de la línea.
- Presiona `G` para ir al final del archivo.
- Presiona `gg` para ir al principio del archivo.
## 4. Guardar cambios 
Para guardar los cambios que se le han realizado al archivo, puedes utilizar los siguientes comandos: 
- `:wq` o `ZZ`: Guarda los cambios y sale de *vi*.
- `:w`: Guarda los cambios sin salir de *vi*.
- `:q!`: Sale de *vi* sin guardar cambios.
## 5. Otros comandos 
- `dd`: Elimina la línea donde está el cursor.
- `yy`: Copia la línea donde está el cursor.
- `p`: Pega la línea copiada o eliminada.
- `/texto`: Busca el texto especificado hacia adelante en el archivo.
- `?texto`: Busca el texto especificado hacia atrás en el archivo.
- `u`: Deshace el último cambio.
- `Ctrl + R`: Rehace el último cambio deshecho.


**Nota:**
*La versión más reciente de este comando, vim, no funciona en WSL*