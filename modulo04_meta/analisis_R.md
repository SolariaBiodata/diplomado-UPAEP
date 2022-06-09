
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
| °  | SRR10095342  | SRR3050168  | SRR3961733  | SRR3961734  | SRR3961739  | SRR5214706  | SRR790522  | SRR816113699  |
|---------|---------|--------|--------|--------|--------|--------|--------|--------|
| °  | <int>	  | <int>	  | <int>	  | <int>	  | <int>	  | <int>	  | <int>	  | <int>	  |
| Rhodococcus erythropolis	  | 2  | 17  | 3  | 4  | 2  | 2  | 13  | 5  |
| Rhodococcus erythropolis SK121	  | 0  | 1  | 0  | 0  | 0  | 0  | 0  | 0  |
| Rhodococcus erythropolis DN1	  | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 0  |
| Rhodococcus erythropolis PR4	  | 0  | 1  | 0  | 0  | 0  | 0  | 1  | 0  |
| Rhodococcus erythropolis CCM2595	  | 0  | 0  | 1  | 0  | 0  | 0  | 0  | 0  |
| Rhodococcus qingshengii	  | 0  | 3  | 1  | 0  | 0  | 1  | 5  | 0  |
    

![1_r](https://user-images.githubusercontent.com/54455898/172842951-4340d3cc-5416-4183-b6d2-4b9430673a44.png)















