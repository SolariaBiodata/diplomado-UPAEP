
 ```bash
mkdir megahit
```
 ```bash
cd megahit
```
 ```bash
ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_1.fastq SRR19423238_1
ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_2.fastq SRR19423238_2
```
 ```bash
ls -lhtr
SRR19423238_1 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_1.fastq
SRR19423238_2 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/practica_mh_ms/SRR19423238_2.fastq
```
 ```bash
megahit -1 SRR19423238_1 -2 SRR19423238_2 -o out_megahit
```

| °  | °  |
|---|---|
|  final.contigs.fa  |  intermediate_contigs/  |
|  log  |  opts.txt  |
|  °  |  °  |

 ```bash
cd out_megahit
```
 ```bash
grep ">" -c final.contigs.fa
3
```

 ```bash
mkdir metaspades
cd metaspades
```
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
