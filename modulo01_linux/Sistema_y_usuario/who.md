# Comando *who* 
El comando *who* proporciona información sobre aquéllos usuarios que están conectados al sistema así como información del nivel de ejecución y cuándo se arrancó el sistema. Existen distintas opciones que despliegan la información de distintas formas.
## Opción de encabezados *-H* 
Esta opción ayuda a mostrar encabezados en cada columna de información. Se incluye el usuario, la terminal desde donde trabaja y fecha y hora en que éste se conectó al sistema. Ejemplo de la sintaxis:
~~~
who -H
USUARIO	    LÍNEA		TIEMPO		COMENTARIO
usuarioA	fgrj97		2022-08-26 12:44	(:0)
usuarioB	adn/1		2022-08-26 15:45	(:0)
usuarioC	adn/2		2022-08-26 18:08	(:0)
~~~
También es posible incluir el tiempo de inactividad de un usuario bajo *-Hu* siendo desplegado el tiempo a un lado de la hora, si se muestra un \(*.*\) el usuario está activo mientras que el inactivo lleva 15 minutos sin ejecutar nada.
~~~
who -H
USUARIO 	LÍNEA		TIEMPO			COMENTARIO
usuarioA	fgrj97		2022-10-12 12:44	antig	(:0)
usuarioB	adn/1		2022-10-12 15:45	00:15	(:0)
usuarioC	adn/2		2022-10-12 18:08	    .	(:0)
~~~
## Opción de usuario en terminal 
Esta opción en despliega el usuario presente en la actual terminal. Esto es posible de estas formas:
~~~
who -m
usuarioA  adn/1  2023-03-04 18:08 (:0)
~~~
~~~
who am i
usuarioA  adn/1  2023-03-04 18:08 (:0)
~~~
~~~
whoami
usuarioA
~~~
## Opción de información de inicio del sistema
La opción \(*-b*\) permite ver la fecha y hora en que se inició el sistema. Ejemplo:
~~~
who -b
    arranque del sistema 2020-08-26 12:45
~~~
También es posible ver el nivel de ejecución actual del sistema y el anterior con la opción \(*-r*\). El siguiente ejemplo muestra primero el nivel de ejecución actual y que el anterior fue el A:
~~~
who -r
    ‘run-level' 3 2023-06-20 10:21                   último=A
~~~
Finalmente, para ver una lista resumida de usuarios conectados y el número total de esos usuarios se usa la opción \(*-q*\). Ejemplo:
~~~
who -q
usuarioA usuarioB
Nº de usuarios=2
~~~
