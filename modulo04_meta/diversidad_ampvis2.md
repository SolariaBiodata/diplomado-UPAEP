---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

# Análisis de diversidad con Ampvis2
![ampvis_logo02](https://user-images.githubusercontent.com/54455898/171064502-cb352294-5236-44ed-a7ec-75680ffa25c8.png)

Ampvis2 es un paquete de R para visualizar y analizar convenientemente los metadatos de nuestro interés. Es bastante útil a partir de la tabla de OTUs y otra de metadatos.

## Instalación de librerias 
Lo primero que vamos a instalar es la libreria ampvis2 desde su repositorio principal en Github:

```bash
install.packages("remotes")
remotes::install_github("MadsAlbertsen/ampvis2")
```
```bash
library(ampvis2)
```
### Formatos de la información de entrada

La información de la tabla de OTUs debe de estar separada por algún delimitador, ya sea por comas "," o tabuladores "  " , pero principalmente al final tener las columnas de la taxonomía de cada OTU con un nombre concreto y solo los niveles clásicos en inglés, empezando por ***Kingdom*** . En esta práctica, la tabla de OTUs abarcará solamente 6 niveles, pero pueden ser hasta 7.

```bash
data_level <- read.csv(file = "/content/sample_data/datos_level_6.csv")
```
```bash
head(data_level)
```

![otustable_ampvis2](https://user-images.githubusercontent.com/54455898/171065521-126348f0-237b-4fd4-b710-f7b06bbe999f.png)

#### Lista de metadatos

La lista de metadatos será la siguiente:

```bash
metadata_test <- read.table(file = "/content/sample_data/metadata_test.txt")
```
```bash
metadata_test
```

| SampleID  | TypeSample  |  
|---|---|
| 085-01  | suelo  |   
| 085-02  | agua  |   
| 085-03  | sedimento  |  

Como te habrás dado cuenta, esta tabla de metadatos cumple con el mismo formato que en prácticas anteriores, donde su principal característica es que la informacion está separada mediante tabuladores.

### Creación de un objeto

Debemos crear una matriz con cualquier nombre, para esta práctica se llamará SOLARIA. Este paso es fundamental para generar los análisis y visualizaciones:

```bash
SOLARIA <- amp_load(otutable ="/content/sample_data/datos_level_6.csv", metadata ="/content/sample_data/metadata_test.txt")
```
```bash
SOLARIA
```

![object_solaria](https://user-images.githubusercontent.com/54455898/172037524-62b563a0-3bcd-419b-81cd-b62815ce0daf.png)

Al cargar el ***objeto***, nos va a proporcionar los ***elementos*** que contiene, el cual resume la cantidad de lecturas y OTUs en las 3 muestras aplicadas, así como la ***taxonomía asignada*** y el número de variables identificados en el fichero de ***metadatos***.

### Generación de diferentes gráficas

#### Curvas de rarefacción

```bash
amp_rarecurve(data = SOP, stepsize = 50, color_by = "TypeSample")
```
![rarecurve](https://user-images.githubusercontent.com/54455898/171067025-d9e91ee3-0c10-49e3-a842-8bb492aa3fd2.png)

Las curvas de rarefacción representan el número de especies frente al número de muestras. Este tipo de curvas se crea volviendo a muestrear aleatoriamente el conjunto de “n” muestras varias veces y luego trazando el número promedio de especies encontradas en cada muestra. Se espera que cada curva generada obtenga un comportamiento “asintótico”.

### Gráfica de Boxplot

```bash
amp_boxplot(data = SOP, group_by = "TypeSample", tax_add = "Family")
```
![bplot_ampvis2](https://user-images.githubusercontent.com/54455898/171067045-ecce49f8-2762-4831-9d26-906531eebb88.png)

En este tipo de gráficos se puede analizar mejor el porcentaje de abundancia ubicado en el eje de las ***x*** con base a los ***3 grupos*** dados para esta visualización en relación con las ***familias*** representadas en cada muestra significativa.

### Mapa de calor o Heatmap

```bash
amp_heatmap(data = SOP, group_by = "TypeSample", tax_show = 20, tax_aggregate = "Genus", tax_add = "Phylum")
```
![hm_ampvis2](https://user-images.githubusercontent.com/54455898/171067064-16e639e3-a906-4606-9835-ba94b415306f.png)

* Los mapas de calor son considerados una herramienta útil porque puede proporcionar una descripción general completa, ya que sus herramientas de visualización de datos son fáciles de entender y, a menudo, se explican por sí mismas. 

* Es muy diferente de una tabla o un gráfico, y ambos necesitan ser interpretados o estudiados para ser entendidos. Sin embargo, el mapa de calor también puede ser engañoso ya que involucra una gran cantidad de valores o datos que a menudo resultan en la inconclusión de otra información necesaria para hacer una suposición precisa sobre su enfoque.

### Diagrama de Venn

```bash
amp_venn(data = SOP, group_by = "TypeSample", cut_f = 95)
```
![venn_ampvis2](https://user-images.githubusercontent.com/54455898/171067097-aa62820a-11e3-499f-b792-7bb651417aaf.png)

Los diagramas de Venn calculan la cantidad de OTUs compartidos por grupos dados los umbrales sobre la frecuencia con la que las OTUs deben estar por encima de cierta abundancia. También devuelve la abundancia promedio de las OTUs en un grupo en particular.

[Menú Principal](./index)

[Atras](./taxonomia_kraken_mpa)

[Siguiente](./diversidad_R)
