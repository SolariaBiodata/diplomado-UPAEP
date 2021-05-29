---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Bioinformática

### Ensambles _de novo_

La secuenciación permite obtener el contenido de la secuencia de miles de lecturas. Estas son fragmentos provenientes de moléculas de DNA cuya función biológica está determinada por la completitud de la secuencia. Por lo tanto, uno de los procesos más importantes en la secuenciación consiste en la _reconstrucción_ de la secuencia original, es decir, de la molécula de orígen biológico que se fragmentó al incio del proceso. Los procesos que se orientan a resolver este problema se conocen como _ensambles_.

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
| **Gráficas _de Bruijn_** | * Descomposición de lecturas en k-meros <br> * Generación de gráficas de cobrelapes de k-meros <br> * Implementación de la solución algorítmica para encontrar _ciclos Eulerianos_ | Se usan con lecturas<br> de alta calidad, pueden ser <br>lecturas cortas | 1. Euler<br> 2. Velvet<br> 3. Spades<br> 4. Abyss |

Los ensambles _de novo_ son procesos cuyo resultado final son secuencias largas con el ensamble de las lecturas. Estas secuencias son la representación de la secuencia contigua de los sobrelapes de las lecturas, mismas que son conocidas como **contig**. Debido a que son secuencias de nucleótidos la forma general de contener dicha información es a través de archivos en formato FASTA. En el mejor de los escenarios cada contig representa una molécula de DNA, es decir cromosomas, plásmidos u otras únidades básicas de replicación de ADN, sin embargo en la práctica algunos contigs son el resultado de la resolución de problemas derivados de secuencias repetidas a lo largo del genoma.

A continuación se aportan ejemplos de uso de algunos ensambladores. Para ello asumiremos que tenemos una pareja de archivos con lecturas pareadas preprocesadas `mislecturas_R1.fastq` (las lecturae en el sentido _forward_) y `mislecturas_R2.fastq` (en sentido _reverse_) y que `ruta/salida/` corresponde a la ruta relativa del directorio que se desea crear.

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



### Ensambles guíados por referencia

En este tipo de ensambles se cuenta con una secuencia conocida que sirve como guía para alinear las secuencias. Esta secuencia se usa como una referencia de las pocisiones originales en el genoma del cual se extrajeron los fragmentos secuenciados como lecturas. 








[Menú Principal](./)

[Atras](./qcTrimming)

[Siguiente](./#)
