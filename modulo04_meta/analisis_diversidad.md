---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

# Análisis de diversidad con Ampvis2
![ampvis_logo02](https://user-images.githubusercontent.com/54455898/171064502-cb352294-5236-44ed-a7ec-75680ffa25c8.png)

Ampvis2 es un paquete de R para visualizar y analizar convenientemente los datos de amplicón de ARNr 16S de diferentes maneras. Es bastante útil a partir de la tabla de OTUs y una de metadatos.

## Instalación de librerias 
Lo primero que vamos a instalar es la libreria ampvis2 desde su repositorio principal en Github

```bash
install.packages("remotes")
remotes::install_github("MadsAlbertsen/ampvis2")
```
```bash
library(ampvis2)
```
### Formatos de la información de entrada

La información de la tabla de OTUs debe de estar separada por algún delimitador, ya sea por comas "," o tabuladores "  " , pero principalmente al final tener las columnas de la taxonomía de cada OTU con un nombre concreto y solo los niveles clásicos en inglés, empezando por ***Kingdom*** . En esta práctica la tabla de OTUs ocuparemos solamente 6 niveles, pero pueden ser hasta 7.

![otustable_ampvis2](https://user-images.githubusercontent.com/54455898/171065521-126348f0-237b-4fd4-b710-f7b06bbe999f.png)

#### Lista de metadatos

La lista de metadatos será la siguiente:

| SampleID  | TypeSample  |  
|---|---|
| 085-01  | suelo  |   
| 085-02  | agua  |   
| 085-03  | sedimento  |  

Como te habrás dado cuenta, cumple con el mismo formato que en las prácticas anteriores, donde su principal característica es que la informacion está separada mediante tabuladores. 

### Generación de diferentes gráficas

#### Curvas de rarefacción

```bash
amp_rarecurve(data = SOP, stepsize = 50, color_by = "TypeSample")
```
![rarecurve](https://user-images.githubusercontent.com/54455898/171067025-d9e91ee3-0c10-49e3-a842-8bb492aa3fd2.png)

### Gráfica de Boxplot

```bash
amp_boxplot(data = SOP, group_by = "TypeSample", tax_add = "Family")
```
![bplot_ampvis2](https://user-images.githubusercontent.com/54455898/171067045-ecce49f8-2762-4831-9d26-906531eebb88.png)

### Mapa de calor o Heatmap

```bash
amp_heatmap(data = SOP, group_by = "TypeSample", tax_show = 20, tax_aggregate = "Genus", tax_add = "Phylum")
```
![hm_ampvis2](https://user-images.githubusercontent.com/54455898/171067064-16e639e3-a906-4606-9835-ba94b415306f.png)

### Diagrama de Venn

```bash
amp_venn(data = SOP, group_by = "TypeSample", cut_f = 95)
```
![venn_ampvis2](https://user-images.githubusercontent.com/54455898/171067097-aa62820a-11e3-499f-b792-7bb651417aaf.png)

