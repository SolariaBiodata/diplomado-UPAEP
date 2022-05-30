---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)










El servidor de Solaria Biodata cuenta con el paquete de QIIME 2.4 dentro de un ambiente el cual debemos de activar, para ello debemos de ejecutar lo siguiente:

```bash
conda activate qiime2-2021.4
```

#### Tabla de metadatos

El entorno de QIIME requiere que cuentes con una tabla de metadatos con información sobre sus muestras, dicha información debe estar separada por tabulaciones, como la que se muestra a continuación:

| SampleID  | TypeSample  |  
|---|---|
| 085-01  | suelo  |   
| 085-02  | agua  |   
| 085-03  | sedimento  |   

#### Inspección de metadatos

La tabla de metadatos debe cargar en QIIME con el formato correcto, para verificarlo debe realizar la siguiente instrucción en la terminal

```bash
qiime tools inspect-metadata metadata_test.txt
```
#### Archivo manifiesto

También es indispensable contar con un archivo manifiesto como el ejemplo de abajo:

| sample-id  | absolute-filepath  | direction  |
|---|---|---|
| 085-01  | /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R1_001.fastq  | forward  |
| 085-01  | /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R2_001.fastq  | reverse  |
| 085-02  | /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R1_001.fastq  | forward  |
| 085-02  | /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R2_001.fastq  | reverse  |
| 085-03  | /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R1_001.fastq  | forward  |
| 085-03  | /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R2_001.fastq  | reverse  |

Es importante mencionar que cada tipo de información debe de estar separada por comas "," y sin ningún tipo de espacios.

### Serie de instrucciones

#### Importación de datos pareados 

Una vez que tengamos nuestros dos ficheros principales debemos importar nuestras lecturas que, en este caso son pareadas con la finalidad que se genere un archivo en formato qza con la información de sus lecturas:

```bash
qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' --input-path manifiesto.csv --input-format PairedEndFastqManifestPhred33 --output-path raw-seqs.qza 
```

#### Procesamiento de ruidos 

La siguiente instrucción que se ejecuta es para eliminar el ruido de los extremos de las secuencias emparejados, así como la filtración de quimeras:

```bash
qiime dada2 denoise-paired --i-demultiplexed-seqs raw-seqs.qza --p-trunc-len-f 150 --p-trunc-len-r 150 --p-trunc-q 10 --o-representative-sequences rep-seqs.qza --output-dir rep --verbose 
```
#### Clasificación

Ya que se hayan eliminado ciertos ruidos será posible proceder con la clasificación de sus lecturas, para ello contamos en el servidor con una base de datos de SILVA extraída del siguiente [repositorio](https://github.com/qiime2/docs/blob/master/source/data-resources.rst) :

```bash
qiime feature-classifier classify-sklearn --i-classifier rep/silva-138-99-nb-weighted-classifier.qza --i-reads rep-seqs.qza --o-classification taxonomy.qza 
```
Cuando se tienen los datos clasificados se pueden contraer grupos de entidades que tienen la misma asignación taxonómica en el nivel especificado. Las frecuencias de todas las entidades se sumarán cuando se colapsen:

```bash
qiime taxa collapse --i-table rep/table.qza --i-taxonomy taxonomy.qza --p-level 6 --output-dir taxtable
```
En el comando anterior se realizó la asignación taxonómica hasta el nivel 6.

Es necesario tabualar los resultados generados para ver los tipos de columna de sus muestras:

```bash
qiime metadata tabulate --m-input-file taxonomy.qza --o-visualization taxonomy.qzv
```
QIIME2 utiliza dos tipos de archivos diferentes que contienen los datos y metadatos de un análisis: los archivos ***.qza*** son archivos de datos, mientras que los archivos ***.qzv*** son visualizaciones.

```bash
qiime taxa barplot --i-table rep/table.qza --i-taxonomy taxonomy.qza --m-metadata-file metadata_test.txt --o-visualization taxa-barplot.qzv
```
Descargamos los archivos que se pueden visualizar con el comando ***sbcp*** exclusivo de [Solaria Biodata](http://13.56.237.15/) :

```bash
mv taxa-barplot.qzv TuNombre_taxa-barplot.qzv
```

```bash
sbcp TuNombre_taxa-barplot.qzv
```
Ciertos archivos se pueden visualizar en [QIIME 2 View](https://view.qiime2.org/) :

![qiimeview](https://user-images.githubusercontent.com/54455898/171028623-a164f92f-367b-4216-bb8a-0bacea469c79.png)
 "qiime2view")
 
****QIIME 2 View**** o ****q2view**** admite la visualización de archivos alojados externamente, lo que significa que puede proporcionar un enlace a su archivo (por ejemplo, en Dropbox) y ****q2view**** lo descargará y mostrará automáticamente. Mejor aún, las páginas resultantes se pueden compartir, por lo que si un colaborador no cuenta con este paquete, simplemente puede cargar sus resultados y compartir sus enlaces de ****q2view**** con su colaborador.


[Menú Principal](./)

[Atras](./)

[Siguiente](./)
















