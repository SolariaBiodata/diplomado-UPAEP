---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Bioinformática

### Bases de datos 

En bioinformática es muy importante contar con fuentes de información estándar y confiable debido a que la reproducibilidad de los resultados es un aspecto indispensable en el análisis de datos biológicos. Por ese motivo diversos consorcios han unido esfuerzos para recopilar, almacenar y gestionar la información biológica en diferentes ámbitos. Estos han desarrollado diversos portales que contienen repositorios de información (coloquialmente llamados _bases de datos_).

Las _bases de datos_ requieren una estructura muy particular, misma que se construye en función de la naturaleza misma de la información que contiene. Es muy importante que la información sea de fácil acceso, y que se optimice los métodos de actualización de la misma, asimismo, resulta crucial que exista la menor redundancia posible y que la estructura de los datos sea uniforme.

| Tipo | Base de datos |
|--|--|
| Secuencia| [INSDC](http://www.insdc.org/) |
| Secuencia | [NCBI](https://www.ncbi.nlm.nih.gov) |
| Secuencia | [EMBL](https://www.ebi.ac.uk/services) |
| Secuencia | [DDBJ](https://www.ddbj.nig.ac.jp/index-e.html) |
| RNA | [Rfam](https://rfam.xfam.org/) |
| RNA | [RDP](https://rdp.cme.msu.edu/) |
| RNA | [Silva](https://www.arb-silva.de/) |
| RNA | [miRBase](http://www.mirbase.org/) |
| Proteínas | [PDB](https://www.rcsb.org/) |
| Proteínas | [Uniprot](https://www.uniprot.org/) |
| Proteínas | [Pfam](http://pfam.xfam.org/) |
| Proteínas | [SwissProt](https://www.expasy.org/resources/uniprotkb-swiss-prot) |
| Proteínas | [PIR](https://proteininformationresource.org/) |
| Rutas metabólicas | [KEGG](https://www.genome.jp/kegg/) |
| Rutas metabólicas | [BRENDA](https://www.brenda-enzymes.org/) |
| Ontologías | [GeneOntology](http://geneontology.org/) |
| Genómica humana | [1KG](https://www.internationalgenome.org/home) |
| Genómica humana | [OMIM](https://www.omim.org/) |
| Genómica humana | [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/) |
| Patógenos | [ViPR](https://www.viprbrc.org/brc/home.spg?decorator=vipr) |
| Patógenos | [MBGD](https://mbgd.nibb.ac.jp/) |
| Patógenos | [ViralZone](https://viralzone.expasy.org/) |
| Patógenos | [EnteroBase](https://enterobase.warwick.ac.uk/) |


**[NCBI](https://www.ncbi.nlm.nih.gov/)**

El Centro Nacional para Información Biotecnológica (NCBI por sus siglas en inglés) es el repositorio más conocido a escala mundial. En este repositorio conviven múltiples subrepositorios con diferentes niveles de información y que se describen a continuación


| Repositorio | Descripción |
|--|--|
| [SNP](https://www.ncbi.nlm.nih.gov/snp/) | dbSNP es una base de datos donde se almacena la información de polimorfismos genéticos en diversas especies |
| [PubMed](https://pubmed.ncbi.nlm.nih.gov/) | Pubmed es una base de datos que contiene información de artículos y literatura científica de áreas de la biotecnología |
| [Taxonomy](https://www.ncbi.nlm.nih.gov/taxonomy/) | Esta base de datos contiene clasifiaciones curadas de la nomenclatura de los organismos contenidos en NCBI |
| [Genome](https://www.ncbi.nlm.nih.gov/genome/) | Contiene información de los mapas genómicos, ensambles y genomas anotados |
| [GEO](https://www.ncbi.nlm.nih.gov/gds/) | Gene Expression Omnibus es el repositorio de información donde se almacenan datos de expresión genética |
| [SRA](https://www.ncbi.nlm.nih.gov/sra/) | Sequence Read Archive es el sitio donde se almacenan los datos crudos de corridas de secuenciación masiva desde 2009 |
| [RefSeq](https://www.ncbi.nlm.nih.gov/refseq/) | Genomas de referencia con información altamente curada |
| [GenBank](https://www.ncbi.nlm.nih.gov/genbank/) | Es la colección de todas las secuencias de DNA publicamente disponibles en el NIH |



### Búsqueda de secuencias

Debido a la enorme cantidad de secuencias que actualmente se enecuentran depositadas en las bases de datos, uno de los mayores retos es poder acceder de manera sistemática a la información contenida. Una función indispensable para estas bases de datos consiste en realizar búsquedas de secuencias para encontrar aquellas que compartan ciertas características con algunas secuencias que son de nuestro interés.

Una herramienta que ha sido muy importante para realizar búsquedas en los grandes repositorios de información es [BLAST](https://blast.ncbi.nlm.nih.gov/Blast.cgi). El nombre de este programa se deriva de las siglas en inglés de _Herramienta de Búsqueda Básica por Alineamientos Locales_. Esta herramienta encuentra regiones de similaridad entre secuencias biológicas. Compara secuencias de nucléotidos o proteínas contra bases de datos y calcula la significancia estadística de la coincidencia.

| Herramienta | ¿Qué busca? | ¿En dónde? |
|--|--|
| nblast | Secuencia de nucleótidos | Secuencias de nucleótidos |
| pblast | Secuencia de aminoácidos | Secuencias de aminoácidos |
| blastx | Secuencia de nucleótidos | Secuencias de aminoácidos |
| tblastn | Secuencia de aminoácidos | Secuencias de nucleótidos |
| psi-blast | Secuencia de aminoácidos lejanamente relacionada | Secuencias de aminoácidos |
| delta-blast | Dominios conservados  | Secuencias de aminoácidos |
| phi-blast | Secuencia de nucleótidos o aminoácidos con patrones de expresiones regulares | Secuencias de nucleótidos o aminoácidos |


### Formatos de archivos

La estructura de los ficheros que se usan en bioinformática se han diseñado para contener la información biológica de manera que sea fácilmente interpretada tanto por las computadoras como por las personas _seres humanos_. Esta dicotomía ha generado diversas tendencias para desarrollar formatos (generalmente de texto plano) que permiten interaccionar muy fácilmente con la información que contienen.

**Formato FASTA**

Un tipo de información crucial para el campo de la bioinformática es la información de estructura primaria de las macromoléculas biológicas, es decir la secuencia de nucleótidos o aminoácidos que componen a los ácidos nucléicos y las proteínas. En este sentido, uno de los formatos ubicuos en las ciencias biológicas es sin lugar a dudas el formato **FASTA**. Este formato fue adoptado por el software homonimo cuyo propósito era realizar comparaciones rápidas entre secuencias (_Fast-All_), originalmente existió un software con nombre FASTP que comparaba proteínas, sin embargo en una versión posterior en 1987, se utilizó para comparar también secuencias de nucleótidos. 

El formato FASTA es el siguiente:

```
;comentario inicial
>Linea descriptora
ATTGTGTTGACACTATATACGACTACGCGACTACGACACAGG
>Encabezado_2
TTCTCTAGATCTAGATATGACTACATAGGGTCTGATAC
```

En la actualidad el formato **FASTA** es característico de diversos archivos de texto plano, algunas extensiones que indican el uso de este tipo de formato son:

 - `.fasta`
 - `.fa`
 - `.fas`
 - `.fsa`
 - `.fna`
 - `.ffn`

Los archivos de tipo FASTA contienen líneas que corresponden a la secuencia de la macromolécula de interés, mismas que siempre son precedidas por un encabezado, el cual es ***siempre*** precedido por `>`. En el caso de las proteínas, para describir a la secuencia se usan las representaciones de una sola letra para representar a cada aminoácido, asímismo, el caracter `X` simboliza cualquiera de los aminoácidos, y `*` representa el codón de término. En el caso de los ácidos nucléicos se puede usar la siguiente tabla para identificar los nucleótidos en la secuencia:

| Código | Significado | Mnemotecnia |
|--|--|--|
| **`A`** | Adenina | **A**denina |
| **`C`** | Citosina | **C**itosina |
| **`G`** | Guanina | **G**uanina |
| **`T`** | Timina | **T**imina |
| **`U`** | Uracilo | **U**racilo |
| **`R`** | A o G | pu**R**ina |
| **`Y`** | C, T o U | pir**Y**midine (pirimidina) |
| **`K`** | G,T o U | **K**etones (cetonas) |
| **`M`** | A o C | bases con grupo a**M**ino |
| **`S`** | C o G | **S**trong (interacción fuerte) |
| **`W`** | A, T o U | **W**eak (interacción débil) |
| **`B`** | No A (C, G, T o U) | **B** después de A |
| **`D`** | No C (A, G, T o U) | **D** después de C |
| **`H`** | No G (A, C, T o U) | **H** después de G |
| **`V`** | Ni T ni U (A, C o G) | **V** después de U |
| **`N`** | A, C, G, T o U | **N**ucléotido |
| **`-`** | Gap de cualquier tamaño |  |

**Formato FASTQ**

El proceso de secuenciación nos permite conocer las secuencia de fragmentos de DNA de interés. En la actualidad este proceso se puede hacer de manera paralela para una gran cantidad de secuencias, por lo cual existe un formato muy parecido al FASTA para almacenar ese tipo de información. No obstante, en el caso de la secuenciación la calidad de asignación de bases es igualmente importante.

La secuenciación se hace a través de moléculas biológicas, mismas que son propensas a errores. La medición de dichos errores se lleva a cabo por diferentes métodos, los cuales son dependientes de cada tecnología. Sin embargo, existe un estándar para el despliegue de dichas mediciones y se hace a través de lo que se conoce como métricas de calidad de la secuenciación.

Para expresar la calidad de la asignación de bases es muy útil la _escala Phred_. La _escala Phred_ se generó para relacionar la probabilidad de asignar erroneamente un nucleótido $$P$$ mediante un valor de calidad $$Q$$.

\\[Q = -\log_{10}P\\]

por lo tanto:

\\[P = 10^{\frac{-Q}{10}}\\]

Por lo que a continuación se plantea un esquema de como se relacionan estos valores:

| $$Q$$ | $$P$$ |Precisión en la asignación|
|--|--|--|
| $$10$$ | 1 en 10 | 90% |
| $$20$$ | 1 en 100 | 99% |
| $$30$$ | 1 en 1,000 | 99.9% |
| $$40$$ | 1 en 10,000 | 99.99% |
| $$50$$ | 1 en 100,000 | 99.999% |

Una forma de visualizar cómo se relacionan la precisión y el valor de calidad $$Q$$:

<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="QvsPrecisionPhred.html" height="525" width="100%"></iframe>

Como se puede apreciar, una forma de representar la calidad en un archivo de texto se da a través del uso de una tabla ASCII. Para ello es necesario establecer una relación entre el valor ASCII y el valor de calidad:

![TablaASCII](https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/ASCII-Table.svg/1261px-ASCII-Table.svg.png)

Como se puede observar, los primeros `31` caracteres corresponden a símbolos no imprimibles, por lo que no es viable usarlos en archivos de texto plano; el caracter ` ` tampoco es viable debido a que es un espacio en blanco que puede ser erroneamente interpretado. Debido a ello es una de las principales codificaciones de la escala Phred está basada en el número `33` esto significa que el caracter `33` que equivale a `!` corresponde al índice de calidad Phred $$Q=1$$. La codificación _Phred33_ corresponde a ese estilo de codificación de calidades, sin embargo a lo largo de la historia se han utilizado algunas cotras codificaciones:

![PhredCoding](https://bioinformaticsworkbook.org/introduction/assets/qualityscore.png)

De esta forma  podemos codificar una secuencia de asignación de calidades, la cual, en conjunto con una secuencia de nucleótidos componen la estructura general de un archivo **fastq**:

```
@Línea descriptora
ATCGATCGATCGGTACTAGCTACTAGCGACTCAGCTACGACTCAGCTACG
+Calidad de Línea descriptora
!'!*()((88A*+))%%%++)(%%%%).1***-+*''))**55CCF>>>>
@Otra línea descriptora
TTGTGTAGTAGATTAGCTCCGCTAATCACGA
+Calidad de otra línea descriptora
%*+))%%%++)(%B5%F)FFF-7895CCF>>
```

Como puede observarse, en este formato cada lectura de un fragmento se compone por 4 líneas:

 1. El encabezado de la lectura sirve para identificar cada una, siempre inicia con `@`
 2. La línea de la secuencia de nucléotidos asignados (sigue las especifiaciones del formato FASTA)
 3. Línea  de separación, se caracteriza porque inicia con `+`, algunas veces no contiene más información que dicho caracter
 4. La línea de la secuencia de calidades Phred, usualmente con la codificacion _Phred33_. Esta línea tiene la misma longitud que la secuencia de nucleótidos (2).

Un archivo FASTQ contiene múltiples lecturas, sin embargo, para que sea válido, debe contener esas 4 líneas por cada una de las lecturas, por lo que una característica adicional es que contiene un número de líneas el cual es múltiplo de 4. 

Los archivos FASTQ son el éstandar para manejar datos de secuenciación masiva. No obstante existen otros formatos que se adoptaron a través del uso de tecnologías diferentes de secuenciación. A continuación se describen algunos de esos formatos:

| Formato | Descripción |
|--|--|
| **HDF5** | Este tipo de formato es muy usado en tecnologías de secuenciación de 3a generación, se compone de distintos archivos siendo el principal uno con extensión `.h5` |
| **SFF** | Este formato era nativo de la plataforma 454, contiene la información de la señal que se obtiene con cada flujo, su extensión es `.sff` |
| **SRA** | Es un formato binario que utiliza el [SRA](https://www.ncbi.nlm.nih.gov/sra) para almacenar datos de secuenciación crudos, se caracteriza por tener la extensión `.sra` |
| **FASTA + QUAL** | Este estilo requiere de dos archivos conjugados, un archivo `.fasta` y un archivo `.qual`, el primero contiene la secuencia de las lecturas y el segundo la secuencia de asignación de calidades |
| **BAM / SAM** | Son formatos de alineamiento de lecturas, sin embargo, si no se usa un genoma de referencia las lecturas se encuentran sin alinear, un archivo `.sam` es la versión de texto plano del alineamiento, en cambio un `.bam` es un archivo binario |

![alt text](https://raw.githubusercontent.com/SolariaBiodata/curso-RNASeq/master/resources/file_formats.png?token=AL46UMSDWSV5HTFBS2PJ243AVUWCY "Solaria Biodata: Nextgen Solutions")

Existen algunos métodos que permiten convertir estos formatos al formato **fastq**

1. Conversión de Formato HDF5 a FASTQ:
```
python bash5tools.py --inFile input.bas.h5 --outFilePref reads --outType fastq --readType subreads --minLength 500 --minReadScore 0.8
```
2. Conversión de Formato SFF a FASTQ:
```
cat input.sff | sff2fastq > reads.fastq
```
3. Conversión de Formato FASTAQUAL a FASTQ
```
fastaQual2fastq.pl input.fasta input.qual
```
4. Conversión de Formatos BAM/SAM a FASTQ
```
samtools fastq input.*am > reads.fastq
```



[Menú Principal](./)

[Atras](./introduccion)

[Siguiente](./qcTrimming)
