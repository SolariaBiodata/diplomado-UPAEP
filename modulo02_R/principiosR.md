---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 3er[Diplomado de Bioinformática](./)

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


[Menú Principal](./)

[Atras](./tiposDatos)

[Siguiente](./estructurasR)
