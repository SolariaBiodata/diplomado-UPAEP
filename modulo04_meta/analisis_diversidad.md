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

La información de la tabla de OTUs debe de estar separada por algún delimitador, ya sea por comas "," o tabulaciones "  ", pero principalmente al final tener las columnas de la taxonomía de cada OTU con un nombre concreto y solo los niveles clásicos en inglés, empezando por ***Kingdom*** . En esta práctica la tabla de OTUs ocuparemos solamente 6 niveles, pero pueden ser hasta 7.

![otustable_ampvis2](https://user-images.githubusercontent.com/54455898/171065521-126348f0-237b-4fd4-b710-f7b06bbe999f.png)

# Análisis de metaprofiling con DADA2

DADA2 es un paquete de software que modela y corrige errores de amplicón secuenciados por Illumina. DADA2 infiere secuencias de muestra con exactitud, sin granularidad gruesa en Unidad Taxonómica Operativa (OTU), y resuelve diferencias de tan solo un nucleótido. En varias comunidades simuladas. DADA2 ha destacado de otras herramientas similares en identificar más variantes reales produciendo menos secuencias espurias. 

## Instalación de librerias 
Antes de la instalación de DADA2 es importante contar con la libreria **devtools**.
El objetivo de devtools es facilitar su vida como desarrollador de paquetes al proporcionar funciones de R que simplifican muchas tareas comunes.

```bash
install.packages("devtools")
```
## Pasos previos a la instalación de DADA2
Primeramente se invoca la librería devtools que permite instalar librerias desde github.

```bash
library("devtools")
```
## Instalación de DADA2

Una vez que devtools esté activado podemos instalar DADA2

```bash
devtools::install_github("benjjneb/dada2", ref="v1.16")
```
```bash
library(dada2)
```
El pipeline DADA2  tiene como punto de partida un conjunto de archivos fastq secuenciados por Illumina ("desmultiplexado"), que realiza un control de calidad que elimina quimeras y adaptadores. El producto final es una tabla de "variantes de secuencia de amplicón" (ASV), que es un análogo de mayor resolución de la tabla OTU tradicional que ofrecen otros programas.
```
```bash
library(dada2)
```
El pipeline DADA2  tiene como punto de partida un conjunto de archivos fastq secuenciados por Illumina ("desmultiplexado"), que realiza un control de calidad que elimina quimeras y adaptadores. El producto final es una tabla de "variantes de secuencia de amplicón" (ASV), que es un análogo de mayor resolución de la tabla OTU tradicional que ofrecen otros programas.
