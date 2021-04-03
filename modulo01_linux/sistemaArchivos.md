![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](../)

## Introducción a Linux

### Sistemas de Archivos

#### Estructura jerárquica y navegación

A continuación se muestra un ejemplo de la estructura de directorios. Es de notar que existe un directorio que contiene todos los directorios en nuestro sistema de archivos, a este directorio se le conoce como _raíz_ o _root_ y se representa con un solo carácter `/`

![](https://drive.google.com/uc?id=1eDOHlrE7d8aVXW_9Q7Vi-moJUj54xYkU&export=download)

Cada fichero puede ser distinguido de los demás porque existe una _ruta_ o _path_ que expresa el camino que se tiene que recorrer en la estructura de directorios desde la _raíz_. Para conocer la _ruta_ basta unir de izquierda a derecha los nombres de los directorios que se necesitan para llegar al fichero deseado, separándose por el carácter `/` el cual denota contención. En este ejemplo, la _ruta_ del directorio sería `/home/patrick`.

Es importante destacar que existen abreviaturas (también conocidos como comodines) que representan diversos directorios en la estructura:

| Comodín | Significado |
|--|--|
| `.` | Directorio actual |
| `..` | Directorio padre |
| `~` | Directorio "Home" _(directorio en donde se inicia sesión)_ |

Mediante estos comodines se pueden representar rutas con cadenas de texto más pequeñas. Por otro lado, es muy importante destacar que cuando se representa una _ruta_ de un fichero desde la _raíz_ se entiende como la **ruta absoluta** del fichero. Es posible también trazar _rutas_ expresando de manera implícita la _ruta_ del directorio de trabajo actual, para ello el sistema de archivos utiliza la _ruta del directorio actual_ como prefijo de la _ruta_ que nosotros expresamos. Esta forma de expresar una _ruta_ se conoce como la **ruta relativa**:

Por ejemplo, cuando te encuentras en el directorio `/home/patrick`, la ruta `school` contiene un directorio cuya **ruta absoluta** es `/home/patrick/school`.

| _Ruta actual_ | _Ruta relativa_ | concatenación de rutas | **Ruta absoluta** |
|--|--|--|--|
| **`/home/patrick`** | **`school`** | **`/home/patrick/school`** | **`/home/patrick/school`** | 
| `/home/bill/school` | `../books` | `/home/bill/school/../books` | `/home/bill/books` |
| `/home/patrick` | `.` | `/home/patrick/.` | `/home/patrick` |



#### Comandos de navegación

En este tema, revisamos los comandos  `pwd` `cd`  y  `ls`

>  Estos comandos, sirven para movernos dentro de la terminal y obtener cierta información

`pwd` -  Ubicación en el espacio de trabajo, la salida contiene la _ruta_ del directorio de nuestro espacio de trabajo actual 

`cd`  -  Cambio de directorio, se tiene que usar la _ruta_ de un directorio como argumento para mover el espacio de trabajo al nuevo directorio 

`ls`  -  Visualizar el contenido del directorio 

[Menú Principal](../)
[Atras](#)
[Siguiente](./comandosTerminal)
