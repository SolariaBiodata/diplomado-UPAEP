---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)










El servidor de Solaria Biodata cuenta con el paquete de Qiime 2.4 dentro de un ambiente el cual debemos de activar, para ello debemos de ejecutar lo siguiente:

```bash
conda activate qiime2-2021.4
```

#### Tabla de metadatos

El entorno de Qiime requiere que cuentes con una tabla de metadatos con información sobre sus muestras, dicha información debe estar separada por tabulaciones, como la que se muestra a continuación:

| SampleID  | TypeSample  |  
|---|---|
| 085-01  | suelo  |   
| 085-02  | agua  |   
| 085-03  | sedimento  |   

#### Inspección de metadatos

La tabla de metadatos debe de estar con el formato correcto, para verificarlo debe realizar la siguiente instrucción en la terminal

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



























