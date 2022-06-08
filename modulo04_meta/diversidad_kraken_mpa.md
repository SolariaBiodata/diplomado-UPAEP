---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

## Kraken

![kraken2](https://user-images.githubusercontent.com/54455898/172718386-ab916fc7-8d47-46b7-94dd-d143b4429284.png)

Kraken, es una nueva herramienta de clasificación de secuencias cuya precisión es comparable a las mejores técnicas de clasificación de lecturas, y su velocidad supera con creces tanto a los clasificadores como a los programas de estimación de abundancia.

### ¡Llegó la hora de clasificar!

Visualizamos las lecturas que vamos a ocupar e identificamos la ruta donde se encuentren:

```bash
$ ls -lhtr /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/

SRR6651926_final.contigs.fa
SRR6651936_final.contigs.fa
SRR6651949_final.contigs.fa

```

Nos dirigimos a nuestra carpeta personal y dentro de ella creamos un folder donde ejecutaremos ***Kraken***:

```bash
$ cd /home/centos/diplomadoUPAEP/carpetapersonal/

$ mkdir kraken_krona

$ cd kraken_krona
```

Antes de correr ***Kraken*** vamos a generar ligas simbólicas a las lecturas que ocuparemos:

```bash
$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651926_final.contigs.fa SRR6651926
$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651936_final.contigs.fa SRR6651936
$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651949_final.contigs.fa SRR6651949
```

Revisamos que estén creadas correctamente, en dado caso de que "palpiten" las rutas absolutas (también suelen marcarse con un tono rojo) puede ser que exista algún error:

```bash
ls -lhtr

SRR6651926 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651926_final.contig
SRR6651936 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651936_final.contig
SRR6651949 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651949_final.contig
```

Generamos una liga simbólica a la base de datos:

```bash
$ ln -s /media/data/solaria/.backup/tools/software/bin/minikraken_20171013_4GB/ minikraken
$ ls -lhtr 
  minikraken -> /media/data/solaria/.backup/tools/software/bin/minikraken_20171013_4GB/
```

Es preferible crear una carpeta para cada lectura para no tener problemas con los ficheros que vayamos generando. Durante la sesión en vivo solamente practicaremos con una lectura y con ello poder probrar otros programas que están asignados en este último módulo del diplomado:

```bash
$ mkdir SXX26/
$ cd    SXX26/

```

Verificamos ***Kraken*** y sus opciones:

```bash
$ kraken 
  Usage: kraken [options] <filename(s)>

Options:
  --db NAME               Name for Kraken DB
                          (default: none)
  --threads NUM           Number of threads (default: 1)
  --fasta-input           Input is FASTA format
  --fastq-input           Input is FASTQ format
  --fastq-output          Output in FASTQ format
  [...]

```

Ejecutamos ***Kraken*** brindándole la lectura que procesaremos, la base de datos e indicando el nombre de nuestro archivo de salida:

```bash
$ kraken --fasta-input ../SRR6651926 --db ../minikraken/ --output out_kraken_26
```
Ahora debemos generar un ***reporte*** sobre lo que se corrió anteriormente, entonces revisamos en que consiste ***kraken-report*** y despues lo ejecutamos:

```bash
$ kraken-report
  kraken-report: Must specify DB with either --db or $KRAKEN_DEFAULT_DB
```
```bash
$ kraken-report --db ../minikraken/ out_kraken_26 > report_26
```

Dicho ***reporte*** está delimitado por tabuladores y puede contener lo siguiente:

```bash

* Porcentaje de lecturas cubiertas por el clado enraizado en este taxón
* Número de lecturas cubiertas por el clado enraizado en este taxón
* Número de lecturas asignadas directamente a este taxón
* Un código de rango, que indica (U)nclassified, (D)omain, (K)ingdom, (P)hylum, (C)lass, (O)rder, (F)amily, (G)enus o (S)pecies. Todos los demás rangos son simplemente '-'.
* ID de taxonomía NCBI
* Nombre científico 

```

Es posible visualizar el reporte generado:

```bash
$ head report_26

 96.24	260130	260130	U	0	unclassified
  3.76	10167	6	-	1	root
  3.75	10149	165	-	131567	  cellular organisms
  2.88	7791	195	D	2157	    Archaea
  2.76	7466	4	P	28890	      Euryarchaeota
  2.76	7448	1181	C	183963	        Halobacteria
  0.97	2632	142	O	2235	          Halobacteriales
  0.65	1747	138	F	1963268	            Haloarculaceae
  0.17	468	246	G	2237	              Haloarcula
  0.05	141	0	S	2238	                Haloarcula marismortui

```

Ahora debemos correr ***kreport2krona*** el cual acepta el reporte generado anteriormente con la finalidad de obtener un fichero de entrada que podamos imprimirlo en ***Krona***:

```bash
$ kreport2krona.py
  usage: kreport2krona.py [-h] -r R_FILE -o O_FILE [--intermediate-ranks]
                        [--no-intermediate-ranks]
```
```bash
$ kreport2krona.py -r report_26 -o krona_input_26
```

Convertimos el fichero ***krona_input_26*** a formato de HTML, para ello ocuparemos ***ktImportText***:

```bash
$ ktImportText
                                       _________________________________
____________________________________/ KronaTools 2.8.1 - ktImportText \___

Creates a Krona chart from text files listing quantities and lineages.
                                                               _______
______________________________________________________________/ Usage \___

ktImportText \
   [options] \
   text_1[,name_1] \
   [text_2[,name_2]] \
   
   [...]

```
```bash
$ ktImportText -o Tu_Nombre_krona_26.html krona_input_26
```
Es importante renombrar nuestro archivo final de ***Krona*** y poder distinguirlo más fácil al momento de subirlo a [SBio Cloud Server](http://13.56.237.15/)

```bash
$ sbcp Tu_Nombre_krona_26.html
```
### Visualización de las asignaciones que se generaron sobre lecturas de muestras de rocas Halitas en Krona:

<iframe id="igraph" scrolling="yes" style="border:none;" seamless="seamless" src="./htmls_kraken_mpa/prueba_kraken_krona_26.html" height="525" width="100%"></iframe>

### Practica con las lecturas restantes 

Puedes practicar con las lecturas restantes y comparar las asignaciones que se determinaron.

## MetaPhlAn

Las lecturas ***fastq*** y bases de datos que ocuparemos para correr ***MPA*** se encuentran en la siguiente ruta

```bash
$ ls -lhtr /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/

* mpa_v20_m200
* SRS019033.fastq

```
Al igual que Kraken, creamos dentro de nuestra carpeta personal un folder para correr ***MPA*** y también elaboramos las ligas simbólicas sobre los ficheros que necesitaremos:

```bash
$ cd /home/centos/diplomadoUPAEP/carpeta_personal/
```
```bash

$ mkdir phlan_meta

$ cd phlan_meta

$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRS019033.fastq SRS019033

$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/mpa_v20_m200 mpa_v20_m200

```

Antes de ejecutar ***MPA*** debemos de activar el ambiente ***base*** del servidor de SOLARIA ya que ocupamos contar con ***BIOM***:

```bash
$ conda activate base
$ biom
  Usage: biom [OPTIONS] COMMAND [ARGS]...

Options:
  --version   Show the version and exit.
  -h, --help  Show this message and exit.

Commands:
  add-metadata       Add metadata to a BIOM table.
  convert            Convert to/from the BIOM table format.
  [...]
  
```
Revisamos que tengamos instalado ***MPA***:

```bash
$ metaphlan2.py
  usage: metaphlan2.py --input_type
                     {fastq,fasta,multifasta,multifastq,bowtie2out,sam}
                     [--mpa_pkl MPA_PKL] [--bowtie2db METAPHLAN_BOWTIE2_DB]
                     [--bt2_ps BowTie2 presets] [--bowtie2_exe BOWTIE2_EXE]
  [...]
  
```
Corremos ***MPA***:

```bash
$ metaphlan2.py SRS019033 --mpa_pkl mpa_v20_m200/mpa_v20_m200.pkl --bowtie2db mpa_v20_m200/mpa_v20_m200 --bt2_ps very-sensitive --bowtie2out 085_01.bz2 --nproc 4 --input_type fastq -o SRS019033_test
```
***MPA*** cuenta con su propio paquete para construir los ficheros ***Krona*** respecto a la base de datos implementada anteriormente:

```bash
$ metaphlan2krona.py
  Usage: metaphlan2krona.py [options]

Options:
  -h, --help            show this help message and exit
  -p PROFILE, --profile=PROFILE
                        The input file is the MetaPhlAn standard result file
  -k KRONA, --krona=KRONA
                        the Krons output file name

```
Corremos ***metaphlan2krona***:

```bash
$ metaphlan2krona.py -p SRS019033_test -k krona_input_SRS019033
```
Tranformamos los resultados a formato HTML para poder visualizarlos en el navegador de nuestro interés:

```bash
$ ktImportText -o Tu_Nombre_krona_mpa_SRS019033.html krona_input_SRS019033
```
Subimos el archivo a [SBio Cloud Server](http://13.56.237.15/)

```bash
$ sbcp Tu_Nombre_krona_mpa_SRS019033.html
```
### Visualización de los resultados de MPA en Krona:

<iframe id="igraph" scrolling="yes" style="border:none;" seamless="seamless" src="./htmls_kraken_mpa/krona_mpa_SRS019033.html" height="525" width="100%"></iframe>

## ¿Que te pareció la práctica?

Como te habrás dado cuenta, las lecturas que se usaron en ***Kraken*** son diferentes a las de ***MPA*** debido a que las bases de datos implementadas en cada programa asignan cierto porcentaje de información registrada en los bancos de metadatos, los cuales requieren de más investigación para clasificar diersas muestras que por el momento se encuentras "desconocidas".





























