---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Bioinformática

### Metagenómica

El área que se enfoca en el estudio del material génico directamente en muestras ambientales se conoce como ecogenómica, no obstante un término mucho más comun para referirse a este es **metagenómica**. Una de las preguntas fundamentales en este tipo de ensayos es:

> ¿Qué organismos están presentes en una muestra?

Un concepto fundamental se representa con el _ambiente_ el cual consiste en la relación entre componentes físicos, químicos y biológicos en un espacio. Con el advenimiento de las nuevas tecnologías genómicas ahora es posible realizar esta clase de análisis con gran detalle utilizando grandes volúmenes de información provenientes de muestras de comunidades microbianas. El contenido genómico de comunidades microbianas completas proporciona información sobre su _estructura_ y _función_, por lo que algunos objetivos que se pueden tratar con estos enfoques son:

 - Resolución de organismos presentes en una muestra ambiental
 - Estudio de microorganismos no-cultivables en condiciones _ad laboratorium_
 - Descubrimiento de material genético con organismos no descritos previamente

### Metaprofiling 16S

En 1977 se realizó [un estudio](https://doi.org/10.1073/pnas.74.11.5088) donde se sentaron las bases de la filogenia molecular de procariotas utilizando el gen **16S ribosomal**. Actualmente se conocen cerca de $$30,437$$ genomas de los tres dominios de la vida _Bacteria_, _Archaea_ y _Eukarya_. Estos han podido clasificarse utilizando moléculas de tasas de mutación estable como _16S_.

El gen ribosomal de compone de 9 regiones hipervariables, interespaciada por regiones conservadas. Secuencias específicos para cada especie dentro de una región hipervariable dada constituyen objetivos útiles para ensayos de diagnóstico y otras investigaciones científicas. Por ejemplo:

| Región | Resolución |
|--|--|
| **V1 - V8** | cerca de 110 especies bacterianas diferentes, incluyendo patógenos de transmisión sanguínea |
| **V1** | _Staphylococcus aureus_ y coagulase negative _Staphylococcus sp_ |
| **V2** | Especies de _Mycobacterial_  |
| **V3** | Especies de _Haemophilus_ |
| **V3-V4** | Metagenomica $$\sim 460$$ pb |

Este tipo de enfique implica realizar búsquedas de secuencias en bases de datos dedicadas a este tipo de información. Algunas bases de datos recomendadas son:

| Base de datos | Tipo de curación | Cantidad de nodos | Resolución | Tasa de error (%) |
|--|--|--|--|--|
| Silva | Manual | 12,117 | Género | $$\sim 17$$ |
| RDP | Semiautomática | 6,128 | Género | $$\sim 10$$ |
| GreenGenes | Automática | 3,093 | Especie | $$\sim 17$$ |
| NCBI | Manual | 1,522,150 | Especie | |
| OTT | Automática | 2,627,066 | Especie | | 

Un protocolo típico consiste en los siguientes pasos

 1. Análisis de control de calidad
 2. Desreplicar
 3. Eliminar quimeras
 4. Anotación contra base de datos
 5. Análisis de diversidad
 6. Estimación de perfiles taxonómicos

Para ello existen diferentes opciones de programas que pueden realizarlo:

- Metaxa2
- Qiime
- VSearch
- Usearch
- Mothur
- Spingo
- Mocat
- Parallel-meta
- Picrust

Un caso de uso con `qiime2` se muestra a continuación. Primero es necesario activar el entorno especial `qiime2-2021.04`:

```bash
conda activate qiime2-2021.04
```

Es necesario crear una tabla de metadatos, la cual debe contener información acerca de nuestras bibliotecas, esto se puede hacer con:

```bash
nano metadata.tsv
```

La tabla puede ser parecida a esto:

| #SampleID | BarcodeSequence | Treatment   | Group       | Year    | Concentration |
|-----------|-----------------|-------------|-------------|---------|---------------|
| #q2:types | categorical     | categorical | categorical | numeric | numeric       |
| SAMPLE_A  | CAGTGTCA        | Cont_A      | Control     | 2020    | 20.0          |
| SAMPLE_B  | CATTGTCA        | Cont_A      | Experiment  | 2021    | 25.0          |


Esta tabla la necesitamos cargar en `qiime`:

```bash
qiime tools inspect-metadata metadata.tsv
```

También se requiere crear un archivo manifiesto mediante:

```bash
nano manifiesto.csv
```

con información de este tipo:

|sample-id|absolute-filepath|direction  |
|---------|-----------------|-----------|
|SAMPLE_A |$PWD/raw/samplA.fastq|forward|
|SAMPLE_B |$PWD/raw/samplB.fastq|forward|

En este caso asumimos que una muestra `SAMPLE_A` esta compuesta por unas lecturas en la ruta relativa `raw/samplA.fastq`, y que tenemos otra muestra `SAMPLE_B` en `raw/samplB.fastq`. 

En seguida se procede a la carga de las lecturas, desreplicación y búsqueda de quimeras seguida de su remoción:

```bash
qiime tools import --type 'SampleData[SequencesWithQuality]' --input-path manifest.csv --input-format SingleEndFastqManifestPhred33 --output-path raw-seqs.qza

qiime vsearch dereplicate-sequences --i-sequences raw-seqs.qza --output-dir derep

qiime feature-table filter-features --i-table derep/dereplicated_table.qza --m-metadata-file chimeras/nonchimeras.qza --o-filtered-table filtered-table.qza

qiime feature-table filter-seqs --i-data derep/dereplicated_sequences.qza --m-metadata-file chimeras/nonchimeras.qza --o-filtered-data filtered-seqs.qza
```

Después se procede a realizar los agrupamientos (binning),

```bash
qiime tools export --input-path chimeras/chimeras.qza --output-path chimeras

qiime vsearch cluster-features-open-reference --i-table filtered-table.qza --i-sequences filtered-seqs.qza --i-reference-sequences chimeras/nonchimeras.qza --p-perc-identity 0.80 --output-dir clustered
```

Ahora se procede a realizar la asignación taxonómica, para lo cual se asume que se tiene una base de referencia en el archivo `gg13_16S.qza`, misma que puede descargarse en esta [liga](https://data.qiime2.org/2019.1/common/gg-13-8-99-nb-classifier.qza) mediante el comando `wget`.

```bash
qiime feature-classifier classify-sklearn --i-classifier gg13_16S.qza --i-reads clustered/clustered_sequences.qza --o-classification taxonomy.qza

qiime taxa collapse --i-table clustered/clustered-table.qza --i-taxonomy taxonomy.qza --p-level 6 --output-dir results

qiime tools export --input-path results/collapsed_table.qza --output-path export
```

Luego se realiza la exportación del archivo BIOM:

```bash
biom convert -i results/feature-table.biom --to-tsv -o results/feature-table.txt
```

Y se procede a realizar la exportación a formatos de visualización (`.qzv`'s):

```bash
qiime metadata tabulate --m-input-file taxonomy.qza --o-visualization vis/taxonomy.qzv
 
qiime taxa barplot --i-table clustered/clustered_table.qza --i-taxonomy taxonomy.qza --m-metadata-file metadata.tsv --o-visualization vis/taxa-barplot.qzv
```

Y utilizamos el comando de Solaria para exportar archivo Krona:

```bash
SolariaFeatureExporter results/feature-table.txt
```



### Metagenómica shotgun

Las tecnologías de secuenciación masiva surgieron gracias a la posibilidad de fragmentar genomas completos en segmentos de tamaños manejables. Esos fragmentos se secuencían y se estima que las lecturas en conjunto pueden ensamblarse para reconstruir las secuencias originales. Este concepto es clave en metagenómica, ya que al fragmentarse el material genético, cada lectura puede tener un origen distintivo, lo cual permite:

- Determinar qué organismos están presentes en una muestra (Clasificación taxonómica)
- Determinar qué genes se encuentran en una muestra (Clasificación funcional)
- Obtener genomas a partir de metagenomas.

Para realizar este tipo de análisis es fundamental realizar _ensambles_ lo cual da como resultado fragmentos de secuencia de longitud variable, la cual depende de su origen en diferentes genomas. Es por ello que también se requiere de un proceso denominado **genome binning** el cual consiste en agrupar estos fragmentos mediante diferentes técnicas de acuerdo a la relación entre los mismos, estos agrupamientos se denominan **bins**.

Algunos programas diseñados para este objetivo son los siguientes:

- Programas en línea de comandos
    - Kraken
    - Parallel-meta
    - Centrifuge
    - MEGAN
    - Focus
    - Metaphlan2
    - Clark
    - Anvio
- Programas _on line_
    - Taxonomer
    - OneCodex
- Programas de anotación funcional _on line_
    - Superfocus
    - MG-RAST
    - MEGAN
    - webMGA
- Bases de datos
    - Cazy
    - Kegg
    - Eggnog
    - COG
    - Kog
    - pfam

Para realizar asignación taxonómica existen dos aproximaciones que se basan en diferentes propiedades.

| Métodos basados en | Fundamentos |
|--|--|
| **similitud** | 1. Asignación de taxonomía por _homología_<br>2. Extracción de marcadores con mapeo directo contra bases de datos<br>3. Cada secuencia se identifica y agrupa en _Unidades taxonómicas operacionales_<br>4. Se ubica el _último ancestro común_ para ponderar las lecturas de acuerdo a un score, los resultados se ubican en un arbol filogenético de especies. |
| **Ccomposición** | 1. Asignación por medio de espectro de _k-meros_<br>2. Modelado basado en _machine learning_ de las características de la secuencia<br>3. Modelado del conjunto de lecturas, tratadas igual que una referencia<br> 4. Comparación entre los modelos generados y las referencias para determinar la asignación taxonómica lectura a lectura. |





[Menú Principal](./)

[Atras](./rnaseq)

[Siguiente](./#)
