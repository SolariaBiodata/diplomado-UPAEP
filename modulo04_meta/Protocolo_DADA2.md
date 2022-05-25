---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

# Libreta con R para el protoloco de DADA2 

## Instalación de librerias 
Lo primero que vamos a realizar es la instación de DADA2. 
Instalamos la libreria devtools
El objetivo de devtools es facilitar su vida como desarrollador de paquetes al proporcionar funciones R que simplifican muchas tareas comunes.

```bash
install.packages("devtools")
```
```bash
library("devtools")
devtools::install_github("benjjneb/dada2", ref="v1.16")
```
```bash
library(dada2)
```
# Instalamos phyloseq
El paquete phyloseq es una herramienta para importar, almacenar, analizar y mostrar gráficamente datos de secuenciación filogenética complejos que ya se han agrupado en unidades taxonómicas operativas (OTU), especialmente cuando hay datos de muestra asociados, árbol filogenético y/o asignación taxonómica de las OTU.

```bash
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("phyloseq")
```
# Instalamos microbiome
```bash
install_github("microbiome/microbiome")
```
# Instalamos microbiome
```bash
library(microbiome)
```
# Instalamos Fantaxtic 
Es un paquete que contiene un conjunto de funciones contenedoras para los paquetes phyloseq y ggplot2 en el software R que convierte los datos de conteo taxonómico ordinarios en gráficos fantásticos listos para publicación. Las figuras Fantaxtic vienen como figuras completamente estilizadas con colores agradables y un control de trazado máximo

```bash
devtools::install_github("gmteunisse/Fantaxtic")
```
```bash
library(fantaxtic)
```
```bash
library(ggplot2)
```
# Ruta de las lecturas
Indicamos la ruta de las lecturas

Cargar los archivos de la corrida de secuenciación

> 

> 

```bash
PATH = "/Ruta/Lecturas"
list.files(PATH)
```
































