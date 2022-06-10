
# Análisis de diversidad en R

### Instalación de librerias

Activamos la librería de ***ggplot2***: 

```bash
library(ggplot2)
```

Debemos tener instalado ***reshape2***, el cual facilita la transformación de datos entre los formatos a lo largo y ancho:

```bash
install.packages("reshape2")
```
```bash
library(reshape2)
```
Intalamos ***BiocManager*** para tener un mejor análisis estadístico y la comprensión de datos genómicos a paritr de otros paquetes como ***phyloseq***:

```bash
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("phyloseq")
```
```bash
library(phyloseq)
```
Instalamos el paquete de ***lattice*** para permitir un fácil acondicionamiento sobre los datos y producir gráficos ***múltiples pequeños***: 

```bash
install.packages("lattice")
```
***Permute*** proporciona funciones para generar permutaciones restringidas y no restringidas:

```bash
install.packages("permute")
```
```bash
library(permute)
```
Con ***vegan*** podemos realizar los análisis de divesidad que se mostrarán más adelante:

```bash
install.packages("vegan")
```
```bash
library(vegan)
```
Instalamos ***dplyr***:

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

### Obtenemos la tabla de abundancia relativa

```bash
prop<-prop.table(data.matrix(datos), 2)
```
### Con la función melt convertimos la tabla en un data frame

```bash
dat_m <- melt(prop)
head(dat_m)
```

![2_dat_m](https://user-images.githubusercontent.com/54455898/172859014-b0e3d603-6866-42aa-80c3-dbb145f4892e.png)

### Adicionamos nombres a las columnas 

```bash
colnames(dat_m)<-c("Specie", "Sample", "Abundance")
```
### Realizamos una grafica apilada de las abundacias relativas con ggplot2

```bash
 ggplot(dat_m, aes(Sample, Abundance, fill =Specie )) +
   geom_bar(stat = "identity")+xlab("Sample")+
   ylab("Relative abundance")+theme_bw()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))+
   theme(legend.text=element_text(size=rel(0.6)))+ggtitle("Species")+
   theme(legend.position = "right",legend.direction = "vertical")+
   scale_fill_manual(values = c("#d7263d","#f46036","#2e294e","#1b998b","#c5d86d","#759aab","#faf2a1","#4d8b31","#ffc800",
   "#1c2541","#3a506b","#5bc0be","#6fffe9","#ff8811","#f4d06f","#fff8f0","#9dd9d2","#eeebd3",
   "#F04C05","#B74211","#7E391D","#442F29","#0B2535","#15640F","#4A5414","#7F4419","#B4331E","#E92323",
   "#EAAD12","#B3A647","#7BA07C","#4499B0","#0C92E5","#5BF30A","#60B835","#667C61","#6B418C","#7005B7",
   "#F44E4E","#B96669","#7D7D83","#42959E","#06ACB8","#EF745C","#D06257","#B15052","#923E4D","#722B47","#531942","#34073D",
   "#074170","#1B4E60","#2F5B51","#436941","#567631","#6A8322","#7E9012","#8ecae6","#219ebc","#023047","#ffb703","#fb8500",
   "#f6d7d7","#df7472","#53032b","#2d0627","#06262c","#72dddf","#0fd780","#2b5403","#a6df72","#c9d70f",
   "#a09ebb","#a8aec1","#b5d2cb","#bfffbc","#a6ffa1","#476a6f","#031a6b","#033860","#004385","#305252",
   "#160f29","#246a73","#368f8b","#f3dfc1","#ddbea8","#ea526f","#e76b74","#d7af70","#c9c19f","#edf7d2",
   "#f94144","#f3722c","#f8961e","#f9844a","#f9c74f","#90be6d","#43aa8b","#4d908e","#577590","#277da1"))+ guides(fill = guide_legend(nrow = 34))
```

![3_gráfica_apilada_ggplot2](https://user-images.githubusercontent.com/54455898/172859730-285b9c29-a30a-44eb-98e1-5e3e82793a9c.png)

### Obtención de indices de diversidad Alfa con phyloseq

Con la función de "sample_data" de phyloseq introduccimos los metadatos:

```bash
metadata<-read.table("/content/sampledata.txt",sep="\t", header=T, row.names=1)
samples = sample_data(metadata)
samples
```
![4_metadata](https://user-images.githubusercontent.com/54455898/172860257-ab4756a5-1457-424d-827f-f4f455c4a18d.png)

### Visualizamos como se encuentran organizado los datos

```bash
head (datos)
```
![datos_head](https://user-images.githubusercontent.com/54455898/172974649-464269dd-3d43-422d-8b65-cea07785d877.png)

```bash
OTU <- otu_table(datos, taxa_are_rows = TRUE)
GP <- prune_species(speciesSums(physeq1) > 0, OTU)
GP
```
#### Construimos un objeto a partir de los OTU y las muestras:
```bash
objetophy<-phyloseq(OTU,samples)
objetophy
```
![objetophy](https://user-images.githubusercontent.com/54455898/172986047-95af61e8-fcc7-4fb2-bdd3-275d7b1e8b59.png)

### Graficamos los índices

```bash
plot_richness(objetophy, color="Site")  
```
![5_plot_richness](https://user-images.githubusercontent.com/54455898/172989228-a7e677c1-6997-407a-b162-f3b50096110e.png)

#### Podemos extraer ciertas columnas y visualizarlas mejor

```bash
plot_richness(objetophy, measures=c("Chao1", "Shannon", "Simpson"),color="Site") + geom_point(size=5, alpha=0.7) 
```
![6_plot_richness](https://user-images.githubusercontent.com/54455898/172987491-2e48ec49-051f-4f21-a61a-069568020d38.png)

### Calculamos diversidad Beta 
#### Primero se calcula la matriz de distancia ***Bray-Curtis***

```bash
dist_bc <- as.matrix(vegdist(OTU, method = "bray"))
```
#### A partir de ***Bray-Curtis*** obtenemos la raíz cuadrada y con ello convertir las distancias en métricas

```bash
dist_bc_sqrt <- sqrt (dist_bc)
```
```bash
pcoa_bc = ordinate(objetophy, "PCoA", "bray") 
```
```bash
plot_ordination(objetophy, pcoa_bc, color = "Site") + geom_point(size=5, alpha=0.7)
```
![7_plot_ordination](https://user-images.githubusercontent.com/54455898/172987537-ad18fc49-e262-429f-aa6c-12d6a02da9d8.png)

#### Generamos un ***heatmap*** con base al objeto que se creó anteriormente

```bash
plot_heatmap(objetophy)
```
![8_plot_heatmap](https://user-images.githubusercontent.com/54455898/172988445-25039dfb-93d4-4d37-b847-53a17726493e.png)








