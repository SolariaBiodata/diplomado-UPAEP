---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 3er [Diplomado de Bioinformática](./)

# Análisis metafuncional con Prodigal y MEBS

<p align="middle">
  <img src="https://user-images.githubusercontent.com/54455898/174124469-01fb5b2e-158f-4c00-9143-c6a06973aa59.jpg" width="700" />
</p>

La metagenómica ha sido indispensable para evaluar las comunidades microbianas en el tratamiento biológico de ***aguas residuales***, así como en muchas ***áreas naturales***, para la ***eliminación*** ***biológica*** de ***fósforo*** y ***nitrógeno*** por bacterias, el estudio de genes de resistencia a antibióticos (ARG) y la reducción de metales pesados por ***comunidades microbianas***, con un énfasis en la contribución de la ***diversidad microbiana*** y la ***diversidad metabólica***. Si embargo, debemos deducir primeramente las secuencias de genes y aminoácidos que podrían identificarse en este tipo de metadatos.

## Prodigal

* ***Prodigal*** es una super herramienta bioinformática capaz de predecir genes codificadores de proteínas para genomas bacterianos y arqueales.
* Este software se ejecuta sin problemas en genomas terminados, borradores de genomas y metagenomas.

## Disfruta de la última practica

Primero visualizamos el contenido de la sesión 3, el cual tendremos que enlazar a nuestra carpeta personal. 
Las secuencias que usaremos son de muestras de ***rocas halita*** que hemos usado en sesiones anteriores:

```bash
ls -lhtr /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/

    SRR6651926_final.contigs.fa
    SRR6651936_final.contigs.fa
    SRR6651949_final.contigs.fa
    cycles -> /home/centos/diplomadoUPAEP/aa_solaria/mebs/cycles/
    data2vis -> /home/centos/diplomadoUPAEP/aa_solaria/mebs/data2vis/
```

Una vez que visualicemos el material a necesitar nos dirigimos a nuestra carperta personal y creamos un directorio para realizar la práctica de metagenómica functional:  

```bash
cd /home/centos/diplomadoUPAEP/carpeta_personal
mkdir prodigal
cd prodigal
```

Generamos las ligas simbólicas de las secuencias a utilizar:

```bash
ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651926_final.contigs.fa 26

ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651936_final.contigs.fa 36

ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651949_final.contigs.fa 49
```

Ahora elaboramos las ligas simbólicas que ocuparemos para generar los análisis:

```bash
ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/cycles/ cycles

ln -s /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/data2vis/ data2vis
```

Verificamos que las ligas simbólcas se hayan creado correctamente:

```bash
ls -lhtr
    26 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651926_final.contigs.fa
    36 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651936_final.contigs.fa
    49 -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/SRR6651949_final.contigs.fa
    cycles -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/cycles/
    data2vis -> /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/sesion3/data2vis/
```

Ya que tengamos el material enlazado podemos comenzar con la ejecución de ***Prodigal***, para ello visualizamos primeramente su manual:

```bash
prodigal
-------------------------------------
PRODIGAL v2.6.3 [February, 2016]         
Univ of Tenn / Oak Ridge National Lab
Doug Hyatt, Loren Hauser, et al.     
-------------------------------------

Usage:  prodigal [-a trans_file] [-c] [-d nuc_file] [-f output_type]
                 [-g tr_table] [-h] [-i input_file] [-m] [-n] [-o output_file]
                 [-p mode] [-q] [-s start_file] [-t training_file] [-v]

         -a:  Write protein translations to the selected file.
         -c:  Closed ends.  Do not allow genes to run off edges.
         -d:  Write nucleotide sequences of genes to the selected file.
         -f:  Select output format (gbk, gff, or sco).  Default is gbk.
         -g:  Specify a translation table to use (default 11).
         -h:  Print help menu and exit.
         -i:  Specify FASTA/Genbank input file (default reads from stdin).
         -m:  Treat runs of N as masked sequence; don't build genes across them.
         -n:  Bypass Shine-Dalgarno trainer and force a full motif scan.
         -o:  Specify output file (default writes to stdout).
         -p:  Select procedure (single or meta).  Default is single.
         -q:  Run quietly (suppress normal stderr output).
         -s:  Write all potential genes (with scores) to the selected file.
         -t:  Write a training file (if none exists); otherwise, read and use
              the specified training file.
         -v:  Print version number and exit.
```

Procedemos a la ejecución de ***Prodigal***:

```bash
prodigal -i 26 -o misgenes_26 -a myproteins_26 -p meta
prodigal -i 36 -o misgenes_36 -a myproteins_36 -p meta
prodigal -i 49 -o misgenes_49 -a myproteins_49 -p meta
```
Una vez que termine de procesar las tres muestras visualizamos los ficheros que se generamos:

```bash
ls -lhtr
[...]
misgenes_26
misgenes_36
misgenes_49
myproteins_26
myproteins_36
myproteins_49
```
Si bien se generaron secuencias de genes y sus respectivas traducciones a secuencias de aminoácidos, entonces lo que nosotros nos interesaría primeramente de esos formatos es inferir las vías metabólicas.

Los seis ficheros generados son útiles, sin embargo para ejecutar el siguiente programa únicamente ocuparemos las secuencias de aminoácidos y para ello debemos transportarlas a otra carpeta donde dichas secuencias deben estar en formato ***FAA*** debido a que son una colección de secuencias de aminoácidos del genoma solicitado en formato ***FASTA***:

```bash
mkdir copia_aminoacidos 
mv myproteins_26 copia_aminoacidos/myproteins_26.faa
mv myproteins_36 copia_aminoacidos/myproteins_36.faa
mv myproteins_49 copia_aminoacidos/myproteins_49.faa
```
¿Qué es ***MEBS***? 
***MEBS*** es una plataforma de software diseñada para evaluar, comparar e inferir vías metabólicas complejas en grandes conjuntos de datos ***ómicos***:

```bash
mebs.pl -h

Program to compute MEBS for a set of genomic/metagenomic FASTA files in input folder.
  Version: v1.2

  usage: /home/centos/diplomadoUPAEP/aa_solaria/mebs/mebs.pl [options] 

   -help    Brief help message
   
   -input   Folder containing FASTA peptide files (.faa)             (required)

   -type    Nature of input sequences, either 'genomic' or 'metagenomic'  (required)

   -fdr     Score cycles with False Discovery Rate 0.1 0.01 0.001 0.0001  (optional, default=0.01)

   -cycles  Show currently supported cycles/pathways
   
   -comp    Compute the metabolic completeness of default cycles.         (optional) 
            Required option  for mebs_output.py
```

Procedemos a ejecutar MEBS indicando la carpeta generada anteriormente y direccionamos los resultados a un fichero en formtato de texto plano:

```bash
mebs.pl -input copia_aminoacidos/ -type metagenomic -fdr 0.0001 -comp > tabla_mebs.txt
```
Para visualizar los diferentes tipos de gŕaficas que podemos generar a partir del archivo ***tabla_mebs.txt*** debemos crear un directorio donde se adjuntaran los resultados:

```bash
mkdir results_mebs
```
Activamos el ambiente de conda para habilitar las librerias necesarias:

```bash
conda activate base 
mebs_vis.py -h
------------------------------------------------------------------------------
usage: mebs_vis.py [-h] [-o OUTDIR] [-im_format {png,pdf,ps,eps,svg,tif,jpg}]
                   [--im_res dpi]
                   filename

 Parse mebs.pl output and creates several files and figures:
-File to map mebs normalized values to itol         => itol_mebs.txt
-File with the metabolic completeness with names    => input+completenes.tab
-File to be the output of F_MEBS_cluster.py -s none => input+2_cluster_mebs.txt
-Heatmap with normalized mebs values                => inputmebs_heatmap.png
-Heatmap with metabolic completness of S and C      => input+comp_heatmap.png
-Barplot with normalized mebs values                => input+barplot.png
-Genomic completeness based on marker genes         => input+genomic_completeness.tab
-Normalized mebs scores                             => input+norm_mebs.tab

positional arguments:
  filename              Input file derived from mebs.pl using -comp option.

optional arguments:
  -h, --help            show this help message and exit
  -o OUTDIR, --outdir OUTDIR
                        Output folder [<filename>_mebs_vis]
  -im_format {png,pdf,ps,eps,svg,tif,jpg}, -f {png,pdf,ps,eps,svg,tif,jpg}
                        Output format for images [png].
  --im_res dpi, -r dpi  Output resolution for images in dot per inch (dpi)
                        [dpi].

Example:
$  python3 mebs_vis.py gen_test.tsv 
--------------------------------------------------------------------------------
```
Generamos las visualizaciones:

```bash
mebs_vis.py tabla_mebs.txt -o results_mebs
```
Analizamos el contenido generado

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
En primeria instancia podemos analizar el gráfico ***barplot*** el cual proporciona información sobre las principales fuentes (azufre, carbono, oxígeno, hierro y nitrógeno) requeridas en cada una de las muestras.

También podemos ver algunos de los ***heatmap*** generados y con ello analizar las rutas más completas en cada muestra:

```bash
mv tabla_mebs.txt_barplot.png minombre_barplot_mebs.png
mv tabla_mebs.txt_comp_heatmap.png minombre_heatmap_mebs.png
```
Los visualizamos dentro del servidor en la nube de [Solaria Biodata](http://13.56.237.15/)

```bash
sbcp minombre_barplot_mebs.png
sbcp minombre_heatmap_mebs.png
```

### Visualizaciones 

#### Barplot

<p align="middle">
  <img src="https://user-images.githubusercontent.com/54455898/174034500-794877c7-a4b0-4aa0-8e05-1eb4865d035f.png" width="700" />
</p>

#### Heatmap

<p align="middle">
  <img src="https://user-images.githubusercontent.com/54455898/174034680-24527a23-9b26-468d-9517-1667a65ccc0c.png" />
</p>

[Menú Principal](./index)

[Atras](./diversidad_R)

[Siguiente](./)
