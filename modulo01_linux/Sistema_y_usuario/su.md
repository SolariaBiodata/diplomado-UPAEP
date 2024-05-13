# Comando *su* 
Este comando permite asumir la identidad de otro usuario en una sesión activa siempre y cuando se tenga la contraseña. La sintaxis correcta de este comando es:
~~~
R4ndi@SEQ:~$    su
Password: ********
~~~
## Nuevo entorno con otro usuario *su -*
Al igual que el anterior, se utiliza la identidad de otro usuario cuando se tiene la diferencia que con esta opción se genera un nuevo entorno. Se puede explicar que esta opción asume un inicio de sesión en la cuenta de este usuario. Ejemplo:
~~~
R4ndi@SEQ:~$  whoami
R4ndi

R4ndi@SEQ:~$  su -
Password: ********

root@SEQ:~# whoami
root
~~~
Esta opción debe usarse con cuidado debido a que el otro usuario tiene acceso a poder ejecutar desde su cuenta. 

## Uso de argumento *- c*
Esta opción permite ejecutar un argumento tras realizar el cambio de usuario. Ejemplo: 
~~~
R4ndi@SEQ:~$ su invitado -c 'echo $LOGNAME'
Password:
invitado
~~~

## Alternativa segura en cambio de usuario *sudo*
Este comando permite utilizar los privilegios *root* o del otro usuario de forma segura sin necesidad de exponer contraseñas. Junto con *su*, se permitirá usar los privilegios del otro usuario sin necesidad de contraseña. Ejemplo:
~~~
R4ndi@SEQ:~$ sudo su
[sudo] password for johndoe:
root@SEQ:/home/johndoe#
~~~
