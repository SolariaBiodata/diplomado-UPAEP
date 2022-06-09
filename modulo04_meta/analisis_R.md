
# Análisis de diversidad en R

### Instalación de librerias

```bash
eje
```
```bash
library(ggplot2)
```
```bash
install.packages("reshape2")
```
```bash
library(reshape2)
```
```bash
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("phyloseq")
```
```bash
library(phyloseq)
```

```bash
install.packages("lattice")
```

```bash
install.packages("permute")
```

```bash
library(permute)
```

```bash
library(vegan)
```

```bash
install.packages("dplyr")
```

```bash
library(dplyr)
```

### Cargamos la tabla de los datos

```bash
datos <-read.table("/content/Abundance.tsv", sep="\t", header=T, row.names=1)
head(datos)
``` 

![1_r](https://user-images.githubusercontent.com/54455898/172842951-4340d3cc-5416-4183-b6d2-4b9430673a44.png)















