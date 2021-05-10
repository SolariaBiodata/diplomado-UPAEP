---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Lenguajes de programación

### Tidyverse 

<img src="https://soka.gitlab.io/blog/post/2019-10-06-r-tidyverse-intro/images/hex-tidyverse.png" width=150 align=right>
<br>

[Core Tidyverse](https://www.tidyverse.org/packages/) es un compendio de paquetes que se han desarrollado para el análisis de datos en `R`. Estos paquetes comparten una filosofía de diseño en términos de gramática y estructuras de datos, por lo cual se han desarrollado para funcionar como un todo, sin embargo también pueden operar por separado.

Es relevante destacar que este compendio de paquetes han recibido el apoyo de diversos grupos, como el de los desarrolladores de `RStudio`, quienes alientan a sus usuarios a usar `tidyverse`.

Todos los paquetes del compendio se pueden instalar usando una sola instrucción de instalación.

**Paquetes del núcleo**

Existe una serie de paquetes que se distribuyen en conjunto en el compendio básico. Estos paquetes se cargan de manera automática al hacer la carga de `"tidyverse"`

```R
library(tidyverse)
```

🚩 Antes de continuar es importante mencionar un operador que se carga con tidyverse, se trata del operador `%>%`. Este nuevo operador está inspirado en el operador `|` de bash, es decir ayuda a redireccionar la salida de una función a la entrada de otra función. En breve, es posible remplazar el estilo clásico de `f(x)` con `x %>% f()`. Esto ayuda a la legibilidad del código cuando se acoplan múltiples funciones:

```R
los_datos <- read.table(/ruta/a/archivo.txt) %>% subset(variable_a > x) %>% head(100)
```

Este operador será usado en adelante de manera estándar.

#### ggplot2

<img src="https://d33wubrfki0l68.cloudfront.net/2c6239d311be6d037c251c71c3902792f8c4ddd2/12f67/css/images/hex/ggplot2.png" width=150 align=right><br>

Este paquete se plantea como un sistema declarativo de creación de gráficos. Por lo cual solo requiere que se le asignen datos para procesar, indicar la estética de las variables y definir algunos valores primitivos para usarse. El sistema genera una gráfica y gestiona detalles diversos para la visualización efectiva del gráfico.

La forma de trabajo con `ggplopt2` generalmente consta de algunos pasos:

 1. Se inicializa con `ggplot()`
 2. Se suministra una forma para mapear variables con una _estética_ usando `aes()`
 3. Se agregan capas al gráfico que pueden ser
    - Capas de despliegue de datos por ejemplo `geom_point()` o `geom_histogram()`
    - Escalas, por ejemplo `scale_colour_brewer()`
    - Especificaciones gráficas como `facet_wrap()`
    - Sistemas de coordenadas como `coord_flip()`

```R
ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point() + coord_flip()
```

Este paquete es el más antiguo de `tidyverse` y planteo las bases de la filosofía de diseño de gramática que luego se expandió con otros paquetes.

#### tibble

<img src="https://d33wubrfki0l68.cloudfront.net/c477d7eb7fdf2c3d75637cfe19ff4a4d0a107bcf/017d0/css/images/hex/tibble.png" width=150 align=right><br>

Con este paquete se integran los _tibbles_ los cuales son estructuras similares a los `data.frame`. Estas estructuras conservan las propiedades más útiles de los _data frames_, sin embargo se deshacen de las propiedades que se han probado que no aportan efectividad a las estructuras. Los _tibbles_ son estructuras más _perezosas_ y _torpes_ que los _data frames_, esto significa que no permiten hacer algunas cosas y se _quejan_ más. Esto produce que los desarrolladores hagan frente a los problemas desde el inicio, lo cual conlleva a desarrollos más limpios y donde el código expresa mejor los conceptos programados.

```R
tibble(x = 1:5, y = 1, z = x ^ 2 + y)
```
```
A tibble: 5 × 3
x	y	z
<int>	<dbl>	<dbl>
1	1	2
2	1	5
3	1	10
4	1	17
5	1	26
```

```R
tribble(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)
```
```
A tibble: 2 × 3
x	y	z
<chr>	<dbl>	<dbl>
a	2	3.6
b	1	8.5
```

#### dplyr

<img src="https://d33wubrfki0l68.cloudfront.net/621a9c8c5d7b47c4b6d72e8f01f28d14310e8370/193fc/css/images/hex/dplyr.png" width=150 align=right><br>

Este paquete embebe una gramática especial para la manipulación de datos. Esta consiste en un conjunto de _verbos_ que ayudan a resolver los retos más comunes en cuanto a manipulación de datos.

La gramática que se implementa en este paquete tiene inspiración en el manejo de datos que se hace en lenguajes de procesamiento de bases de datos relacionales como `SQL`. En estos motores de procesamiento, las relaciones entre variables y la estructura de tablas son fundamentales para ejecutar algunas funciones de manipulación de datos.

| Verbo | Función |
|--|--|
| `mutate()` | Agrega nuevas variables, mismas que están en función de variables existentes en la estructura de datos |
| `select()` | Selecciona variables con base en sus nombres |
| `filter()` | Selecciona observaciones (renglones) con base en sus valores |
| `summarise()` | Simplifica los valores de las variables en un resumen descriptivo de las variables |
| `arrange()` | Modifica el orden de los renglones |
| `group_by()` | Permite ejecutar cualquier operación en grupo, el grupo suele cumplir un criterio que categoriza renglones basados en una variable |

```R
starwars %>% filter(species == "Droid") #selecciona solo los elementos que son androides

starwars %>% select(name, ends_with("color")) #selecciona solo las variables name, y las que terminan con "color"

starwars %>% 
  mutate(name, bmi = mass / ((height / 100)  ^ 2)) %>%
  select(name:mass, bmi) # Genera una nueva columna para el indice de masa corporal, y se seleccionan solo las variables importantes

starwars %>% arrange(desc(mass)) %>% select(name,mass) # reordena los registros por la masa en orden descendente y luego selecciona solo las variables "name" y "mass"

starwars %>%
  group_by(species) %>%
  summarise(
    n = n(),
    mass = mean(mass, na.rm = TRUE)
  ) # agrupa los registros por especie, y de ellos se obtienen dos variables, n tiene el conteo de registros, mass contiene el promedio de "mass" en cada grupo
```

#### tidyr

<img src="https://d33wubrfki0l68.cloudfront.net/476fa4025501dcec05be08248b32d390dd2337d5/574c6/css/images/hex/tidyr.png" width=150 align=right><br>

Este es el paquete que provee una serie de funciones que permiten generar datos ordenados (_tidy data_). Tidyr generó un nuevo concepto de orden, el cual se basa en una forma consistente de desplegar datos para su manipulación. Esta implica que cada variable sea tratada como una columna y cada columna representa una variable, nada fuera de esa forma.

El objetivo central de este paquete consiste en generar datos ordenados de esta forma:

 1. Cada columna es una variable
 2. Cada renglón es una observación
 3. Cada casilla es un valor único

Para ello existen una serie de funciones que ayudan a _masajear_ los datos de tal forma que se obtengan datos ordenados.

| Categoría de función | Función | Descripción |
|--|--|--|
| _Pivoteo_ | `pivot_longer()` | Remplaza a la función `spread()`, la cual se enfoca en _alargar_ los datos, <br> esto significa que incrementa el número de renglones y reduce el número de columnas |
| _Pivoteo_ | `pivot_wider()` | Remplaza a la función `gather()`, la cual se enfoca en _ampliar_ los datos, <br> esto significa que incrementa el número de columnas y reduce el número de renglones |
| _Rectángularización_ | `unnest_longer()` | Ayuda a convertir listas de datos anidados (como los `JSON`) en datos ordenados <br> convierte cada elemento de una lista-columna en un renglón |
| _Rectángularización_ | `unnest_wider()` | Ayuda a convertir listas de datos anidados (como los `JSON`) en datos ordenados <br> convierte cada elemento de una lista-columna en una columna |
| _Anidamiento_ | `nest()` | Crea listas de datos, se trata de una operación de agrupamiento, se genera un renglón por cada grupo definido |
| _Anidamiento_ | `unnest()` | Desanida listas de datos, genera columnas con datos de los campos de la lista. |
| _Separación-Union_ | `separate()` | Separar una columna de caracteres en múltiples columnas |
| _Separación-Union_ | `unite()` | Unir columnas en una columna de caracteres |
| _Separación-Union_ | `extract()` | Extraer campos basados en una expresión regular, cada grupo se convierte en una columna |
| _Relleno_ | `complete()` | Convierte faltantes implícitos en valores explícitos con el valor `NA` |
| _Relleno_ | `drop_na()` | Convierte valores `NA` en valores faltantes implícitos |
| _Relleno_ | `fill()` | Convierte valores faltantes con valores previos o subsecuentes |
| _Relleno_ | `replace_na()` | Convierte valores faltantes con algún valor conocido |

#### readr

<img src="https://d33wubrfki0l68.cloudfront.net/c1c91484f898fe9d7d90a570900f1d5cd703fe2e/d7df4/css/images/hex/readr.png" width=150 align=right><br>

Provee métodos para leer archivos de texto tabulares de manera sencilla y rápida. Con este paquete se pretende que el usuario no se preocupe por la estructura de archivos de distintas fuentes, sin embargo se hace énfasis en que solo admite datos limpios en dichas estructuras, cambios en ello generan salidas de error informativas.

Este paquete proveé diferentes funciones diseñadas para leer de manera ágil diferentes tipos de archivos

| Función | Tipo de archivos |
|--|--|
| `read_csv()` | Valores separados por comas _CSV_ |
| `read_tsv()` | Valores separados por tabuladores |
| `read_delim()` | Texto con delimitadores de campos |
| `read_fwf()` | Tamaño de columna fijo |
| `read_table()` | Tabulares con columnas separadas por espacio en blanco |
| `read_log()` | Bitácoras web  |


#### purrr

<img src="https://d33wubrfki0l68.cloudfront.net/2d0701b616efa7435cd5a94e703baa595a4f9ed0/d41b9/css/images/hex/purrr.png" width=150 align=right><br>

Este paquete incrementa el rendimiento de R en torno al paradigma de programación funcional. Contiene un conjunto completo de herramientas consistentes para trabajar con funciones aplicadas a vectores. Los conceptos detrás de este paquete son distintos a los aprendidos con programación estructurada, sin embargo generan código que es más fácil de escribir y de comprender por un humano.

La función principal es `map()`, con la cual se transforma la entrada mediante la aplicación de cualquier otra función, así cada elemento de una lista es transformado, regresando un objeto del mismo tamaño que el objeto original.

```R
map(.x, .f, ...)
```

dónde `.x` es un objeto de entrada, `.f` es una función, fórmula o vector:

```R
1:6 %>% map(rnorm, n = 5) 
```

```
[[1]]
[1] 2.7362571 1.9947014 0.2294790 0.7345461 0.9384763

[[2]]
[1] 1.501018 2.805655 3.202506 2.162312 1.579392

[[3]]
[1] 4.122298 2.740984 4.147523 2.949791 1.510276

[[4]]
[1] 2.518706 4.978651 4.343071 4.431819 5.076034

[[5]]
[1] 5.644066 3.846050 3.721035 4.459518 3.771493

[[6]]
[1] 4.485367 4.772490 6.064128 5.296614 4.127439

```

#### stringr

<img src="https://d33wubrfki0l68.cloudfront.net/45fd04ad9cdb2159fea08d07dbc11e742d68e4e3/df327/css/images/hex/stringr.png" width=150 align=right><br>

Este paquete incluye funciones diseñadas para mejorar la forma de trabajo en `R` con cadenas de texto (su principal defecto comparado con otros lenguajes). Con estas funciones se simplifica la forma de procesar _strings_. Adicionalmente, los procesamientos de datos son más rápidos debido a las dependencias que usan bibliotecas muy eficaces escritas en `C` que utilizan los componentes estándar internacionales de unicode.

Todas las funciones de este paquete usan el prefijo `str_`, mismas que toman un vector de cadenas como el primer argumento.

```R
x <- c("Solaria", "biodata", "diplomado", "bioinformatica", "R", "python")
str_length(x) 
#> [1] 7 7 9 14 1 6
str_c(x, collapse = ", ")
#> [1] "Solaria, biodata, diplomado, bioinformatica, R, python"
str_sub(x, 1, 2)
#> [1] "So" "bi" "di" "bi" "R" "py"
```

En adelante se verá como las funciones de cadenas funcionan con expresiones regulares, por ejemplo `"[abc]"` las cuales se ubican documentadas como `patron`:

  - `str_detect(x, patron)` indica si hay una coincidencia con el patrón
  - `str_count(x, patron)` cuenta la cantidad de veces que se encontró el patrón
  - `str_subset(x, patron)` extrae los componentes que coinciden con el patrón
  - `str_locate(x, patron)` obtiene la pocisión de la coincidencia
  - `str_extract(x, patron)` extrae el texto que coincide con el patrón
  - `str_match(x, patron)` extrae partes de la coincidencia definidas por paréntesis
  - `str_replace(x, patron, reemplazo)` extrae los componentes que coinciden con el patrón y los reemplaza por el siguiente patron
  - `str_split(x, patron)` separa cadenas con base en una cadena en múltiples objetos

```R
str_replace_all(x,"[a-z]", "-" )
# 'S------''-------''---------''--------------''R''------'
```
#### forcats

<img src="https://d33wubrfki0l68.cloudfront.net/412a6f14518ab633a94221dda7e16cf22e43a763/91620/css/images/hex/forcats.png" width=150 align=right><br>

Este paquete provee de una suite de herramientas que resuelven de manera efectiva problemas comunes con los _factores_. Este tipo de estructura se usa para manejar variables categóricas en `R`, los cuales suelen generar de manera consistente problemas al manejar conjuntos de valores fijos para una variable (_factores_).

A continuación se muestran algunas funciones importantes, mismas que implican modificar el ordenamiento de los valores

| Función | Descripción |
|--|--|
| `fct_reorder()` | Reordena un _factor_ por medio de otra variable |
| `fct_infreq()` | Reordena un _factor_ por la frecuencia de los valores |
| `fct_relevel()` | Cambia el orden de un _factor_ manualmente |
| `fct_lump()` | Colapsa el valor menos o más frecuente en un factor `"other"` |

```R
starwars %>%
  mutate(skin_color = fct_lump(skin_color, n=5)) %>%
  count(skin_color, sort = TRUE)
```
```
# A tibble: 6 x 2
  skin_color     n
  <fct>      <int>
1 Other         41
2 fair          17
3 light         11
4 dark           6
5 green          6
6 grey           6
```

#### Paquetes fuera del núcleo

Existen otros paquetes que se instalan con `tidyverse`, sin embargo no se cargan de manera automática cuando se usa un `libary(tidyverse)` por lo que se tienen que cargar por separado.

**Paquetes de importación de datos**

Así como el paquete principal para importar datos (`readr`), existen otros paquetes diseñados para importar datos para su manipulación:

 - `DBI` es utilizada para ligar bases de datos relacionales, se requiere utilizar algunos conectores con diferentes motores como `RSQlite`, `RMariaDB`, `RPostgres` u `odbc`.
 - `haven` para datos de `SPSS`, `Stata`, y `SAS`
 - `httr` para interfaces web
 - `readxl` para usar hojas de cálculo
 - `googlesheets4` para las hojas de cálculo de Google
 - `rvest` para web scrapping
 - `jsonlite` para archivos `JSON` 
 - `xml2` para archivos `XML`

**Paquetes para procesar tipos de datos específicos**

Aparte de `tidr`, `dplyr`, `stringr` y `forcats`, existen otros paquetes que ayudan a trabajar con tipos específicos de datos:

  - `lubridate` ayuda con fechas
  - `hms` es muy útil con horarios
  - `blob` sirve para almacenamiento blob (datos binarios)

además existen `dbplyr` para ajustar el formato de código `dplyr` a `SQL`, y `dtplyr` para ejecutar código `dplyr` utilizando el backend de `data.table`

**Paquetes para modificar el estilo de programación**

- `magrittr` es el paquete que proporciona el operador`%>%` que se usa en tidyverse, sin embargo también proporciona otros operadores de redireccionamiento más específicos `%$%` y `%<>%`
- `glue` proporciona una alternativa para `paste()` para combinar datos y cadenas.

[Menú Principal](./)

[Atras](./estructurasR)

[Siguiente](./estadisticaR)
