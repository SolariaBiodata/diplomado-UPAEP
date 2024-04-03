# Comando *mv* 
El comando *mv* que significa move, permite mover o renombrar archivos a una ubicación distinta. Su diferencia con el comando copy es que el archivo es removido de su ubicación original. Su sintaxis correcta es:
~~~
mv [opciones] /origen/ /destino/
~~~
El siguiente ejemplo muestra el movimiento de ubicación desde el directorio de inicio \(~\) hacia el directorio de */alineamiento/*:
~~~
mv ~/secuenciasrna /alineamiento/secuenciasrna/
~~~
## Opciones de *move* 
Confirmación de sobreescribir archivos \(*-i*\)
Funciona para evitar sobreescribir datos accidentalmente al destino al que se van a mover.
Indicar detalles de copia \(*-v*\)
Se indica a detalle el movimiento de cada archivo. Permite confirmar que se movió lo que se buscaba.
## Renombrando archivos con *move*
 Este es otro ejemplo donde se renombra un archivo con el comando move:
~~~
mv secuenciasA secuenciasB
~~~
