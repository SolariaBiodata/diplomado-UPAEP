# Comando *chmod* 
Este comando tiene el fin de modificar permisos además de admitir representaciones numéricas y simbólicas. En el siguiente ejemplo, se tiene al comando con la sintaxis correcta, aquí se le está dando un permiso de escritura al propietario.
~~~
chmod u+w “archivo”
~~~
La *u* significa el propietario, seguido se tiene un signo *+* y que junto con otros signos \(* - ó =*\), agregan, elimina o definen permisos respectivamente.
## Grupos de archivos \(*g*\) 
Esta opción asigna grupos, mientras que *o* representa a otros y *a* representa a todos los usuarios. 
~~~
chmod go-rwx secuencias
~~~
