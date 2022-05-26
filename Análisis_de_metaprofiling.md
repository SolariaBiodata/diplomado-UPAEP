---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

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

El pipeline DADA2  tiene como punto de partida un conjunto de archivos fastq secuenciados por Illumina ("desmultiplexado"), que realiza un control de calidad que elimina quimeras y adaptadores. El producto final es una tabla de "variantes de secuencia de amplicón" (ASV), que es un análogo de mayor resolución de la tabla OTU tradicional que ofrecen otros programas.

```bash
devtools::install_github("benjjneb/dada2", ref="v1.16")
```
```bash
library(dada2)
```
## Instalamos phyloseq
El paquete ****phyloseq**** es una herramienta que funciona para importar, almacenar, analizar y mostrar gráficamente datos de secuenciación filogenética complejos que ya se han agrupado en OTUs, especialmente cuando hay datos de muestra asociados, árbol filogenético y/o asignación taxonómica de las OTUs.

```bash
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("phyloseq")
```
## Instalamos microbiome
```bash
install_github("microbiome/microbiome")
```
## Instalamos microbiome
```bash
library(microbiome)
```
## Instalamos Fantaxtic 
***Fantaxtic*** es un paquete que contiene un conjunto de funciones contenedoras para los paquetes phyloseq y ggplot2 en el software R que convierte los datos de conteo taxonómico ordinarios en gráficos fantásticos listos para publicación. Las figuras Fantaxtic vienen como figuras completamente estilizadas con colores agradables y un control de trazado máximo.

```bash
devtools::install_github("gmteunisse/Fantaxtic")
```
```bash
library(fantaxtic)
```
```bash
library(ggplot2)
```
## Ruta de las lecturas
Indicamos la ruta de las lecturas

```bash
PATH = "/Ruta/Lecturas"
list.files(PATH)
```

Cargar los archivos de la corrida de secuenciación

```bash
fnFs <- sort(list.files(PATH, pattern="_R1_001.fastq", full.names = TRUE))
fnRs <- sort(list.files(PATH, pattern="_R2_001.fastq", full.names = TRUE))
sample.names <- sapply(strsplit(basename(fnFs), "_"), `[`, 1)
```

Visualizamos el control de calidad de las lecturas Forward

```bash
plotQualityProfile(fnFs[1:3])
```
![control_calidad_fnFs_1](https://user-images.githubusercontent.com/54455898/170303438-f851ebda-3f5e-447f-b644-9a634e37a2dc.png "control_calidad_fnFs_1")

Visualizamos el control de calidad de las lecturas Reverse

```bash
plotQualityProfile(fnRs[1:3])
```

![control_calidad_fnRs_2](https://user-images.githubusercontent.com/54455898/170303787-e06fdd06-b43a-4fa5-8094-90a03b560ef2.png "control_calidad_fnRs_2")


## Filtrado de las lecturas
Indicamos que generamos una subcaperta o subdirectorio llamado filtered donde se van almacenar los datos 

```bash
filtFs <- file.path(PATH, "filtered", paste0(sample.names, "_F_filt.fastq.gz"))
filtRs <- file.path(PATH, "filtered", paste0(sample.names, "_R_filt.fastq.gz"))
names(filtFs) <- sample.names
names(filtRs) <- sample.names
```
## Filtrado de las lecturas por tamaño 


```bash
out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(150,100),
              maxN=0, maxEE=c(2,2), truncQ=2, rm.phix=TRUE,
              compress=TRUE, multithread=TRUE)
```
## Visualización de las lecturas después del trimming

#### Visualizamos el filtrado de lecturas Forward

```bash
plotQualityProfile(filtFs[1:3])
```

![lecturas_filt_Fs_3](https://user-images.githubusercontent.com/54455898/170303946-1580280f-9822-4ef6-8338-ca580a23280a.png "lecturas_filt_Fs_3")

#### Visualizamos el filtrado de lecturas Reverse

```bash
plotQualityProfile(filtRs[1:3])
``` 

![lecturas_filt_Rs_4](https://user-images.githubusercontent.com/54455898/170304121-e1bc1b15-7993-4de3-880a-6b72d30c01da.png "lecturas_filt_Rs_4")

```bash
head(out)
```

## Filtrado de errores en las lecturas
Para este paso se utiliza la función ***lernErrors*** que es un modelo de error paramétrico (err), donde cada conjunto de datos de lecturas tiene un conjunto diferente de tasas de error. El método ***learnErrors*** aprende este modelo de error de los datos, alternando la estimación de las tasas de error y la inferencia de la composición de la muestra hasta que convergen en una solución conjunta consistente.

```bash
errF <- learnErrors(filtFs, multithread=TRUE)
errR <- learnErrors(filtRs, multithread=TRUE)
```
```bash
dadaFs <- dada(filtFs, err=errF, multithread=TRUE)
dadaRs <- dada(filtRs, err=errR, multithread=TRUE)
```
## Merge de las lecturas 

```bash
mergers <- mergePairs(dadaFs, filtFs, dadaRs, filtRs, verbose=TRUE)
```
## Remoción de chimeras

```bash
seqtab <- makeSequenceTable(mergers)
seqtab.nochim <- removeBimeraDenovo(seqtab, method="consensus", multithread=TRUE, verbose=TRUE)
dim(seqtab.nochim)
sum(seqtab.nochim)/sum(seqtab)
write.table(seqtab.nochim, file = "AmpliconSequenceVariableTable.txt", sep = "\t")
```

## Resumen de los filtrados de control de calidad

```bash
getN <- function(x) sum(getUniques(x))
track <- cbind(out, sapply(dadaFs, getN), sapply(dadaRs, getN), sapply(mergers, getN), rowSums(seqtab.nochim))
colnames(track) <- c("input", "filtered", "denoisedF", "denoisedR", "merged", "nonchim")
rownames(track) <- sample.names
track
write.table(track,"Track_reads.tsv", sep="\t", quote=F, col.names=NA)
```
## Asignación taxonómica con la base de datos de SILVA

```bash
taxa<-assignTaxonomy(seqtab.nochim, "/content/reads/silva_nr_v132_train_set.fa.gz", multithread=TRUE)
```

## Removemos las secuencias y visualizamos la tabla de asignación taxonómica 

```bash
taxa.print <- taxa
rownames(taxa.print) <- NULL
head(taxa.print)
```

![vistaprevia_asigtaxonomica](https://user-images.githubusercontent.com/54455898/170314876-3a42490a-a67e-4ca5-94f1-08a6c935cd93.png "vista preeliminar")


```bash
write.table(taxa, file = "TaxonomyTable.txt", sep = "\t")
saveRDS(seqtab.nochim, "seqtab_final1.rds")
saveRDS(taxa, "tax_final1.rds")

seqtab <- readRDS("seqtab_final1.rds") 
taxtab <- readRDS("tax_final1.rds")
```
## Guardamos y creamos un objeto Phyloseq 

```bash
asv_seqs <- colnames(seqtab.nochim)
asv_headers <- vector(dim(seqtab.nochim)[2], mode="character")
asv_tab <- t(seqtab.nochim)
row.names(asv_tab) <- sub(">", "", asv_headers)
asv_tax <- taxa
row.names(asv_tax) <- sub(">", "", asv_headers)
ps<- phyloseq(otu_table(seqtab.nochim, taxa_are_rows=FALSE), tax_table(taxa))
```
## Gráficas apiladas

```bash
top20 <- names(sort(taxa_sums(ps), decreasing=TRUE))[1:20]
ps.top20 <- transform_sample_counts(ps, function(OTU) OTU/sum(OTU))
ps.top20 <- prune_taxa(top20, ps.top20)
plot_bar(ps.top20, fill="Family")
```


![grafica_apilada_5](https://user-images.githubusercontent.com/54455898/170310406-c17914a5-6fe7-4b7c-822d-111ea5e5b5ab.png "grafica_apilada")


## Graficamos con Fantaxtic 

```bash
fantaxtic_bar(ps.top20, color_by = "Family", label_by = "Genus", other_label = "Other")
```
![grafica_fantaxtic_6](https://user-images.githubusercontent.com/54455898/170310836-d9196878-59f2-4606-a3b4-b13f760d86d4.png "grafica_fantaxtic")


