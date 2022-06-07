Creamos dentro de nuestro directorio personal una carpeta donde ejecutaremos ***MH***:
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
Ejecutamos ***MS*** proporcionando las rutas absolutas
 ```bash
metaspades.py -1 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_1.fastq -2 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_2.fastq -o out_metaspades
```
| °  | °  | °  | °  | °  | °  |
|---|---|---|---|---|---|
| assembly_graph.fastg  | assembly_graph_with_scaffolds.gfa  | before_rr.fasta  | contigs.fasta  | contigs.paths  | corrected/  |
| dataset.info  | first_pe_contigs.fasta  | input_dataset.yaml  | K21/  | K33/  | K55/  |
| misc/  | params.txt  | scaffolds.fasta  | scaffolds.paths  | spades.log  | tmp/  |

 ```bash
cd out_metaspades
```
 ```bash
grep ">" -c contigs.fasta
29
```
