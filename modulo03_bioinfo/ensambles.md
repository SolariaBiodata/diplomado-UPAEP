---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Bioinformática

### Ensambles

La secuenciación permite obtener el contenido de la secuencia de miles de lecturas. Estas son fragmentos provenientes de moléculas de DNA cuya función biológica está determinada por la completitud de la secuencia. Por lo tanto, uno de los procesos más importantes en la secuenciación consiste en la _reconstrucción_ de la secuencia original, es decir, de la molécula de orígen biológico que se fragmentó al incio del proceso. Los procesos que se orientan a resolver este problema se conocen como _ensambles_.

![](https://lh3.googleusercontent.com/15yiepX-ss6sYMDsFtz_xA1cE4uAKeSur6G8AEu1U43AQnGVaR732ewhFhh7xBwM9vjeywIiGB6dFMkq70uIQL6XH7i6g60qlEBoHP0QH2C2qZInxHiO3zZiUnhWySEl_cfWSVlRYHM)

### Ensamble _de novo_

Un tipo particular de ensamble es el _de novo_, lo cual ímplica que la única información disponible para realizar el ensamble es la información de secuencia contenida en todas las lecturas. Un caso análogo al problema de armar un rompecabezas sin ninguna clase de guía.

Un concepto crucial para resolver el problema de los ensambles es el sobrelapamiento:

```
           CTCGGCTCTAGGCCCTCATTTTT
           CTCGGCTCTAGGCCCTCATTTT
        TATCTCGACTCTAGGCCCTCA
        TATCTCGACTCTAGGCC
    TCTATATCTCGGCTCTAGG
GGCGTCTATATCTCG
GGCGTCTATATCT
GGCGTCTATATCT
```
```
GGCGTCTATATCTCGGCTCTAGGCCCTCATTTTT
```

Así mismo, también aparece otro concepto importante que implica alinear dos secuencias $$a$$ (`TCTATATCTCGGCTCTAGG`) y $$b$$ (`TATCTCGACTCTAGGCC`):

```
TCTATATCTCGGCTCTAGG
    IIIIIII IIIIIII
    TATCTCGACTCTAGGCC
``` 

en este caso el **sufijo** de $$a$$ es similar al **prefijo** de $$b$$, tomando en cuenta que la similaridad es flexible, es decir, podemos aceptar coincidencias perdidas debido a que pueden presentarse diversas fuentes de variación.

Existen diferentes métodos para recuperar ensambles _de novo_, a continuación se describen algunos criterios importantes:

| Método | Fundamentos | Casos de uso |  Ejemplos de software |
|--|--|--|--|
| **OLC** | * Construcción de grafos de sobrelapes <br> * Refinamiento de los grafos <br> * Generación de consensos | Funcionan mejor con<br> lecturas largas | 1. Celera Assembler<br> 2. Newbler<br> 3. Arachne<br> 4. Canu |
| **Gráficas _de Bruijn_** | * Descomposición de lecturas en k-meros <br> * Generación de gráficas de sobrelapes de k-meros <br> * Implementación de la solución algorítmica para encontrar _ciclos Eulerianos_ | Se usan con lecturas<br> de alta calidad, pueden ser <br>lecturas cortas | 1. Euler<br> 2. Velvet<br> 3. Spades<br> 4. Abyss |

Los ensambles _de novo_ son procesos cuyo resultado final son secuencias largas con el ensamble de las lecturas. Estas secuencias son la representación de la secuencia contigua de los sobrelapes de las lecturas, mismas que son conocidas como **contig**. Debido a que son secuencias de nucleótidos la forma general de contener dicha información es a través de archivos en formato FASTA. En el mejor de los escenarios cada contig representa una molécula de DNA, es decir cromosomas, plásmidos u otras únidades básicas de replicación de ADN, sin embargo en la práctica algunos contigs son el resultado de la resolución de problemas derivados de secuencias repetidas a lo largo del genoma.

A continuación se aportan ejemplos de uso de algunos ensambladores. Para ello asumiremos que tenemos una pareja de archivos con lecturas pareadas preprocesadas `mislecturas_R1.fastq` (las lecturas en el sentido _forward_) y `mislecturas_R2.fastq` (en sentido _reverse_) y que `ruta/salida/` corresponde a la ruta relativa del directorio que se desea crear.

**velvet**

Para implementar este software se requieren de dos programas `velveth` y `velvetg`. El primero realiza la generación de k-meros, donde precisamente el valor $$k$$ se determina. El segundo realiza la solución del gráfico de _de Bruijn_ utilizando la estructura de directorios generado por `velveth`. 

```bash
velveth ruta/salida/ 31 -separate mislecturas_R1.fastq mislecturas_R2.fastq

velvetg ruta/salida/
```

En este ejemplo se usa $$k=31$$.

**spades**

```bash
spades.py -1 mislecturas_R1.fastq -2 mislecturas_R2.fastq -o ruta/salida
```

**canu**

Este programa funciona mejor con lecturas largas de tecnologías de secuenciación de una sola molécula, por lo que asumiremos que `mis_lecturas.fastq` es un archivo de ese tipo.

```bash
canu -correct -p mis_lecturas -d ruta/salida genomeSize=2.8m -pacbio-raw mis_lecturas.fastq

canu -trim -p mis_lecturas -d ruta/saidar genomeSize=2.8m -pacbio-raw mis_lecturas.fastq

canu -assemble -p mis_lecturas -d ruta/salida genomeSize=2.8m -pacbio-raw mis_lecturas.fastq
```

En este ejemplo usamos el parámetro `genomeSize` para suministrar el tamaño esperado aproximado del genoma a ensamblar, en este caso de 2.8 Mb. También se asume que se trata de lecturas crudas de PacBio.

### Métricas del ensamble

Los ensambles poseen propiedades que pueden medirse, entre estas propiedades se encuentran:

 - Cantidad de contigs
 - Contenido de GC
 - Cantidad total de bases en las secuencias

Sin embargo existen algunas otras características importantes que aportan información acerca de cómo se distribuyen algunas características de los contigs ensamblados:

- Cantidad de contigs de tamaño superior a diversos valores, tipicamente se pueden usar `500`, `1000`, `5000`, `10000`
- El tamaño del contig más largo
- $$N50$$ representa al tamaño del contig en el que se alcanza la mitad del tamaño del ensamble cuando los contigs se ordenan por tamaños de manera descendente
- $$L50$$ representa la cantidad de contigs necesarios para alcanzar la mitad del tamaño del ensamble cuando los contigs se ordenan por tamaños de manera descendente

Todas estas métricas se pueden obtener estudiando el archivo `.fasta` que contiene a los contigs de un ensamble. No obstante, existen algunos programas como `quast.py` que permiten obtener reportes de manera muy sencilla. En el siguiente ejemplo se asume que contamos con un archivo `contigs.fasta` el cual es el resultado de algún metodo de enamble _de novo_. 

```bash
quast.py contigs.fasta
```

Este programa genera una carpeta `quast_results` en donde uno de los archivos resultantes corresponden a reportes en formato `.html` como el que se muestra a continuación:

<iframe id="igraph" scrolling="yes" style="border:none;" seamless="seamless" src="qreport.html" height="525" width="100%"></iframe>


### Ensambles guíados por referencia

En este tipo de ensambles se cuenta con una secuencia conocida que sirve como guía para alinear las secuencias. Esta secuencia se usa como una referencia de las pocisiones originales en el genoma del cual se extrajeron los fragmentos secuenciados como lecturas. La idea central consiste en _mapear_ la posición de cada lectura en un mapa genómico que consiste en la secuencia de referencia.

Este tipo de procesamiento es habitual cuando se generan datos de resecuenciación, los cuales son el resultado de secuenciar un conjunto de individuos de una especie cuyo genoma está disponible como referencia. También se utiliza esta aproximación cuando se secuencía un organismo que está cercanamente relacionado a otro organismo que sí cuenta con un genoma de referencia. Asi mismo, es viable utilizar secuencias de una base de secuencias como referencia en algunos casos.

En este tipo de procesamiento, se trata de inferir la posición de cada lectura con respecto a una secuencia de referencia. Debido a que estas inferencias se tienen que hacer lectura por lectura, esta clase de procesos suelen ser costosos computacionalmente. No obstante, este reto computacional ha derivado en un esquema actual que usan todos los métodos de alineamiento de lecturas, este esquema implica el preprocesamiento de la secuencia de referencia para obtener índices, los cuales sirven para eficientar el modo en el que se comparan cada una de las lecturas con el genoma de referencia.

| Método de indexación | Ejemplos de software | Sensibilidad | Requerimiento de memoria |
|--|--|--|--|
| **Hashing** | 1. Smalt<br> 2. Maq<br> 3. Novoalign | Alta | Alto |
| **Transformada de _Burrows-Wheeler_** | 1. BWA<br> 2. Bowtie<br> 3. SOAP | Alta | Bajo |

El proceso típicamente requiere un archivo en formato FASTA que contiene el genoma de referencia, asi como también de las lecturas preprocesadas. Como resultado se obtiene un archivo con extensión `.sam` el cual contiene el formato del alineamiento de secuencias (por sus siglas en inglés). Algunos archivos que pueden derivarse son los archivos con índices del genoma de referencia, los cuales pueden ser reutilizados con otras lecturas que se deseen alinear contra el mismo genoma de referencia.

A continuación se dan ejemplos de uso de algunos mapeadores. En términos generales el procesamiento se basa en dos partes: la indexación de la referencia y el mapeo de las lecturas. Para ello asumiremos que tenemos una pareja de archivos con lecturas pareadas preprocesadas `mislecturas_R1.fastq` (las lecturas en el sentido _forward_) y `mislecturas_R2.fastq` (en sentido _reverse_) y que contamos con un genoma de referencia `referencia.fasta`. Además el resultado será un archivo `mapeo.sam`.

**bowtie**

Con `bowtie2` es necesario usar los índices a manera de referencia, en este caso se utiliza `ref` como cadena base para los archivos de los índices.

```bash
bowtie2-build referencia.fasta ref

bowtie2 -x ref -1 mislecturas_R1.fastq -2 mislecturas_R2.fastq -S mapeo.sam
```

**bwa**

```bash
bwa index -p ref referencia.fasta

bwa aln ref mislecturas_R1.fastq mislecturas_R2.fastq > mapeo.sam
```

**smalt**

Para este caso se tiene que definir el tamaño de palabra $$k=14$$ y el espaciado de los hashes $$s=8$$ 

```bash
smalt index -k 14 -s 8 ref referencia.fasta

smalt map -o mapeo.sam ref mislecturas_R1.fastq mislecturas_R2.fastq
```

### Formato SAM

El formato que se obtiene en un mapeo a referencia es un archivo de texto que contiene la información del alineamiento, es decir, contiene las secuencias de las lecturas, y del genoma de referencia con información relacionada con cada alineamiento. Este formato tiene algunas [especificaciones](https://samtools.github.io/hts-specs/SAMv1.pdf) que lo hacen muy útil, ya que provee de información muy importante como la calidad de los alineamientos así como información acerca del tipo de alineamiento encontrado.

Este formato consta de dos secciones importantes:

 - **Encabezado** En esta sección se incluyen metadatos que pueden incluir información como la versión del formato, diccionario de la referencia, metadatos de grupos de lecturas, información de ejecución de los programas usados.
 - **Alineamiento** Esta sección contiene la información que relaciona cada lectura con el mapeo contra la referencia, consta de 11 columnas obligatorias que se describen a continuación.


| Columna | Campo | Tipo de dato | Descripción |
|--|--|--|--|
| $$1$$ | `QNAME` | Texto | Nombre de la lectura |
| $$2$$ | `FLAG` | Entero | Representación decimal bit a bit de descripción del tipo de alineamiento |
| $$3$$ | `RNAME` | Texto | Nombre del contig de referencia |
| $$4$$ | `POS` | Entero | Posición de inicio de la lectura con respecto a la referencia |
| $$5$$ | `MAPQ` | Entero | Calidad del mapeo |
| $$6$$ | `CIGAR` | Texto | Cadena con información del mapeo en formato CIGAR |
| $$7$$ | `RNEXT` | Texto | Nombre de la lectura pareada |
| $$8$$ | `PNEXT` | Entero | Posición de inicio de la lectura pareada |
| $$9$$ | `TLEN` | Entero | Longitud del inserto (distancia de mapeo de las lecturas pareadas) en la referencia |
| $$10$$ | `SEQ` | Texto | Secuencia de nucleótidos de la lectura |
| $$11$$ | `QUAL` | Texto | Secuencia de caracteres de calidad Phred33 de la lectura |

Este tipo de archivos contiene practicamente toda la información de las lecturas en formato `fastq` con información adicional. Por esa razón este tipo de archivos consumen mucho espacio de almacenamiento, sin embargo existe una versión binaria del mismo formato conocido como `.bam`. Este formato contiene la misma información que un `.sam` sin embargo como los campos son almacenados en formato binario se requiere de menos espacio de almacenamiento para utilizarlos. Esto ha conducido a que una buena práctica es transformar los alineamientos a formato `.bam` ya que es mucho más fácil gestionar ese tipo de resultados. Para ello se requiere una herramienta que se conoce como `samtools`. Esta herramienta es un programa que permite realizar diversas operaciones con archivos `.sam` y `.bam`.

Para hacer la conversión es necesario también generar un índice especial de samtools para el genoma de referencia para lo cual usamos el argumento `faidx`. Posteriormente podemos ejecutar la transformación a `.bam` usando el archivo `mapeo.sam` y la referencia indexada `referencia.fasta`.

```bash
samtools faidx referencia.fasta

samtools view -bS -T referencia.fasta mapeo.sam > mapeo.bam
```

Otros procesos que suelen ser útiles para pasos posteriores de procesamiento consisten en realizar un ordenamiento de las lecturas y generar índices para agilizar la lectura del mapeo:

```
samtools sort mapeo.bam > mapeo_ordenado.bam

samtools index mapeo_ordenado.bam
```

Este procesamiento genera un archivo `mapeo_ordenado.bai` el cual en combinación con `mapeo_ordenado.bam` pueden ser usados en programas de visualización para inspeccionar manualmente los alineamientos obtenidos.

Uno de los sofware de visualización `IGV` puede generar imágenes como esta:

![](https://drive.google.com/uc?id=17YaQUPHwap-VtOQCqDKfv5HF4aCboAy3&export=download "Mapeo en IGV")



[Menú Principal](./)

[Atras](./qcTrimming)

[Siguiente](./#)
