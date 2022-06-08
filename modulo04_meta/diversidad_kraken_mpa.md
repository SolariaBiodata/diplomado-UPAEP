

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








































