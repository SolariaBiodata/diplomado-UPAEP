---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Lenguajes de programación

### Estructuras de R 

Cuando trabajamos con **R** procesamos objetos que contienen datos. Cada uno de esos objetos tiene una estructura particular, sin embargo existen algunas propiedades estructurales de los objetos que son consecuencia de sus características. En términos generales podemos clasificar las estructuras de datos en R con la siguiente tabla.

| Dimensiones | Homogéneas | Heterogénas |
|----------|-------------|-------------|
| $$1$$ |  Vector	| Lista |
| $$2$$ | Matriz	| Data frame |
| $$n$$	|  Arreglo	| |

#### Vectores

Las variables pueden contener diferentes tipos de valores, no obstante, otro componente que no se ha mencionado es que los valores pueden tener una estructura que permite diferentes tipos de manipulación.

Pensemos en un tipo de dato que ya observamos _cadenas de caracteres_. Este tipo de dato representa la consecución de diferentes valores de tipo `character`, mismos que siguen un orden definido:

`solaria` es un ejemplo de una cadena de los caracteres `s`, `o`, `l`, `a`, `r`, `i`, `a`. Se puede apreciar que cada uno de los caracteres representa una posición, por ejemplo `s` esta en la posición `1`, la `o` en la `2`, y así sucesivamente. Este ejemplo sirve muy bien para ilustrar el concepto de los _arreglos_ de valores.

En R, los _arreglos_ de valores son conocidos como **vectores**. Estos son colecciones ordenadas de datos del mismo tipo. 

Para generar un vector es necesario usar la función `c()`, la cual recibe como parámetros cada uno de los elementos en el orden deseado que se necesitan asignar a una variable.

```R
c("2","solaria")
c(3,4,1)
c(4,3i)
c(T,FALSE)
```
```R
'2''solaria'
341
4+0i 0+3i
TRUE FALSE
```

Cabe mencionar que debido al orden de los elementos de un vector, es posible acceder a los elementos de un vector. Para ello se usan los índices del vector, los cuales representan las posiciones en el arreglo de cada uno de los elementos. En R, a diferencia de muchos lenguajes de programación se empieza con el índice `1`. Para acceder a un valor se debe usar el operador de indexación `[]`, donde utilizamos el valor del índice dentro del operador. `[1]` representa el primer elemento.

```R
c("Solaria","Biodata")[2]
```
```R
'Biodata'
```

**Métodos de generación de vectores**

Asimismo, se pueden generar vectores con secuencias regulares, para ello es indispensable usar el operador `:`:

`1:4` equivale a `c(1,2,3,4)`

también se puede usar la función `seq()` la cual recibe como parámetros, el valor inicial, el valor final y el incremento deseado:

```R
seq(3,21,3)
```

Otro mecanismo implementado en R para generar vectores es a través de la función `rep()` la cual requiere de al menos 2 argumentos, el primero es un elemento que se desea replicar, el segundo incluye un factor de veces que se desea repetir.

```R
rep(c(1,2),4)
rep(c(2,3,1),each=4)
rep(c("s", "b", "d"), times=c(2,1,4))
```
```R
1 2 1 2 1 2 1 2
2 2 2 2 3 3 3 3 1 1 1 1
's' 's' 'b' 'd' 'd' 'd' 'd'
```
Un método muy importante es la generación de números aleatorios. En R es muy fácil generar vectores con números aleatorios.

| Función | Descripción | Ejemplo |
|--|--|--|
| `runif()` | Recibe como parámetro la cantidad de elementos que se desea que tenga el vector de números aleatorios, los cuales son seleccionados de una distribución uniforme | ![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Uniform_Distribution_PDF_SVG.svg/320px-Uniform_Distribution_PDF_SVG.svg.png) |
| `rnorm()` | Recibe como parámetro la cantidad de elementos que se desea que tenga el vector de números aleatorios, los cuales son seleccionados de una distribución normal | ![](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Standard_deviation_diagram.svg/320px-Standard_deviation_diagram.svg.png) |
| `sample()` | Recibe como parámetros, un vector con elementos, la cantidad de elementos que se desea obtener, como tercer parámetro opcioonal se define si el muestreo es con remplazo | ![](https://upload.wikimedia.org/wikipedia/commons/b/bf/Simple_random_sampling.PNG) |

**Aritmética de vectores**

R tiene una gran ventaja frente a otros lenguajes: los operadores aritméticos se pueden aplicar de manera directa a los vectores, siempre y cuando sean de tipo numérico o lógico. 

```R
v1<-1:12
v2<-rep(3,12)
v1+v2
```
```R
4 5 6 7 8 9 10 11 12 13 14 15
```
Cuando se opera con vectores de diferentes longitudes, el vector más pequeño se recicla:

```R
v1<-1:12
v2<-sample(v1,3)
v2
v1+v2
```

```R
12 11 7
13 13 10 16 16 13 19 19 16 22 22 19
```

En R todas las variables son tratadas como vectores, lo cual es muy importante ya que diferentes funciones aritméticas que operan con valores únicos (conocidos como _escalares_) operan en vectores, por ejemplo `sqrt`, `exp`, `log`, `sin`, `abs`, `round`, etc.

**Funciones de vectores**

Como R está orientado al cálculo estadístico, existen muchas funciones que operan sobre vectores numéricos de manera nativa.

| Función | Descripción |
|--|--|
| `mean` | Calcula la media aritmética de los elementos $$\frac{1}{n}\sum_{i=1}^{n}x_{i}$$ |
| `median` | Calcula la mediana de los elementos |
| `var` | Calcula la varianza muestral de los elementos $$\frac{1}{n}\sum_{i=1}^{n}(x_{i} - \bar x )^{2}$$ |
| `sd` | Calcula la desviación estándar de los elementos $$\sqrt {\frac{1}{n-1}\sum_{i=1}^{n}(x_{i} - \bar x )^{2}}$$ |
| `max` | Obtiene el elemento con el valor más alto |
| `min` | Obtiene el elemento con el valor más bajo |
| `range` | Obtiene un vector `c(min(),max())` |
| `sum` | Calcula la suma de los elementos $$\sum_{i=1}^{n}x_{i}$$ |
| `prod` | Calcula el producto de los elementos $$\prod_{i=1}^{n}x_{i}$$ |
| `cumsum` | Calcula la suma acumulada de los elementos |
| `cumprod` | Calcula el producto acumulado de los elementos  |
| `sort` | Ordena los elementos, por defecto en orden ascendente  |
| `rev` | Regresa los elementos en el orden inverso  |

También existen funciones lógicas aplicables a vectores a través de operadores lógicos. En este caso las evaluaciones se pueden observar con un ejemplo:

```R
"Solaria" == c("Todos","somos","Solaria","Biodata")
rnorm(10)>0
sum("Solaria" != c("Todos","somos","Solaria","Biodata"))
```

```R
FALSE FALSE TRUE FALSE
FALSE FALSE FALSE FALSE TRUE FALSE FALSE FALSE TRUE TRUE
3
```

Por lo cual los operadores lógicos `&`,`|`,`!` se vuelven muy relevantes. Pensemos en dos vectores

```R
A<-( FALSE, FALSE, TRUE , FALSE )
B<-( TRUE, FALSE, FALSE, TRUE )
```

veamos como funcionan estas operaciones:

| `!A` | `A` | `B` | `A&B` | `A|B` |
|--|--|--|--|--|
| **`TRUE`** | `FALSE` | `TRUE` | **`FALSE`** | **`TRUE`** | 
| **`TRUE`** | `FALSE` | `FALSE` | **`FALSE`** | **`FALSE`** | 
| **`FALSE`** | `TRUE` | `FALSE` | **`FALSE`** | **`TRUE`** | 
| **`TRUE`** | `FALSE` | `TRUE` | **`FALSE`** | **`TRUE`** | 

Existen funciones muy utiles para trabajar con vectores lógicos:

| Función | Descripción |
|--|--|
| `all` | Evalua si todos los elementos cumplen una condición |
| `any` | Evalua si almenos un elemento cumple una condición |
| `which` | Regresa un vector con lo índices de los elementos que cumplen una condición |

Así funcionan:

```R
v<-c(2,4,6,12,15)
all(v %% 2 == 0)
any(v %% 2 == 0)
which(v > 5)
```
```R
FALSE
TRUE
3 4 5
```

Finalmente, existe una operación muy útil `%in%` la cual evalúa si un elemento está contenido en un vector:

```R
"Solaria" %in% c("solbio","Solaria","biodata")
"Solaria" %in% c("solbio","solaria","biodata")
```
```R
TRUE
FALSE
```

**Indexación**

Es posible acceder a elementos de un vector usando el operador `[]`, sin embargo es importante resaltar que podemos acceder a los elementos de un vector a través de otro vector de índices. En el ejemplo básico, nuestro vector corresponde a un vector con un elemento.

Debido a ello es posible acceder a diversos elementos de un vector mediante un vector de índices con números positivos:

- `v[c(2,5)]` accede al segundo y quinto elemento del vector `v`
- `v[4:6]` accede a los elementos con índices `4`, `5` y `6`
- `v[c(1, 2, 2, 4)]` accede a los elementos correspondientes, y se repite uno de ellos

También es viable utilizar la indexación para asignar nuevos valores en elementos del vector.

Una de las grandes ventajas de la indexación es que podemos utilizar un vector de índices negativos, los cuales, se interpretan como exclusión de elementos.

```R
sbio<-c("Todos","somos","Solaria","Biodata")
sbio[c(-2,-4)]
```
```R
'Todos' 'Solaria'
```

#### Matrices y arreglos

Las matrices pueden ser descritas como vectores multidimensionales. Al igual que un vector, únicamente pueden contener datos de un sólo tipo, pero además de largo, tienen más dimensiones.

Se requiere utilizar la función `matrix()` para generar una matriz:

```R
matrix(1:5)
```
Sin embargo, podemos definir las dimensiones

```R
matrix(1:20, ncol=6, nrow = 4)
```

las matrices, al igual que los vectores, tienen la propiedad de que los valores individuales pueden ser accedidos mediante la **indexación**. En el caso de las matrices, es conveniente conceptualizarlas como vectores compuestos de vectores. Por ese motivo es que conviene pensar en las matrices como arreglos _bidimensionales_, y así el método de indexación puede tener `2` dimensiones, las cuales se separan por una `,`:

```R
matriz[r,c]
```

donde `c` representa la columna y `r` el renglón. 

Es importante mencionar que en una matriz, si se omite la `,` en la indexación, se obtendrían valores individuales equivalentes a la composición de un vector de la concatenación de las columnas, así cada índice  seguiría un orden como el que se muestra a continuación:

||`[,1]`|`[,2]`|`[,3]`|`[,4]`|`[,5]`|`[,6]`|
|--|--|--|--|--|--|--|
| **`[1,]`** | $$1$$ | $$5$$ | $$9$$ | $$13$$ | $$17$$ | $$21$$ |
| **`[2,]`**| $$2$$ | $$6$$ | $$10$$ | $$14$$ | $$18$$ | $$22$$ |
| **`[3,]`**| $$3$$ | $$7$$ | $$11$$ | $$15$$ | $$19$$ | $$23$$ |
| **`[4,]`**| $$4$$ | $$8$$ | $$12$$ | $$16$$ | $$20$$ | $$24$$ |

esta propiedad es muy importante cuando es necesario convertir un vector a una matriz. Esta conversión es muy sencilla, ya que se puede utilizar las funciónes de `matrix()`, sin embargo, existe un atributo de los vectores que usualmente se omite por ser obvia: la dimensión. La dimensión de un vector es por defecto `NULL`, sin embargo si se asigna ese atributo, se puede generar una matriz:

```R
v<-runif(4)
dim(v)<-c(2,2)
```

Una función útil cuando tratamos con matrices es `length()`, la cual nos regresa el número de elementos que existen en la matriz. Esto es especialmente útil porque existen un par de atributos que permiten redefinir los nombres de las columnas `colnames()` y renglones `rownames()` de una matriz.

```R
colnames(v)<-c("columna_1","columna_2")
rownames(v)<-c("r1","r2")
```

**Operaciones con matrices**

De manera similar a los vectores, los operadores aritméticos (`+`, `-`, `*`, `/`, `^`, ... )funcionan elemento por elemento, reciclando si es necesario. No obstante, existen operaciones del algebra lineal que se pueden realizar como el producto de matrices que se pueden realizar con el operador `%*%`. Así se pueden multiplicar  una matriz $$A := (a_{ij})_{m \times n}$$ de $$m$$ renglones y $$n$$ columnas, con una matriz $$B := (b_{ij})_{n \times p}$$ de $$n$$ columnas y $$p$$ renglones para obtener una matriz $$C$$ con $$m$$ columnas y $$p$$ renglones:

\\[C = A \times B := (c_{ij})_{m \times p}\\]

tomando como consideración que $$c_{ij}$$ se obtiene mediante:

\\[ c_{ij} = \sum_{r=1}^{n}a_{ir}b_{rj}\\]

lo cual se puede ver en este diagrama:

![](https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Matrix_multiplication_diagram.svg/240px-Matrix_multiplication_diagram.svg.png)

Otras operaciones del algebra matricial se implementan de manera muy sencilla, por ejemplo la _transposición_ se realiza con la función `t()`, lo cual genera una matriz con las dimensiones invertidas. Por otro lado, es posible obtener un vector con los valores de la diagonal mediante la función `diag()`. Otra función que se realiza de manera muy sencilla es la obtención del _determinante_ mediante la función `det()`, la cual solo se puede hacer en matrices cuadradas.

Asímismo, las funciones que se aplican a vectores se pueden realizar también con las matrices. No obstante existen algunas que se agregan como `colMeans()` y `rowMeans()`, las cuales generan la función `mean()` sobre los componentes respectivos, o bien `colSums()` y `rowSums()`, que generan las sumatorias correspondientes.

Por otro lado se encuentran las operaciones para concatenar matrices, las cuales se pueden realizar verticalmente con `rbind()` u horizontalmente mediante `cbind()`.


**Arreglos**

Los vectores y las matrices son en realidad objetos de la clase de los arreglos o _arrays_. Los vectores tienen una sola dimensión, mientras que las matrices son arreglos de dos dimensiones. Los arreglos que se pueden construir en `R` pueden tener más dimensiones y se pueden construir con la función `array()`, la cual requiere que se defina el atributo `dim` para construir el arreglo de datos.

```
arreglo3d <- array(runif(5*3*2, max = 10), dim = c(5, 3, 2))
```

Este tipo de estructuras no se suele utilizar muy a menudo, sin embargo, comparte las mismas propiedades que los arreglos más sencillos. Cabe mencionar que una función muy útil para hacer operaciones sobre cualquier dimensión es la función `apply()`. Esta función recibe 3 parámetros:

 - El arreglo en el que va a operar
 - La dimensión en la que opera
 - La función que se desea utilizar

```R
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
arreglo3 <- array(c(vector1,vector2),dim = c(3,3,2))
apply(arreglo3, c(1), sum)
```

```
[1] 56 68 60
```

#### Listas

Este tipo de estructura se diferencían de los arreglos puesto que pueden contener elementos con diversos tipos de datos. Esta carácterística hace que, aunque sean menos eficientes para los procesos de cálculo, sean muy versátiles. Las listas son estructuras de una sola dimensión que pueden contener múltiples tipos de datos:

```R
lista <- list("Solaria Biodata", 42i, 3.14159, TRUE, c(1.1, 2.3, 4))
lista
```

```
[[1]]
[1] "Solaria Biodata"

[[2]]
[1] 0+42i

[[3]]
[1] 3.14159

[[4]]
[1] TRUE

[[5]]
[1] 1.1 2.3 4.0
```

así mismo, es posible agregar nombres a los elementos de una lista:

```R
names(lista) <- c("nombre", "significado imaginario de todo en la vida", "pi", "existencia", "aleatorio")
lista
```

```
$nombre
[1] "Solaria Biodata"

$`significado imaginario de todo en la vida`
[1] 0+42i

$pi
[1] 3.14159

$existencia
[1] TRUE

$aleatorio
[1] 1.1 2.3 4.0
```

esto es muy conveniente, ya que nos permite utilizar un operador nuevo `$` el cual nos ayuda a acceder a los elementos de la lista mediante el nombre del elemento, en este ejemplo `lista$pi` contiene el valor `3.14159`. Es importante notar que cuando los nombres de los elementos tienen espacios, es necesario usar `"` o el caracter \` para escapar correctamente el nombre:

```R
lista$`significado imaginario de todo en la vida`
```

```
[1] 0+42i
```

#### Data Frames

Los data frames son estructuras de datos de dos dimensiones (rectangulares) que pueden contener datos de diferentes tipos, por lo tanto, son heterogéneas. 

```R
mi_df <- data.frame("entero" = c(1:4), "factor" = c("a", "b", "c", "d"), "numero" = c(1.2, 3.4, 4.5, 5.6),
  "cadena" = as.character(c("a", "b", "c", "d")))
mi_df
```

así mismo se puede usar `dim()` para conocer las dimensiones del `data.frame`, o bien `length` para obtener el número de columnas:

```R
dim(mi_df)
length(mi_df)
```

En R es muy relevante este tipo de estructuras, ya que cuando es necesario importar datos desde diversas fuentes (predominantemente archivos) estos se almacenan en el espacio de trabajo como `data.frame`. R cuenta con la función genérica `read.table()`, que puede leer cualquier tipo de archivo que contenga una tabla. Para ello es importante localizar en el sistema de archivos el directorio de trabajo, el cual es el lugar en nuestra computadora en el que se encuentran los archivos con los que estamos trabajando en `R`.

```R
#Para conocer cuál es el directorio de trabajo
getwd()
#Para cambiar el directorio de trabajo
setwd()
```
una vez que tenemos eso determinado, se puede utilizar la función `read.table` para cargar los datos de un archivo en nuestra sesión de trabajo, para ello es necesario suministrar como parámetro, la ruta del archivo:

```R
cancer<-read.table("/content/breast-cancer-wis.data")
```

la función `read.table` puede ser ajustada para importar diversos formatos de texto:

| Parámetro | Función | Valor por defecto |
|--|--|--|
| `header` | Especificar si se usará un encabezado definido en el archivo | `TRUE` |
| `sep` | Especificar cuál es el caracter de separación de campos | `'\t'` | 
| `col.names` | Especificar con un vector los nombres de los campos | `FALSE` |

Los nombres de las columnas de un `data.frame` son equivalentes a los nombres de las listas, es por ello que se puede acceder a los valores de cada columna como si fueran un vector mediante el uso del operador `$`.

[Menú Principal](./)

[Atras](./principiosR)

[Siguiente](#)
