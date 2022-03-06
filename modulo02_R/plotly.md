---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

## Lenguajes de programación

### Plotly

<img src="https://plotly.com/all_static/images/plotly_graphing_libraries_1.png" width=150 align=right>
<br>
<br><br>

Hacer gráficas es una de las herramientas más poderosas para comunicar características importantes de un análisis de datos. No obstante la visualización de datos va un paso más adelante con la posibilidad de interaccionar directamente con un gráfico para obtener alguna clase de información clave. [Plotly](https://plotly.com/) es un paquete de visualización de datos que permite generar gráficos interactivos. Este paquete de hecho es una biblioteca multiplataforma (corre en `R` y en `Python`) y su desarrollo es de libre acceso y distribución. Lo cual provee de una serie de herramientas para obtener ayuda de la comunidad ([foro](https://community.plotly.com/), [página para reportar problemas](https://github.com/ropensci/plotly/issues))

Plotly está construído a partir de `javascript`, un lenguaje de programación ampliamente usado por la comunidad de desarrollo de aplicaciones web. Como resultado de la implementación de `plotly` se pueden obtener gráficos interactivos los cuales se pueden embeber nativamente en aplicaciones web 🌐 (como colab, jupyter, rstudio, spyder, etc).

#### Implementación de plotly en R

`plotly` puede ser instalado muy fácilmente ya que se encuentra disponible en el CRAN.

```R
install.packages("plotly")
library(plotly)
```

Plotly sigue una sintáxis muy similar a la que se implementa con otros paquetes de `R`:

```R
fig <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
fig
```

<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="violinStatesMidwest.html" height="525" width="100%"></iframe>

Una gran ventaja recae en la adaptabilidad sencilla para generar visualizaciones interactivas del paquete `ggplot2`:

```R
starwars %>% 
    select(name, height, mass, birth_year,species) %>% 
    mutate(bmi=mass/height^2) %>% 
    ggplot(., aes(x=mass, y=height, color=species, size=bmi, text=name)) + 
        geom_point() -> p
ggplotly(p)
```

<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="ggplotlySW.html" height="525" width="100%"></iframe>


Agregar información en las etiquetas dinámicas se puede hacer al agregar `layer`s a las gráficas:

```R
starwars %>% 
    select(name, height, mass, birth_year,species) %>% 
    mutate(bmi=mass/height^2) -> swbmi
fig<-plot_ly(swbmi, x=~mass, y=~height, z=~birth_year, color=~bmi, text=~species, text2=~name)
fig %>% layout( tittle=~text)
```

<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="starwars.html" height="525" width="100%"></iframe>

😄

[Menú Principal](./)

[Atras R](./plottingR)

[Siguiente](./#)
