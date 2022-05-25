---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

# Libreta con R para el protoloco de DADA2 

## Instalación de librerias 
Lo primero que vamos a realizar es la instación de DADA2. 
Instalamos la libreria devtools.
El objetivo de devtools es facilitar su vida como desarrollador de paquetes al proporcionar funciones de R que simplifican muchas tareas comunes.

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
El paquete phyloseq es una herramienta que funciona para importar, almacenar, analizar y mostrar gráficamente datos de secuenciación filogenética complejos que ya se han agrupado en unidades taxonómicas operativas (OTU), especialmente cuando hay datos de muestra asociados, árbol filogenético y/o asignación taxonómica de las OTUs.

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
```bash
fnFs <- sort(list.files(PATH, pattern="_R1_001.fastq", full.names = TRUE))
fnRs <- sort(list.files(PATH, pattern="_R2_001.fastq", full.names = TRUE))
sample.names <- sapply(strsplit(basename(fnFs), "_"), `[`, 1)
```

Visualizamos control de calidad de las lecturas de las lecturas Forward

```bash
plotQualityProfile(fnFs[1:3])
```
![control_calidad_fnFs_1](https://user-images.githubusercontent.com/54455898/170303438-f851ebda-3f5e-447f-b644-9a634e37a2dc.png "control_calidad_fnFs_1")

Visualizamos control de calidad de las lecturas de las lecturas Reverse

```bash
plotQualityProfile(fnRs[1:3])
```

![control_calidad_fnRs_2](https://user-images.githubusercontent.com/54455898/170303787-e06fdd06-b43a-4fa5-8094-90a03b560ef2.png "control_calidad_fnRs_2")



# Filtrado de las lecturas
Indicamos que generamos una subcaperta o subdirectorio llamado filtered donde se van almacenar los datos 

```bash
filtFs <- file.path(PATH, "filtered", paste0(sample.names, "_F_filt.fastq.gz"))
filtRs <- file.path(PATH, "filtered", paste0(sample.names, "_R_filt.fastq.gz"))
names(filtFs) <- sample.names
names(filtRs) <- sample.names
```
# Filtrado de las lecturas por tamaño 

```bash
out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(150,100),
              maxN=0, maxEE=c(2,2), truncQ=2, rm.phix=TRUE,
              compress=TRUE, multithread=TRUE)
```
# Visualización de las lecturas despues del trimming

```bash
plotQualityProfile(filtFs[1:3])
```

![lecturas_filt_Fs_3](https://user-images.githubusercontent.com/54455898/170303946-1580280f-9822-4ef6-8338-ca580a23280a.png "lecturas_filt_Fs_3")

```bash
plotQualityProfile(filtRs[1:3])
``` 

![lecturas_filt_Rs_4](https://user-images.githubusercontent.com/54455898/170304121-e1bc1b15-7993-4de3-880a-6b72d30c01da.png "lecturas_filt_Rs_4")

```bash
head(out)
```

# Filtrado de errores en las lecturas
Para este paso se utiliza la función lernErrors que es un modelo de error paramétrico (err), donde cada conjunto de datos de lecturas tiene un conjunto diferente de tasas de error. El método learnErrors aprende este modelo de error de los datos, alternando la estimación de las tasas de error y la inferencia de la composición de la muestra hasta que convergen en una solución conjunta consistente.

```bash
errF <- learnErrors(filtFs, multithread=TRUE)
errR <- learnErrors(filtRs, multithread=TRUE)
```
```bash
dadaFs <- dada(filtFs, err=errF, multithread=TRUE)
dadaRs <- dada(filtRs, err=errR, multithread=TRUE)
```
# Merge de las lecturas 

```bash
mergers <- mergePairs(dadaFs, filtFs, dadaRs, filtRs, verbose=TRUE)
```
# Remoción de Chimeras

```bash
seqtab <- makeSequenceTable(mergers)
seqtab.nochim <- removeBimeraDenovo(seqtab, method="consensus", multithread=TRUE, verbose=TRUE)
dim(seqtab.nochim)
sum(seqtab.nochim)/sum(seqtab)
write.table(seqtab.nochim, file = "AmpliconSequenceVariableTable.txt", sep = "\t")
```

# Resumen de los filtrados de control de calidad

```bash
getN <- function(x) sum(getUniques(x))
track <- cbind(out, sapply(dadaFs, getN), sapply(dadaRs, getN), sapply(mergers, getN), rowSums(seqtab.nochim))
colnames(track) <- c("input", "filtered", "denoisedF", "denoisedR", "merged", "nonchim")
rownames(track) <- sample.names
track
write.table(track,"Track_reads.tsv", sep="\t", quote=F, col.names=NA)
```
# Asignación taxonómica con la base de datos de SILVA

```bash
taxa<-assignTaxonomy(seqtab.nochim, "/content/reads/silva_nr_v132_train_set.fa.gz", multithread=TRUE)
```

# Removemos las secuencias y visualizamos la tabla de asignación taxonómica 

```bash
taxa.print <- taxa
rownames(taxa.print) <- NULL
head(taxa.print)
```

*** Adjuntar como se vería la tabla ***

```bash
write.table(taxa, file = "TaxonomyTable.txt", sep = "\t")
saveRDS(seqtab.nochim, "seqtab_final1.rds")
saveRDS(taxa, "tax_final1.rds")

seqtab <- readRDS("seqtab_final1.rds") 
taxtab <- readRDS("tax_final1.rds")
```

```bash
asv_seqs <- colnames(seqtab.nochim)
asv_headers <- vector(dim(seqtab.nochim)[2], mode="character")
asv_tab <- t(seqtab.nochim)
row.names(asv_tab) <- sub(">", "", asv_headers)
asv_tax <- taxa
row.names(asv_tax) <- sub(">", "", asv_headers)
obpy2<- phyloseq(otu_table(seqtab.nochim, taxa_are_rows=FALSE), tax_table(taxa))
ps2
```























