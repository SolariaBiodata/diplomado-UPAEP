# Comando *paste* 
Este comando fusiona líneas de archivos que fueron especificados como argumentos de entrada. La sintaxis correcta es la siguiente:
~~~
paste [opción]... [archivo]...
~~~
El siguiente ejemplo cuenta con dos archivos creados por separado conteniendo distinta información:
~~~
cat	numerosA.txt
1
2
3
cat	listaA.txt
ADN
ARN
Dogma Central
~~~
Después se usa el comando para unir ambos obteniendo lo siguiente:
~~~
paste numerosA.txt listaA.txt
1	ADN
2	ARN
3	Dogma Central
~~~
## Delimitadores
En caso de ser necesario aplicar delimitadores entre los contenidos de este archivo, se debe utilizar la opción *-d* seguido de lo que se aplicará, por ejemplo:
~~~
paste  -d  . numerosA.txt listaA.txt
1    .    ADN
2    .    ARN
3    .    Dogma Central
~~~
También es posible especificar múltiples delimitadores, solo es necesario utilizar entre ‘’ y los delimitadores seguidos. Por ejemplo:
~~~
paste  -d  ‘.-’ numerosA.txt listaA.txt
1    .   -   ADN
2    .   -   ARN
3    .   -   Dogma Central
~~~
## Forma serial 
Si se busca cambiar la forma en que las listas son fusionadas de forma de columnas a filas, se debe aplicar la opción *-s* \(forma serial\), por ejemplo:
~~~
paste  -s  numerosA.txt listaA.txt
   1		   2		            3
ADN		ARN		Dogma Central
~~~
