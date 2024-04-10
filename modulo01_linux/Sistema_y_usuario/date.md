# Comando *date* 
Es un comando que muestra la fecha y hora actual. La sintaxis se ve de esta forma:
~~~
date
~~~
## Opción para fecha del día siguiente
Es posible obtener fecha y hora del día posterior. La sintaxis sería de la siguiente forma:
~~~
date -d “tomorrow”
~~~
## Opción para una fecha del día anterior
También es posible usar un comando para obtener la fecha y hora del día anterior. La sintaxis sería de la siguiente forma:
~~~
date -d “yesterday”
~~~
## Opción de formato específico
Además de las otras opciones, es posible utilizar un signo \(*+*\), para indicar que la fecha se obtenga en un formato definido por el usuario.
~~~
date +FORMATO
~~~
Unido a esto, si necesario mes, día y año, se debe utilizar, *%m*, *%d* y *%y* respectivamente para indicarlo en el orden que se requiera. También se puede indicar la fecha con la alternativa *%D* para la fecha y *%T* solo para la hora. El año en cuatro dígitos es con la opción *%Y*. Aquí tenemos un ejemplo de una fecha en un orden mes, día y año en cuatro dígitos:
~~~
date +”%m-%d-%Y”
05-10-2022
~~~
