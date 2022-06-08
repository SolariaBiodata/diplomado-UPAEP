

```bash
$ ls -lhtr /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/

SRR6651926_final.contigs.fa
SRR6651936_final.contigs.fa
SRR6651949_final.contigs.fa

```

```bash
$ cd /home/centos/diplomadoUPAEP/carpetapersonal/

$ mkdir kraken_krona

$ cd kraken_krona
```

```bash
$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651926_final.contigs.fa SRR6651926
$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651936_final.contigs.fa SRR6651936
$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651949_final.contigs.fa SRR6651949
```

```bash
ls -lhtr

SRR6651926 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651926_final.contig
SRR6651936 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651936_final.contig
SRR6651949 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRR6651949_final.contig
```

```bash
$ ln -s /media/data/solaria/.backup/tools/software/bin/minikraken_20171013_4GB/ minikraken
$ ls -lhtr 
  minikraken -> /media/data/solaria/.backup/tools/software/bin/minikraken_20171013_4GB/
```

```bash
$ mkdir SXX26/
$ cd    SXX26/
$ kraken --fasta-input ../SRR6651926 --db ../minikraken/ --output out_kraken_26
```

```bash
$ kraken-report --db ../minikraken/ out_kraken_26 > report_26
```

```bash
$ kreport2krona.py -r report_26 -o krona_input_26
```

```bash
$ ktImportText -o Tu_Nombre_krona_26.html krona_input_26
```
```bash
$ sbcp Tu_Nombre_krona_26.html
```

<iframe id="igraph" scrolling="yes" style="border:none;" seamless="seamless" src="./htmls_kraken_mpa/prueba_kraken_krona_26.html" height="525" width="100%"></iframe>

## Practica con las lecturas restantes 

```bash
$ cd /home/centos/diplomadoUPAEP/carpeta_personal/
```
```bash

$ mkdir phlan_meta

$ cd phlan_meta

$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/SRS019033.fastq SRS019033

$ ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion2/mpa_v20_m200 mpa_v20_m200

```

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

```bash
$ metaphlan2.py
  usage: metaphlan2.py --input_type
                     {fastq,fasta,multifasta,multifastq,bowtie2out,sam}
                     [--mpa_pkl MPA_PKL] [--bowtie2db METAPHLAN_BOWTIE2_DB]
                     [--bt2_ps BowTie2 presets] [--bowtie2_exe BOWTIE2_EXE]
  [...]
  
```

```bash
$ metaphlan2krona.py -p SRS019033_test -k krona_input_SRS019033
```
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
$ ktImportText -o Tu_Nombre_krona_mpa_SRS019033.html krona_input_SRS019033
```
```bash
$ sbcp Tu_Nombre_krona_mpa_SRS019033.html
```































