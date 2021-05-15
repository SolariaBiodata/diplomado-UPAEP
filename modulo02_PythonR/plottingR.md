---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Lenguajes de programación

### Generación de gráficas

<img src="https://soka.gitlab.io/blog/post/2019-10-06-r-tidyverse-intro/images/hex-tidyverse.png" width=150 align=right>
<br>

Una de las grandes ventajas que ofrece `R` es la posibilidad de generar gráficas con una gran versatilidad de funciones. Esto se debe a que el propósito original del lenguaje es ofrecer métodos para el análisis de datos, y una parte esencial del análisis de datos recae en la visualización de los mismos.


#### Gráficas básicas

**Gráfico de una dimensión (_de tiras_)**

La gráfica más sencilla es la gráfica de una sola variable. En `R` se puede generar una gráfica de datos númericos con la función `stripchart`. Esta se puede usar cuando nos interesa revisar datos y comparar sus magnitudes con respecto a una referencia de la recta numérica. 

```R
stripchart(runif(15))
```

Esta gráfica nos permite visualizar el acomodo de una serie de puntos a lo largo de una recta numérica. No obstante es posible realizar ajustes a través de la modificación de parámetros para modificar su comportamiento:

```R
stripchart(runif(15), method="jitter")
stripchart(runif(15), vertical=TRUE)
stripchart(runif(15), vertical=TRUE, method="jitter")
```

El parámetro `method` puede recibir diferentes opciones como `"jitter"`, `"stack"` u `"overplot"` y provoca que los puntos se desplieguen de maneras diferentes.

Por otro lado, usando una función como `title()` podemos agregar información importante a nuestro gráfico una vez que ya se ha generado.

```R
stripchart(runif(15), vertical=TRUE, method="jitter")
title("Prueba de Solaria Biodata")
```

![]()

**Histograma de frecuencias**

Los histogramas permiten visualizar la frecuencia con la que ciertos valores aparecen en el conjunto de datos. Estos nos permiten revisar a grandes rasgos la distribución que adoptan los datos y se pueden invocar mediante la función `hist()`:

```R
hist(rnorm(100))
```

algunos parámetros con los cuales podemos ajustar la visualización de los datos son:

 - `breaks` lo cual permite alterar el número de barras que se despliegan en la gráfica con base en:
  - un vector que indica los puntos específicos para las barras
  - una función que compute los puntos específicos para las barras
  - un solo número que indica el número de barras que se requieren
  - una función para calcular el número de barras que se requieren
  - una clave de tipo `character` que indica el método de visualización, por defecto es `"pretty"`
 - `freq` por defecto es `TRUE`, por lo cual el eje $y$ está en función de la frecuencia, y por tanto, de los conteos de los valores, en cambio con `FALSE` se usa la función de densidad, por lo cual la suma de todas las alturas de las barras en el gráfico debe ser `1`.


```R
hist(rnorm(100), breaks=c(-4,-2,-1,1.5,3,4))
```

**Gráficas de cajas y bigotes (_boxplot_)**

Los diagramas de cajas y bigotes permiten revisar algunos parámetros importantes de la distribución de los datos en una dimensión. Dichos elementos son:

- La mediana de los datos (la línea más llamativa al centro de la gráfica).
- Los cuartiles $1$ y $3$ que delimitan el rectángulo de la _caja_.
- Los _bigotes_ representan valores que se encuentran hasta máximo $1.5$ veces el rango intercuartiles (hacia abajo del cuartil $1$ y hacia arriba del cuartil $3$) o si no hay valores que llegen hasta ese rango, los valores _máximo_ o _mínimo_ respectivamente.
- Los valores extremos _outliers_ son los puntos que se aprecian más allá del rango de los _bigotes_.

Para llamar a la función de graficación se utiliza `boxplot()`:

```R
boxplot(rchisq(100,1))
```

Algunos parámetros que se pueden modificar son los siguientes:

- `range` para modificar el alcance de los _bigotes_.
- `notch` para definir se se genera una muesca para identificar mejor la mediana.

```R
boxplot(rchisq(100,1),notch = TRUE, range=2)
```

**Gráficos de dispersión (dos dimensiones)**

Este tipo de gráficas proveen de una visión panorámica de como se relacionan una pareja de variables. Para ello simplemente se necesita utilizar la función `plot()` y suministrarle parejas de vectores, o datos con dos dimensiones:

```R
x<-sort(runif(100))
y<-rbinom(n=100,size=100,prob=0.3)
plot(x,y)
```
```
df<-data.frame("d1"=x,"d2"=y)
plot(df)
```

En este tipo de gráficas se pueden realizar muchos ajustes, sin embargo se revisarán con mayor profundidad cuando se hablen de los parámetros de ajuste un poco más abajo.


**Gráficas de barras**

Las gráficas de barras son muy útiles para representar los datos ordenados de una matriz, en dicha matriz se representa una cantidad de dos variables categóricas:

```R
mx<-matrix(rbinom(100,100,0.4),5,20)
rownames(mx)<-c("a","b","c","d","e")
colnames(mx)<-1:20
```

Uno de los parámetros más usados es `beside`, por defecto está asignado con `FALSE`, sin embargo si se modifica a `TRUE` en lugar de apilar las barras correspondientes a una misma categoría las coloca lado a lado

```R
barplot(mx)
barplot(t(mx))
barplot(t(mx), beside=TRUE)
barplot(mx, beside=TRUE)
```

**Imágenes por celdas**

Este tipo de imágenes suele ser conveniente para representar relaciones de 3 variables, sin embargo la forma en la que deben acomodarse es en forma de una matriz, donde las columnas representan los valores de la primera dimensión, los renglones representan los valores de la segunda dimensión, y los valores asociados a cada celda de la matriz representan los valores de la tercera dimensión.

```R
image(mx)
```

#### Ajustes generales de graficación

**Parámetros generales de contenido**

Todas las gráficas de `R` se construyen mediante una serie de parámetros que se pueden modificar usando la función `par()`. Cada parámetro se puede modificar usando la estructura `key = val`, donde `key` corresponderá al nombre del parámetro que se desea ajustar, y `val` el valor con el que se desea ajustar dicho parámetro. En la siguiente tabla se describe algunos de los parámetros más comunes de ajuste:


| Parámetro | Descripción | Valor por defecto | Información adicional |
|--|--|--|--|
| `col` | Se usa para definir los colores que se requieren usar en los puntos de datos. | `c("black")` | Revisar sección de colores |
| `bg` | Se definen los colores que se requiere usar como fondo en la gráfica. | `c("white")` | Revisar sección de colores |
| `pch` | Un vector con símbolos o caracteres que se desean utilizar para representar <br>los puntos de datos. Son válidos valores entre `0` - `25` o de tipo `character`.| `c(0)`, `c(1)` | Se puede usar un vector de tipo `character`, en ese caso los puntos <br>usados serán los valores suministrados. En cambio, si se usan valores <br>numéricos, se usarán las [representaciones correspondientes](http://methods.sagepub.com/images/virtual/a-survivors-guide-to-r/10.4135_9781483372310-fig15-3.jpg). |
| `cex` | Sirve para ajustar el factor de escalamiento del tamaño de los puntos. Se usa <br>un vector con valores numéricos. | `1.0` | Si el vector suministrado es menor que el tamaño de los datos, se <br>reciclan valores de este vector. |
| `lty` | Se definen tipos de líneas a través de un vector. | `"solid"`, `1` | Valores aceptados: `0`=`"blank"`, `1`=`"solid"`, `2`=`"dashed"`, <br>`3`=`"dotted"`, `4`=`"dotdash"`, `5`=`"longdash"`, `6`=`"twodash"` |
| `lwd` | Se define el grosor de las líneas a través de un vector. | `1` | Solo se pueden usar números positivos, en algunos dispositivos no se <br>pueden usar valores inferiores a `1`. |
| `bty` | Se define un tipo de _caja_ que rodea la gráfica. | `"o"` | Los valores aceptados son `"l"`, `"7"`, `"c"`, `"c"`, `"u"` o `"]"`.<br>`"n"` suprime la caja. |
| `family` | Se definen la familia de fuente de los textos desplegados en las gráficas. | `""` | Depende de cada máquina, pero valores estándar que se <br>pueden usar son `"serif"`, `"sans"` o `"mono"`. |
| `las` | Se define la orientación de las etiquetas de los ejes. Solo se pueden usar <br>valores enteros `0` - `3`. | `0` | `0` ➡️ siempre paralelo al eje<br>`1` ➡️ siempre horizontal<br>`2` ➡️ siempre perpendicular al eje<br>`3` ➡️ siempre vertical |
| `pty` | Se define la región que puede usar la representación de la gráfica. | `"o"` | Los valores aceptados son `"l"`, `"7"`, `"c"`, `"c"`, `"u"` o `"]"`.<br>`"n"` suprime la caja. |


**Ajustes de información adicional**

Por otro lado, están algunos parámetros que suelen utilizarse para proveer de información adicional en las gráficas a través de leyendas de información:

| Parámetro | Descripción | Valor por defecto | Información adicional |
|--|--|--|--|
| `main` | Se define un título para la gráfica | `NULL` | Se usa un valor de tipo `character` |
| `xlab` | Se define una etiqueta para el eje $x$ | Descripción de la variable | Se usa un valor de tipo `character` |
| `ylab` | SSe define una etiqueta para el eje $y$ | Descripción de la variable | Se usa un valor de tipo `character` |
| `type` | Se usa para modificar el tipo de representación <br>de los datos en el gráfico. | Depende de la función | `p` ➡️ puntos, `l` ➡️ líneas, `b` ➡️ puntos y líneas, <br>`c` ➡️ puntos vacíos y líneas, `n` ➡️ no genera ni puntos ni líneas |
| `xlim` | Se define a través de un vector con dos valores <br>los límites de graficación en el eje $x$ | `NULL` | Por defecto se usa el rango de los valores en el eje $x$ |
| `ylim` | Se define a través de un vector con dos valores <br>los límites de graficación en el eje $y$ | `NULL` | Por defecto se usa el rango de los valores en el eje $y$ |

#### Colores

En `R` hay diversas maneras de representar colores,

- Mediante claves que representan ciertos colores p. e. `"red"`, `"blue"`, [etc](http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf).
- Mediante _códigos hexadecimales de color_ p. e. `"#FFFFFF"` o `"#FF3300"`. En este caso los códigos hexadecimales representan el triplete de valores de los colores primarios aditivos _Red_ _Green_ _Blue_ que se desean incorporar en el color. El `#` representa la conversión hexadécimal (la cual se compone de 16 símbolos: `0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `A`, `B`, `C`, `D`, `E` y `F`). Estos se combinan en parejas para generar hasta $256$ diferentes saturaciones de cada uno de los tres componentes (**rojo** para los primeros $2$ caracteres, **verde** para los siguientes $2$ caracteres y **azul** para la última pareja de caracteres).
- Mediante la función `rgb()`, la cual requiere de un vector de 4 valores numéricos con valores entre `0-1`, los tres primeros valores corresponden a los valores de saturación de los colores aditivos primarios, el cuarto valor se conoce como valor de transparencia `alpha`, el cual cuando es `1` se genera un color totalmente sólido, en cambio el valor de `0` genera un color totalmente transparente.


```R
plot(df, main="Prueba de Solaria", xlab="datos de la dimension 1", ylab="datos de la dimension 2", pch=20, col=rgb(1,0.1,0.8,0.1))
```

**Paletas de color**

Existen algunas paletas de colores por defecto que se pueden utilizar. Estas paletas de colores son funciones que regresan vectores con los colores deseados:

```R
colores<-rainbow(7)
colores
colores<-topo.colors(3)
```

A continuación un ejemplo de uso:

```R
plot(df, main="Prueba de Solaria", xlab="datos de la dimension 1", ylab="datos de la dimension 2", pch=20, col=heat.colors(25))
```


[Menú Principal](./)

[Atras](./estadisticaR)

[Siguiente](./#)
