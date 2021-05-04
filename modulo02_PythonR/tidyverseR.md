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

🚩 Antes de continuar es importante mencionar un operador que se carga con tidyverse, se trata del operador %>%. Este nuevo operador está inspirado en el operador | de bash, es decir ayuda a redireccionar la salida de una función a la entrada de otra función. En breve, es posible remplazar el estilo clásico de f(x) con x %>% f(). Esto ayuda a la legibilidad del código cuando se acoplan múltiples funciones:

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

[Menú Principal](./)

[Atras](./estructurasR)

[Siguiente](#)
