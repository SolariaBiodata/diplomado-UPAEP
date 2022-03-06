---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

## Bioinformática

### Análisis de variantes

Un tipo de estudios muy usuales consiste en resecuenciar individuos de una especie de la cual ya existe un genoma de **referencia**. Esta clase de análisis se realizan para encontrar diferencias que existen entre individuos. Las variantes corresponden a esas diferencias que se pueden encontrar en un individuo con respecto el genoma que se tiene de referencia referencia.

Existen diferentes tipos de variantes entre los cuales se encuentran:

- Variantes puntuales
    - Polimorfismos de un solo nucleótido
    - Inserciones
    - Deleciones
    - Polimorfismos de varios nucleótidos
- Variantes estructurales
    - Rearreglos cromosomales
    - Translocaciones
    - Inversiones
    - Duplicaciones / Número de copia
    - Inserciones
    - Deleciones

Las variantes puntuales son el tipo de variantes que se pueden detectar de manera directa mediante secuenciación masiva. Estas tienen como origen las tasas de error naturales de las enzimas implicadas en el proceso de replicación del DNA. Debido a que en el proceso de secuenciación también se utilizan enzimas relacionadas con los procesos de replicación del DNA, es indispensable poder distinguir las variantes biológicas de los artificios derivados del proceso técnico.

A continuación se detallan algunos conceptos clave para los análisis de variantes:

- **Alelo** Es una versión de la variante en diferentes genomas
    - **Referencia** Es el alelo presente en el genoma de referencia
    - **Alternativo** Es el alelo que no está en el genoma de referencia
    - **Mayor** Es el alelo que se encuentra con mayor frecuencia en una población
    - **Menor** Es el alelo que se encuentra con menor frecuencia en una población
- **Ploidía** Cantidad de moléculas que contienen un _locus_ por individuo
    - **Genotipo** Representa el estado alélico de cada cromosoma para una variante en un individuo
- **Equilibrio de ligamiento** Dos variantes que se encuentran en equilibrio tienen los mismos alelos en diferentes individuos, las variantes segregan juntas
    - **Haplotipo** Combinación de variantes de diferentes loci en un mismo individuo, es un estado genotípico.

Para poder realizar un análisis de variantes es muy importante considerar diferentes aspectos que se relacionan con las propiedades inherentes de una especie, el individuo y las características técnicas de una muestra. En principio se requiere tener amplia información de referencia, el genoma de referencia es importante, pero mientras más información exista, como variantes comunes, archivos de anotación de genoma, entre otros son muy útiles. La ploidía de un cromosoma en un organismo también es sumamente relevante, ya que las variantes tienen que poder ajustar la información provista en la muestra con un modelo que contemple este parámetro. Esto es particularmente importante en casos en el que analizamos mutaciones germinales, es decir mutaciones que han sido heredadas al individuo con respecto a mutaciones que pueden tener un origen patológico donde algun tejido ha empezado a acumular una mutación. Otro aspecto a considerar es la posibilidad de realizar la secuenciacin de manera selectiva, es decir, obtener secuencias derivadas de un enriquecimiento en algunas regiones del genoma.

### Protocolo básico

En el análisis de variantes existen algunos procesos generales:

1. Estricto control de calidad de las lecturas
2. Alineamiento de las lecturas con un genoma de referencia
3. Llamado de variantes
4. Procesamiento de las variantes

En la siguiente figura se muestra un esquema de este proceso básico

![](https://drive.google.com/uc?id=1CmOoBNRjgXnhGo2NiUu7ZiRwYcH_9cce&export=download "Protocolo básico de llamado de variantes")

En este protocolo empezaremos por activar un ambiente de `conda` y movernos a una carpeta de trabajo, donde generaremos un par de ligas con nuestras lecturas y un genoma de referencia.

```bash
conda activate varcall-sb
cd <ruta_de_carpeta_de_trabajo>
ln -s /media/data/solaria/diplomadoUPAEP/aa_solaria/varcall/SRR2584857.fq.gz muestra.fastq.gz
ln -s /media/data/solaria/diplomadoUPAEP/aa_solaria/varcall/ecoli-rel606.fa referencia.fasta
```

Ahora contamos con un archivo `referencia.fasta` con el genoma y `muestra.fastq.gz` contiene lecturas que de ahora en adelante asumiremos que han pasado por un preprocesamiento astringente.

El siguiente paso consiste en realizar el alineamiento, para lo cual es necesario generar índices de la referencia con `bwa` y `samtools` de la siguiente forma:

```bash
bwa index referencia.fasta
samtools faidx referencia.fasta
bwa mem -t 2 referencia.fasta muestra.fastq.gz > muestra.sam
```

En este punto ya contamos con un archivo de alineamiento `muestra.sam` con la información necesaria para encontrar variantes, sin embargo es necesario realizar algunas operaciones estándar antes de proceder:

```bash
samtools view -bS -T referencia.fasta muestra.sam > muestra.bam
samtools sort muestra.bam > muestra.ordenada.bam
samtools index muestra.ordenada.bam
```

Una vez procesado este alineamiento es viable realizar una visualización:

```bash
samtools tview --reference referencia.fasta muestra.ordenada.bam
```

Lo que sigue es realizar el llamado de variantes, lo cual se realiza con `mpileup`:

```bash
samtools mpileup -uf referencia.fasta muestra.ordenada.bam | bcftools call -vc - > muestra.vcf
```

Los arhivos `vcf` contienen la información de las variantes detectadas en una muestra. Estos archivos estan compuestos por dos secciones, al principio se encuentra el _encabezado_ cuya caracteristica principal es que sus líneas comienzan con `##`, en seguida se encuentra la sección de las variantes las cuales presentan información de manera tabular de acuerdo a la siguiente estructura de columnas:

| Posición | Campo | Significado |
|--|--|--|
| $$1$$ | Cromosoma | Es el contig o cromosoma en el genoma de referencia en el que se pocisiona la variante |
| $$2$$ | Posición | La pocisión nucleotídica en el cromosoma en el que inicia el alelo de referencia, la posición incial tiene el valor $$1$$ |
| $$3$$ | Identificador | Es una cadena de texto que identifica a la variante |
| $$4$$ | Referencia | Corresponde al alelo presente en el genoma de referencia, se usa un `0` para representar este alelo |
| $$5$$ | Alternativo | Corresponde al o los alelos (separados por `,`) alternativos detectados, cada uno de ellos se representa por la posición en la que aparece en este campo, la posición inicial tiene el valor $$1$$ |
| $$6$$ | Calidad | Se utiliza para expresar un valor numérico que representa la calidad de detección de la variante |
| $$7$$ | Filtro | Sirve para agregar etiquetas de texto con la finalidad de excluir variantes que no cumplen con algun criterio |
| $$8$$ | Información | Este campo sirve para agregar información de diferentes métricas que se anotan de una variante, cada anotación se separa por un `;` y se usa un formato de `llave=valor` para definir cada una |
| $$9$$ | Formato | Sirve para definir la forma en la que se despliega la información de los individuos, un subcampo que nunca falta es `GT` el cual corresponde al genotipo asignado, cada subcampo se separa por `:` |
| $$(10,..)$$ | Muestras | Cada columna a partir de la $$10$$ corresponde a la información en el formato definido en la columna $$9$$ de cada muestra, cada subcampo se separa por `:`, si un subcampo está compuesto por un arreglo de valores, estos se separan mediante `,`, usualmente el subcampo correspondiente al `GT` contiene el genotipo asignado a dicha muestra, donde los alelos usan los valores referenciados en los campos $$4$$ y $$5$$, los alelos se pueden separar por `/` cuando no existe fase o por `|` cuando sí se determina la fase |

### Protocolo de buenas prácticas

El principal objetivo de un análisis de variantes es determinar con alta confiabilidad aquellas mutaciones que corresponden con variaciones biológicamente relevantes. Por esa razón es fundamental contar con protocolos que permitan realizar este análisis con ciertos criterios que minicen la probabilidad de asignar un artificio como variante biológica. Debido a ello se han propuesto diferentes protocolos, uno de ellos es el [protocolo del Broad Institute](https://gatk.broadinstitute.org/hc/en-us/sections/360007226651-Best-Practices-Workflows). Este se ha diseñado para realizar análisis de variantes en genoma humano, del cual existen muchos recursos con información relevante que aportan información crucial para el análisis.

Dicho protocolo ha sido usado como base para la generación de protocolos de alta confianza, a continuación se muestra un esquema general de los procesos más importantes que se deben realizar:

![](https://drive.google.com/uc?id=14WOs14_aR8-N6L-1w5mACPJZCvb9mJQ1&export=download "Protocolo de buenas prácticas de análisis de variantes")

Como se puede ver, el proceso implica una serie de pasos:

| Paso | Proceso | Herramientas | Recursos adicionales |
|--|--|--|--|
| $$1$$ | Control estricto de calidad de las lecturas | `Trimmomatic`, `fastqc` | Archivo de adaptadores |
| $$2$$ | Alineamientos de lecturas pareadas y sin parear por separado | `bwa` | Genoma de referencia de alta confiabilidad |
| $$3$$ | Integración de los alineamientos correspondientes a una muestra | `samtools`, `picard` | Manifiestos de corrida |
| $$4$$ | Realineamiento y marcaje de duplicados | `abra`, `picard` | Panel de secuenciación |
| $$5$$ | Recalibración de calidad de asignación de bases | `gatk` | Variantes de alta confiabilidad, panel de secuenciación |
| $$6$$ | Llamado de variantes | `gatk` | Panel de secuenciación |
| $$7$$ | Genotipificación conjunta | `gatk` | gVCFs de muestras adicionales |
| $$8$$ | Filtrado de variantes | `gatk`, `grep`, `awk` | Variantes de alta confiabilidad para SNPs y para INDELes |
| $$9$$ | Individualización de VCFs | `bcftools`, `gatk` |  |
| $$10$$ | Anotación de variantes | `snpEff`, `gatk` | Bases de datos de anotación de variantes |

Estos procesos buscan minimizar la probabilidad de obtener un falso positivo con lo cual se obtienen solo variantes de alta confianza. Esto se logra gracias a los pasos de _machine learning_ que mejoran la clasificación de parámetros en diferentes partes del protocolo. Estas clasificaciones pueden realizarse debido a que se cuenta con vastos repositorios de información de alta confiabilidad en los que se han catalogado variantes comunes del genoma.

Asimismo, se utiliza toda la información posible para aumentar la certeza en la asignación de genotipos. Tal es el caso de la genotipificación conjunta en donde se aprovecha la información de diversas muestras (e incluso corridas) que se acumulan con la información recien obtenida para optimizar la confianza de los resultados.

### Anotación de variantes

En este proceso se utiliza la información depositada en diferentes recursos públicos para incluirse en los resultados de un análisis de variantes. En este proceso se agrega información de idntificación en diversos repositorios, asi como también propiedades características de una variante, ya sea en términos clínicos, bioquímicos, moleculares, etcétera. Esta información adicional provee de información relevante para que otros profesionales puedan extraer información relevante, ejemplo de ello son las anotaciones clínicas que se usan para reportes de resultados de pruebas genéticas.

En términos generales cada segmento de información adicional puede estar contenida en diversos repositorios de información. En _homo sapiens_ existen diferentes bases de datos que proveen diferentes tipos de información:

| Base de datos | Tipo de información |
|--|--|
| dbSNP | Identificación y propiedades genéticas de una variante |
| 1000G | Información de las frecuencias alélicas de una variante en diferentes poblaciones |
| ClinVar | Anotaciones de clasificación clínica de una variante relacionadas a diferentes patologías |
| PharmGKB | Anotaciones de relaciones farmacogenéticas de una variante |
| Mills_1KG | Anotación de alta confianza de indeles de humano |
| Cosmic | Información del atlas de variantes somáticas de cáncer |

Uno de los software más comunes para la integración de anotaciones es `snpEff`. Este software se ha desarrollado para adecuarse a los estándares de salidas de `gatk` por lo cual es muy común su implementación en protocolos de buenas prácticas. Así mismo, poseé la capacidad de incluir información de recursos como `dbNSFP` donde se contiene información recopilada de diferentes fuentes de anotación, predictores de efectos funcionales, métricas de frecuencia poblacional, evolutivas entre otras.


[Menú Principal](./)

[Atras](./metagenomica)

