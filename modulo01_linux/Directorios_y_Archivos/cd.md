# Comando *cd*
"CD" viene del inglés *Change Directory*, por lo que este comando es una herramienta de navegación utilizada para cambiar de directorio en el sistema de archivos. La sintaxis básica de cd es la siguiente:
~~~
cd [nombre_directorio]
~~~
## 1. Cambiar al directorio de comienzo 
El directorio de comienzo \(Home directory\) es aquel en el que inicias cuando abres la terminal en Linux. Al ejecutar el siguiente comando, te llevará al directorio de comienzo.
~~~
cd
~~~
O bien, podemos ejecutar: 
~~~
cd ~
~~~
## 2. Navegar dentro de un subdirectorio
Se remplaza el *nombre_directorio* con el directorio al que queramos cambiar. Si queremos cambiar al directorio con el nombre *Alineamientos*, entonces:
~~~
cd Alineamientos
~~~
Si el nombre del directorio contiene espacios, es necesario encerrar entre comillas el nombre del directorio.
~~~
cd "Alineamientos Bacillus"
~~~
Podemos verificar que hemos cambiado de directorio ejecutando el comando *pwd*, el cual nos indica el directorio actual.
## 3. Cambiar al directorio raíz \(Root directory\)
El directorio raíz es aquel que ocupa el primer lugar en la jerarquía del sistema de archivos. Se ejecuta añadiendo un */* en el argumento del comando.
~~~
cd /
~~~
## 4. Cambiar al directorio padre 
El directorio padre es aquel que contiene al directorio actual. Para ello, se ejecuta el comando añadiendo *..* en el argumento.
~~~
cd ..
~~~
## 4. Cambiar al directorio que visitaste anteriormente
Se ejecuta el comando añadiendo *-* en el argumento.
~~~
cd -
~~~
## 5. Cambiar a directorio específico
Si conoces la ruta desde el directorio raíz hasta el directorio al que deseas ingresar, el comando se ejecuta añadiendo la ruta completa del directorio como argumento. Si quisiéramos ingresar al directorio *Alineamientos* que se encuentra en el directorio de *Secuencias*, último que a su vez se encuentra en el directorio *Metagenomica*, el cual se encuentra en el directorio raíz:
~~~
cd /Metagenomica/Secuencias/Alineamientos
~~~
