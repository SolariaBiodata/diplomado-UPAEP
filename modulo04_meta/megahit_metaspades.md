
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
| final.contigs.fa  | intermediate_contigs/  |
| log  | opts.txt  |
| °  | °  |

 ```bash
cd out_megahit
```
 ```bash
grep ">" -c final.contigs.fa
```cd ou  
