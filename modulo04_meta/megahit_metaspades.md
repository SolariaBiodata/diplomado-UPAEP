---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

# Ensamblajes metagenómicos

![logoinicial](https://user-images.githubusercontent.com/54455898/172481784-36581de9-6c1d-4df3-8d8f-42a1482c7c64.png)


## Cuestión actual 
El paso más crítico del análisis de datos metagenómicos es la reconstrucción de genes y genomas individuales de los microorganismos de diversas comunidades usando ***ensambladores metagenómicos***, programas computacionales que juntan pequeños fragmentos de ADN secuenciado generado por instrumentos de secuenciación.

Para esta práctica usaremos dos metaensambladores distintos que se han distiguido en este campo por su forma de procesar lecturas de manera eficaz.  

## MEGAHIT 

![logo_mh](https://user-images.githubusercontent.com/54455898/172481137-f0cf0ed3-88b0-4b9f-bd15-d844e3f9e9dc.png)


MEGAHIT (***MH*** ) es un ensamblador de metagenómas de última generación de novo para procesar datos metagenómicos grandes y complejos de manera rentable y en tiempo. Se ha caracterizado por tener la capacidad de ensamblar un conjunto de datos de metagenómica del suelo con 252 gigabytes de pares de secuencias (gbps) en 44,1 y 99,6 horas en un solo nodo informático con y sin unidad de procesamiento de gráficos, respectivamente.

### ¿Cómo trabaja ***MH*** ?

***MH*** reúne los datos como un todo, es decir, no se necesita ningún procesamiento previo como la partición y la normalización, permitiendo generar contigs más grandes respecto a resultados de otros metaensambladores.

## Manos a la obra

Creamos dentro de nuestro directorio personal una carpeta donde ejecutaremos ***MH*** :
 ```bash
mkdir megahit
```
 ```bash
cd megahit
```
Haremos las ligas simbolicas para llamar a las lecturas que ocuparemos ubicadas en el folder indicado durante la sesión en vivo: 
 ```bash
ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_1.fastq SRR19423238_1
ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_2.fastq SRR19423238_2
```
Verificamos que se hayan elaborado correctamente las ligas:
 ```bash
ls -lhtr
SRR19423238_1 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_1.fastq
SRR19423238_2 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_2.fastq
```
Una vez que estén generadas las ligas simbólicas podemos verificar si contamos con el programa MH con la siguiente instrucción:

 ```bash
megahit

megahit: MEGAHIT v1.1.2

Copyright (c) The University of Hong Kong & L3 Bioinformatics Limited
contact: Dinghua Li <dhli@cs.hku.hk>

Usage:
  megahit [options] {-1 <pe1> -2 <pe2> | --12 <pe12> | -r <se>} [-o <out_dir>]...

```
Corremos MH con las lecturas:

 ```bash
megahit -1 SRR19423238_1 -2 SRR19423238_2 -o out_megahit
```
Cuando finalice de ensamblar las metalecturas se crerá el directorio que sugerimos en la bandera de salida con el siguiente contenido:

| °  | °  |
|---|---|
|  final.contigs.fa  |  intermediate_contigs/  |
|  log  |  opts.txt  |

En primera instancia podemos revisar los contigs finales 

 ```bash
cd out_megahit
```
 ```bash
grep ">" -c final.contigs.fa
3
```
Estos resultados podemos compararlos con otros ensambladores de metagenomas.

## metaSPAdes 

![logo_metaspades](https://user-images.githubusercontent.com/54455898/172481184-b79ab263-fdff-4598-9d99-399638318bdb.png)

El otro ensamblador con el que practicaremos se llama metaSPAdes (***MS*** ), el cual aborda varios desafíos del ensamblaje metagenómico al capitalizar ideas computacionales que demostraron ser útiles en ensamblajes de células individuales y genomas diploides altamente polimórficos.

### ¿Qué lo caracteríza de otros metaensambladores?

MS combina nuevas ideas algorítmicas con soluciones comprobadas del kit de herramientas SPAdes para abordar varios desafíos del ensamblaje metagenómico.

## Que comience la práctica

Creamos una carpeta para correr ***MS**:
 ```bash
mkdir metaspades
cd metaspades
```
Visualizamos las opciones que nos proporciona este programa:
 ```bash
metaspades.py
```
 ```bash
SPAdes genome assembler v3.13.0 [metaSPAdes mode]

Usage: /home/centos/bin/tools/SPAdes-3.13.0-Linux/bin/metaspades.py [options] -o <output_dir>

Basic options:
-o	<output_dir>	directory to store all the resulting files (required)
--iontorrent		this flag is required for IonTorrent data
--test			runs SPAdes on toy dataset
-h/--help		prints this usage message
-v/--version		prints version
```
Ejecutamos ***MS*** proporcionando las rutas absolutas de cada metalectura, esto debido a que ***MS*** no acepta enlaces simbólicos:
 ```bash
metaspades.py -1 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_1.fastq -2 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_2.fastq -o out_metaspades
```
Se generan más ficheros en comparación cuando corremos ***MH*** de manera estandarizada:

| °  | °  | °  | °  | °  | °  |
|---|---|---|---|---|---|
| assembly_graph.fastg  | assembly_graph_with_scaffolds.gfa  | before_rr.fasta  | contigs.fasta  | contigs.paths  | corrected/  |
| dataset.info  | first_pe_contigs.fasta  | input_dataset.yaml  | K21/  | K33/  | K55/  |
| misc/  | params.txt  | scaffolds.fasta  | scaffolds.paths  | spades.log  | tmp/  |

Dentro de los resultados de ***MS*** podemos consultar los ***k-mers*** implementados durante el metaensamble.

Ingresamos al contenido final para visualizar los contigs generados y a su vez compararlos con los de ***MH*** :

 ```bash
cd out_metaspades
```
 ```bash
grep ">" -c contigs.fasta
29
```
