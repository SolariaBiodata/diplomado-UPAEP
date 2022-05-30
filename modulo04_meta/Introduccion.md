---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

## Bioinformática

> "La metodología [clonación de ADN ambiental en E. coli para la detección de fenotipos] ha sido posible gracias a los avances en biología molecular y genómica eucariótica, que han sentado las bases para la clonación y el análisis funcional de los genomas colectivos de la microflora del suelo, que denominamos el metagenoma del suelo." - ***Jo Emily Handelsma*** , Directora del ***Wisconsin Institute for Discovery*** de la ***University of Wisconsin–Madison***

### La Metagenómica en el centro de todo

![flow_metagenomics](https://user-images.githubusercontent.com/54455898/171058417-bffda134-4217-4565-91e8-81d3f5834d7d.jpg "La Metagenómica en el centro de todo")

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
| **Similitud** | 1. Asignación de taxonomía por _homología_<br>2. Extracción de marcadores con mapeo directo contra bases de datos<br>3. Cada secuencia se identifica y agrupa en _Unidades Taxonómicas Operacionales_<br>4. Se ubica el _último ancestro común_ para ponderar las lecturas de acuerdo a un score, los resultados se ubican en un arbol filogenético de especies. |
| **Composición** | 1. Asignación por medio de espectro de _k-meros_<br>2. Modelado basado en _machine learning_ de las características de la secuencia<br>3. Modelado del conjunto de lecturas, tratadas igual que una referencia<br> 4. Comparación entre los modelos generados y las referencias para determinar la asignación taxonómica lectura a lectura. |


[Menú Principal](./index.md)

[Atras](./index.md)

[Siguiente](./Analisis_de_metaprofiling)
