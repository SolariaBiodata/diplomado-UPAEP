# Comando *ssh* 
Este comando es un protocolo de acceso remoto seguro entre dos sistemas sobre una red no segura. La sintaxis correcta de este comando es:
~~~
ssh   usuario  [comando/opción]
~~~
El comando es opcional pero es posible usarlo para ejecutarlo en la máquina remota. Por ejemplo el uso de *ls*:
~~~
ssh   usuariogenérico26@servidorsecuenciador   ls
~~~
También es importante tomar en cuenta que con este comando se requiere de una interfaz y las credenciales de acceso al servidor con el que se dará la conexión. En casos donde se use un sistema que no sea Linux o MacOS, se requiere la instalación de un cliente SSH como en el caso de Windows.
## Casos de usuarios diferentes
Existe la posibilidad que el nombre de tu usuario sea diferente en el servidor remoto a diferencia del que tienes en tu equipo. En este caso, será necesario usar *host* al final de la línea: 
~~~
ssh remote_usuario@remote_host
~~~
A partir de este punto, se pedirá una contraseña para verificar tu identidad.
## Finalizar conexión \(*exit*\)
Tras terminar de realizar las actividades de forma remota, se debe colocar *exit* para terminar con la conexión segura generada por *ssh* y así regresar a la terminal local de tu equipo. 
~~~
exit
~~~
