---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Lenguajes de programación

### Principios de R 

[R](https://www.r-project.org/) es un programa de ambiente para cómputo estadístico y graficación. Se distribuye de manera libre en las distribuciones principales de plataformas **UNIX**, sin embargo es posible compilarlo en Windows y MacOS haciendo uso de los [instaladores oficiales](https://cran.r-project.org/mirrors.html). Para invocar el programa solo se necesita usar un comando en nuestra consola de comandos:

```bash
R
```

Ya vimos con [anterioridad](./tiposDatos) los tipos de valores que son usados en lenguajes de programación, sin embargo existen diferentes elementos dentro del lenguaje de progamación `R` que aportan todo el poder de procesamiento de datos.

#### Operadores

Los _operadores_ son los elementos de programación que permiten relacionar datos. En `R` existen diferentes tipos de operadores que se pueden usar con diferentes tipos de datos.

**Aritméticos**

A continuación se describen los operadores que se pueden utilizar

| Operador | Significado |
|----------|-------------|
| `(` `)` | Paréntesis |
|  `**`, `^` | Potencia |
| `*` | Multiplicación |
| `/` | División |
| `%/%` | División entera |
| `%%` | Módulo |
| `+` | Adición |
| `-` | Sustracción |

**Booleanos**

Para la computadora los valores que nosotros percibimos como números (o caractéres) son definidos de forma binaria. En nuestro caso usamos el sitema de representación decimal, lo cual significa que tenemos 10 símbolos (`0`,`1`,`2`,`3`,`4`,`5`,`6`,`7`,`8`,`9`) para representar cualquier número, en el sistema binario solo existen el `0` y el `1`. Así, existe una representación binaria para todos los números.

Existen operaciones especiales que se pueden ejecutar usando operaciones a nivel binario. Cabe destacar que las operaciones binarias se ejecutan **mucho más rápido** que otras operaciones matemáticas, por lo que se pueden aprovechar su uso al analizar cantidades masivas de datos. Esto se debe a que se interpretan a nivel de procesador directamente.

A continuación una tabla con las operaciones binarias que pueden realizarse:

| Operador | Significado |
|----------|-------------|
| `!` | negación lógica ( _NOT_) |
| `&` | _AND_ |
| `&&` | conjunción lógica (_AND_) |
| `|` | _OR_ |
| `||` | disyunción lógica (_OR_) |

Los operadores `AND`, `OR` son compuertas lógicas que proceden del álgebra booleana. En este caso los `1` son interpretados como `verdadero` y los `0` como `falso`.

_`AND`_

| A | B | `A&&B` |
|--|--|--|
| 0 | 0 | **0** |
| 0 | 1 | **0** |
| 1 | 0 | **0** |
| 1 | 1 | **1** |

_`OR`_

| A | B | `A||B` |
|--|--|--|
| 0 | 0 | **0** |
| 0 | 1 | **1** |
| 1 | 0 | **1** |
| 1 | 1 | **1** |

_`NOT`_

| A | `!A` |
|--|--|
| 0 | **1** |
| 1 | **0** |

**Comparación**

En programación, una relación muy importante que existe en los datos son las comparaciones, las cuales ayudan a evaluar mediante un criterio específico dos valores.

| Operador | Significado |
|----------|-------------|
| `==` | Igual que |
| `!=` | Diferente que |
| `>` | Mayor que |
| `>=` | Mayor o igual que |
| `<` | Menor que |
| `<=` | Menor o igual que |

Es importante destacar que estas comparaciones generan resultados del tipo lógico, es decir valores para un resultado verdadero que en pyhton se asiga **`True`** y falso representado como **`False`**.

**Operadores de asignación**

El último tipo de operadores de R son muy útiles, ya que permiten asignar valores a elementos conocidos como _variables_. A continuación una tabla que resume los operadores disponibles en este lenguaje de programación:

| Operador | Significado | Ejemplo |
|--|--|--|
| `=` | Asignación, asigna el valor de la derecha a la izquierda | `x = 1` |
| `<-` | Asignación, asigna el valor de la derecha a la izquierda | `x <- 1` |
| `->` | Asignación, asigna el valor de la izquierda a la derecha | `1 -> x` |

**Precedencia de operadores**

Es importantísimo asignar un orden de ejecución cuando se combinan operadores en computación.


| Prioridad | Operador | Significado |
|-----------|----------|-------------|
| 1 | `(` `)` | Paréntesis |
| 2 |  `**`, `^` | Potencia |
| 3 | `%%`,`%/%` | Módulo, división entera |
| 4 |  `*`, `/`,   | Multiplicación, división |
| 5 | `+`, `-` | Adición, sustracción |
| 6 | `<`, `<=`, `==`, `>=`, `>`, `!=` | Comparativos |
| 7 | `!` | Negación lógica |
| 8 | `&&`, `&` | Conjunción lógica |
| 9 | `||`, `|` | Disyunción lógica |
| 10 | `->` | Asignación a la derecha |
| 11 | `<-` | Asignación a la izquierda |
| 12 | `=`| Asignación a la izquierda |

#### Variables


Las variables son los elementos que permiten almacenar datos a través de símbolos. Son equiparables a las variables algebráicas, ya que las variables pueden contener valores diferentes en distintos momentos.

Las variables pueden contener datos y para generar una variable es necesario usar **operadores de asignación**:

```R
x <- 1
```

En este ejemplo se muestra como, a la variable `x` se le asigna un valor `1` y si luego 

```R
x <- 0
```

el contenido de `x` cambiará a ser `0`.

Las variables son representadas por símbolos o palabras, que identifican a través de un _nombre_ a la variable. Casi cualquier palabra puede usarse como identificador, sin embargo existen algunas reglas en R:

 - Pueden ser una combinación de letras, dígitos, `.` y `_`
 - Deben comenzar por una letra o `.`. Si comienza con `.`, el segundo caracter no puede ser un dígito.
 - Existen palabras reservadas que no pueden usarse (por ejemplo `for`, `if`, `else`)

Existe una función `ls()` que permite desplegar los nombres de las variables que tienen asignado algún valor en el espacio de trabajo actual.

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

| Función | Descripción |
|--|--|
| `runif()` | Recibe como parámetro la cantidad de elementos que se desea que tenga el vector de números aleatorios, los cuales son seleccionados de una distribución uniforme |
| `rnorm()` | Recibe como parámetro la cantidad de elementos que se desea que tenga el vector de números aleatorios, los cuales son seleccionados de una distribución normal |
| `sample()` | Recibe como parámetros, un vector con elementos, la cantidad de elementos que se desea obtener, como tercer parámetro opcioonal se define si el muestreo es con remplazo |

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

[Menú Principal](./)

[Atras](./tiposDatos)

[Siguiente](#)
