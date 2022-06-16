---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

```bash
ls -lhtr /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/

    SRR6651926_final.contigs.fa
    SRR6651936_final.contigs.fa
    SRR6651949_final.contigs.fa
    cycles -> /home/centos/diplomadoUPAEP/aa_solaria/mebs/cycles/
    data2vis -> /home/centos/diplomadoUPAEP/aa_solaria/mebs/data2vis/
```

```bash
cd /home/centos/diplomadoUPAEP/carpeta_personal
mkdir prodigal
cd prodigal
```

```bash
ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651926_final.contigs.fa 26

ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651936_final.contigs.fa 36

ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651949_final.contigs.fa 49
```

```bash
ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/cycles/ cycles

ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/data2vis/ data2vis
```

```bash
ls -lhtr
    26 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651926_final.contigs.fa
    36 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651936_final.contigs.fa
    49 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651949_final.contigs.fa
    cycles -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/cycles/
    data2vis -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/data2vis/
```

# Prodigal

```bash
prodigal -i 26 -o misgenes_26 -a myproteins_26 -p meta
prodigal -i 36 -o misgenes_36 -a myproteins_36 -p meta
prodigal -i 49 -o misgenes_49 -a myproteins_49 -p meta
```

```bash
mkdir copia_aminoacidos 
mv myproteins_26.faa myproteins_36.faa myproteins_49.faa
```

```bash
mebs.pl -input ../copia_aminoacidos/ -type metagenomic -fdr 0.0001 -comp > tabla_mebs.txt
```
```bash
mkdir results_mebs
mebs_vis.py tabla_mebs.txt -o results_mebs
```
```bash
cd results_mebs
ls
tabla_mebs.txt_2_cluster_mebs.txt
tabla_mebs.txt_barplot.png
tabla_mebs.txt_comp_heatmap.png
tabla_mebs.txt_genomic_completenes.tab
tabla_mebs.txt_itol_mebs_comp.txt
tabla_mebs.txt_itol_mebs.txt
tabla_mebs.txt_mebs_dotplot.png
tabla_mebs.txt_mebs_heatmap.png
tabla_mebs.txt.noa
tabla_mebs.txt_norm_mebs.tab
tabla_mebs.txt_pfam_completenes.tab
```
```bash
sbcp tabla_mebs.txt_comp_heatmap.png
```
