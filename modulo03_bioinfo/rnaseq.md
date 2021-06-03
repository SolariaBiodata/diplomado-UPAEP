---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Bioinformática

### RNA seq

El estudio de las moléculas de **RNA** se puede realizar a través de métodos de secuenciación de ácidos nucleicos. _RNA-seq_ se refiere a la secuenciación de poblaciones de _RNA convertidos en cDNA_. Este tipo de moléculas se pueden obtener al acoplar técnicas como la _PCR_ con los productos de la _transcriptasa reversa_, la cual permite la transcripción de moléculas de RNA en moléculas de DNA. De este modo se puede derivar la cantidad de cada molécula original de RNA en la población, que presumiblemente se trata de un transcrito.

Este tipo de análisis para medir la cantidad de transcritos son conocidos como **transcriptómica**. En estos el objetivo es determinar la cantidad de cada tipo de transcritos en un contexto particular, ya sea que se esté revisando una condición específica o bien un tipo celular particular. Este tipo de análisis también pueden interpretarse como una captura instantánea en el tiempo, en la cual se determina un perfil de la cantidad de cada diferente trasncrito que se encuentran presentes en una célula.

La transcriptómica es una área que trata de responder preguntas relacionadas con la regulación genética, por tanto cualquier condición en la que exista una respuesta de expresión genética es susceptible de ser estudiada por este tipo de técnicas.

Existen algunas aplicaciones del RNA-seq que pueden ayudar a contestar diversas preguntas. Entre ellas se encuentran la _transcriptómica funcional_ y la _transcriptómica cuantitativa_.



### Transcriptómica funcional

Un caso importante consiste en la recuperación de transcritos cuando no se cuenta con una guía de referencia. Este tipo de análisis pretenden reconstruír un transcriptoma exclusivamente a partir de la información de secuencia de las lecturas. Para ello se utilizan estrategias de ensamble _de novo_. Sin embargo, al reconstruírse un transcriptoma existen algunas diferencias fundamentales entre los programas clásicos de ensamble de genomas y de transcriptomas.

| Genoma | Transcriptoma |
|--|--|
| Los contigs intentan representar secuencias grandes (cromosomas) | Los contigs representan unidades transcripcionales, las cuales son mucho más cortas que un cromosoma|
| Se espera una cobertura uniforme | Es esperado que existan regiones con profundidades diferentes, incluso regiones sin cobertura (debido al splicing alternativo) |
| Se espera construir un solo contig por locus | Es esperable contar con múltiples contigs por locus (como consecuencia del splicing alternativo) |

Uno de los software más utilizados para realizar esta clase de estudios es `Trinity`. Este programa realiza ensamble _de novo_ de transcriptomas y está compuesto por 3 módulos individuales de procesamiento. Para realizar el ensamble utiliza grafos _De Bruijn_. A continuación se muestra un esquema del funcionamiento de los módulos de este programa:

![](https://drive.google.com/uc?id=1m30FfpSC_WJsGFc8HLblxo1kwtLCrC0_&export=download "Pipeline Trinity PE")

Para hacer el ensamble asumimos que tenemos una pareja de lecturas preprocesadas `mis_lecturas_R1.fastq.gz` y `mis_lecturas_R2.fastq.gz`. Los resultados serán desplegados en una carpeta con nombre `salida` y se usarán 16 GB de memoria para ejecutar el programa:

```bash
Trinity --seqType fq --max_memory 16G --left mis_lecturas_R1.fastq.gz --rigth mis_lecturas_R2.fastq.gz --output salida/
```


### Transcriptómica cuantitativa

Cuando se tiene información de referencia, ya sea de un genoma anotado o de un transcriptoma de referencia se pueden usar protocolos donde múltiples condiciones pueden ser comparadas en términos del conteo de transcritos. En este caso se utiliza una aproximación de mapeo de lecturas a los transcriptomas. Estos presentan algunas consideraciones especiales ya que es perfectamente viable que una lectura sea alineada en diferentes exones, lo cual es consecuencia de la naturaleza de la transcripción.

Uno de los protocolos más conocidos para efectuar esta clase de análisis el el protocolo _tuxedo_. En este protocolo se realiza la implementación de diferentes módulos de procesamiento de los alineamientos y los conteos de transcritos. A continuación se muestra un diagrama de la implementación de este protocolo:

![](https://drive.google.com/uc?id=1myoii9DZADTj3WN6BGGOQtqmzXWGiJer&export=download "Pipeline Tuxedo")

Para implementar este protocolo es necesario utilizar `hisat2` el cual es un mapeador que está optimizado para alinear las lecturas por segmentos a un genoma o transcriptoma. Este tiene que ser _indexado_ antes de realizarse el mapeo, para ello asumimos que usaremos como prefijo `ref` para los índices y que tenemos un genoma en `referencia.fasta`:

```bash
hisat-build referencia.fasta ref

hisat2 --dta -x ref -1 mis_lecturas_R1.fastq.gz -2 mis_lecturas_R2.fastq.gz -S muestra.sam
```

En este caso se asume que contamos con lecturas pareadas preprocesadas `mis_lecturas_R1.fastq.gz` y `mis_lecturas_R2.fastq.gz`, el parámetro `dta` sirve para que la salida esté ajustada para cuantificación por `stringtie`. El archivo de salida se guarda en el archivo `muestra.sam`. 

Para realizar la visualización de este mapeo se pueden utilizar los comandos vistos en la [sección de ensambles](./ensambles#formato-sam):

```bash
samtools faidx referencia.fasta
samtools view -bS -T referencia.fasta muestra.sam > muestra.bam
samtools sort muestra.bam > muestra.sort.bam
samtools index muestra.sort.bam
```

Por otro lado es necesario utilizar `stringtie` para realizar la cuantificación de transcritos mapeados en cada muestra. En este caso el resultado se despliega en un archivo `muestra/transcritos.gtf`:

```bash
stringtie muestra.sort.bam -p 8 -o muestra/transcritos.gtf
```

No obstante, como idealmente pretendemos comparar múltiples muestras, una alternativa que se puede hacer asumiendo que hemos procesado todas las muestras en el mismo directorio, y que hemos realizado el procesamiento hasta el punto de tener el mapeo ordenado, consiste en automatizar el procesamiento mediante un ciclo `for`:

```bash
for i in $(ls *sort.bam); do
    stringtie $i -o ${i/sort.bam}/transcritos.gtf
done
```

Luego se procede con la conjunción de todos los transcritos:

```bash
ls */transcritos.gtf > gtf_todos.txt

stringtie --merge -o stringtie_combinado.gtf gtf_todos.txt

mkdir ballgown
```

Para realizar la comparación se requiere generar una estructura de archivos para `ballgown` misma que puede realizarse de manera  automática de esta forma:

```bash
for i in $(ls *sort.bam); do
    stringtie -e -B -p 24 -o ballgown/${i/sort.bam}/transcritos.gtf $i;
done
```



[Menú Principal](./)

[Atras](./ensambles)

[Siguiente](./metagenomica)
