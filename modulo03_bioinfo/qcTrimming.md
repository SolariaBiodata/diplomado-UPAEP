---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

## Bioinformática

### Calidad de la secuenciación

A pesar de que los equipos actuales de secuenciación prometen o despliegan secuencias que parecen de alta calidad, existen algunos factores que afectan la calidad del _llamado de bases_. Este es un proceso por el cual una señal de un equipo es transformada en una representación de un nucleótido en una secuencia. Cada tecnología se basa en diferentes propiedades y procesos biológicos que toman como base la lectura de una secuencia de nucleótidos. Este proceso es uno secuencial, en el que por cada paso se determinan dos cosas, la asignación de una base y la estimación de la probabilidad de error en la asignación.

La probabilidad de cometer un error en la asignación de una base es un factor determinante en el proceso del llamado de base. La estimación de esta probabilidad se puede hacer gracias a herramientas de clasifiación. En estas se ha determinado modelos de ajuste con base en secuencias conocidas y diversos parámetros estandarizados. Los manufacturadores procesan estas secuencias en condiciones controladas para obtener información acerca de los valores esperados de diversos parámetros de medición. Con esta información se entrenan los modelos de ajuste con lo cual se definen estimadores que pueden ser usados como referencia en condiciones y con secuencias no estándar para predecir la probabilidad de error.

Cada plataforma de secuenciación es susceptible de tener ciertos errores, sin embargo existen algunas características comunes que suelen modificar los parámetros de calidad. Estas características tienen diversos orígenes.

**Desfase de la polimerización ($$\phi$$)** Este se debe a que la actividad enzimática de una polimerasa, y por tanto su rendimiento, influye en la velocidad de síntesis. Como las tecnologías de segunda generación se basan en la acumulación de señal para poder medirla, el rendimiento enzimático influye en la medición de señal.

**Decaimiento de la señal ($$\delta$$)** En general, la probabilidad de error aumenta con respecto al tamaño de la lectura. La actividad enzimática y los homopolímeros influyen en la reducción de intensidad de la señal.

**Aglomeraciones policlonales mixtas ($$\mu$$)** La presencia de distintos insertos en una misma fuente de señal reduce significativamente la calidad. En algunos casos es imposible para el algoritmo hacer el llamado de base. Este efecto se incrementa cuando existe una carga elevada de material genético en los instrumentos de medición.

**Efecto frontera ($$\omega$$)** El ruido de fondo y la presencia de aglomeraciones policlonales reducen el área de fondo. Ello implica una disminución enla capacidad de realizar el llamado de base. En términos prácticos, se reduce la diferencia entre una señal real y la intensidad del fondo, por lo cual se dificulta la estimación correcta de los parámetros en el algoritmo de llamado de base.

**Entrecruzamiento de señal ($$\Sigma$$)** La diferencia entre intensidad de fluoróforo puede ser indistinguible dependiendo del estado de calibración del equipo, la integridad de los reactivos, entre otros. El efecto se debe a que la señal para determinar la presencia de un fluoróforo coincide en cierto grado con la señal que pertenece a otro. 

**Acumulación de fluoróforo ($$\tau$$)** Entre otros contaminantes, la intensidad de una señal se ve alterada en los últimos pasos de la reacción. La acumulación de fluoróforos eleva la intensidad del fondo.


De estos factores revisados algunos de ellos son comunes a diferentes plataformas de secuenciación:

| Factor | Illumina | IonTorrent | 454 | PacBio | Nanopore |
|--|--|--|--|--|--|
| Desfase de la polimerización <br>**$$\phi$$** | :x: | :x: | :x: | :x: |  |
| Decaimiento de la señal <br>**$$\delta$$** | :x: | :x: | :x: | :x: | :x: |
| Aglomeraciones policlonales mixtas <br>**$$\mu$$** | :x: | :x: | :x: | :x: | :x: |
| Efecto frontera <br>**$$\omega$$** | :x: |  | :x: |  |  |
| Entrecruzamiento de señal <br>**$$\Sigma$$** | :x: |  | :x: |  |  |
| Acumulación de fluoróforo <br>**$$\tau$$** | :x: | :x: | :x: |  |  |

### Control de calidad

Cuando se pretende procesar datos de secuenciación masiva un aspecto crucial es el control de la calidad de las lecturas. Durante este proceso se revisan diversos parámetros de la corrida de secuenciación. El propósito de esta revisión es descartar cualquier fuente de generación de _artificios_ durante el proceso de secuenciación, mismos que pueden tener origenes biológicos, metodológicos o informacionales.

En el proceso de control de calidad es muy importante generar reportes con información crucial con respecto a diversos parámetros de calidad en la corrida. Para realizar esto existen diversos paquetes bioinformáticos, sin embargo uno de los software más ampliamente usados es `fastqc`.

**[FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)**

Es un programa multiplataforma que corre en `java`. Este programa tiene una interfaz gráfica de usuario (_GUI_ por sus siglas en inglés), sin embargo también es viable automatizar su ejecución debido a que también tiene una versión en línea de comandos.

```
fastqc mis_lecturas.fastq
```

Este software permite la revisión de una serie de parámetros que se listan a continuación:

 - Calidad por posición
 - Calidad por lectura
 - Contenido de bases por posición
 - Contenido de GC por posición
 - Contenido de N's
 - Tamaño de las lecturas
 - Duplicación de secuencias
 - Sobrerepresentación de secuencias
 - Contenido de adaptadoes

A continuación se muestran algunas ligas a reportes con ejemplos:

- [Secuencias Illumina de baja calidad](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/bad_sequence_fastqc.html)
- [Secuencias Illumina de alta calidad](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/good_sequence_short_fastqc.html)
- [Lecturas de RNA con adaptadores](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/small_rna_fastqc.html)
- [Lecturas de PacBio](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/pacbio_srr075104_fastqc.html)
- [Lecturas de 454](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/454_SRR073599_fastqc.html)

### Preprocesamiento

Una vez que se ha revisado el apartado de calidad de las lecturas es importante tomar decisiones para realizar un procesamiento inicial de las lecturas con la finalidad de obtener secuencias de alta calidad para procesamientos posteriores.

Una biblioteca con elementos de baja calidad, incrementa la complejidad y disminuye la confidencia en algunos casos. Dada la heterogeneidad de causas para una baja calidad, se debe tomar en consideración diferentes escenarios para la limpieza y filtrado de secuencias.

**Remoción de adaptadores**

La remoción de adaptadores es el proceso a través del cual suministramos información de secuencias conocidas de adaptadores para localizarlos y depletarlos de un archivo de lecturas crudas. Para ello se puede realizar con diferentes software. Aumamos que tenemos un adaptador `ATTTGGTACGTA` el cual queremos eliminar de nuestra corrida:

```
fastx_clipper -a ATTTGGTACGTA -i mislecturas.fastq -o mislecturas_noadapter.fastq
```

```
cutadapt -a ATTTGGTACGTA -o mislecturas_noadapter.fastq mislecturas.fastq
```

```
Trimmomatic SE mislecturas.fastq mislecturas_noadapter.fastq ILLUMINACLIP:adapters.fa:2:30:10
```

en este caso `adapters.fa` corresponde a la ruta de un archivo FASTA con una seria de secuencias que corresponden con los adaptadores.


**Revisión general de calidad**

En este tipo de proceso se define un umbral de calidad. Este umbral es un criterio con el cual se evaluan todas las lecturas y si por algun motivo una lectura no alcanza dicho umbral, dicha lectura se depleta del análisis completo.

```
fastq_quality_filter -q 30 -p 90 -i mislecturas.fastq -o mislecturas_q30p90.fastq 
```

en este ejemplo, `-q` sirve para asignar el punto mínimo de calidad que tienen que cumplir al menos `-p` proporción de bases en una lectura.


**Trimming fijo**

A veces es fácil determinar mediante un criterio posicional de las lecturas el punto en el que la calidad de una corrida tiene una caida abrupta. En este tipo de situaciones puede convenir usar una estrategia de cortes fijos, con base en la calidad de las bases en diferentes posiciones.

```
cutadapt -u 5 -o mislecturas_u5.fastq mislecturas.fastq 
```

```
fastx_trimmer -f 9 -i mislecturas.fastq -o mislecturas_f9.fastq
```

```
Trimmomatic SE biblioteca_1_R1.fastq.gz HeadCrop-biblioteca_1_R1.fastq.gz HEADCROP:<número de bases>
Trimmomatic SE biblioteca_1_R1.fastq.gz Crop-biblioteca_1_R1.fastq.gz CROP:<número de bases>
```

**Trimming por ventanas deslizantes**

Este tipo de estrategia es muy poderosa debido a que la remoción de información es independiente por cada lectura, y se basa en criterios de calidad locales. Esta estrategia se basa en el promedio de calidad de un fragmento de nuestra secuencia. Esta estrategia nos permite minimizar la pérdida de información de buena calidad.

```
Trimmomatic SE biblioteca_1_R1.fastq.gz SlidingWindow-biblioteca_1_R1.fastq.gz SLIDINGWINDOW:<tamaño de ventana>:<calidad> 
```

**Manejo de lecturas pareadas**

```
Trimmomatic PE\
sequence_f.txt.gz \
sequence_r.txt.gz \
f_paired.fq.gz \
f_unpaired.fq.gz \
r_paired.fq.gz \
r_unpaired.fq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
LEADING:3 TRAILING:3 \ SLIDINGWINDOW:4:25 \
MINLEN:50
```


[Menú Principal](./)

[Atras](./archivosBioinfo)

[Siguiente](./ensambles)
