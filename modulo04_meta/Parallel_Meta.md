---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

# Procesamiento de datos de microbioma con Parallel-META 3

## Hacer la lista de archivos de secuencia

Debe permitir que Parallel-META conozca las rutas de sus muestras de entrada mediante una lista de archivos de secuencias. En la lista, cada línea contiene la ruta exacta de un solo archivo de secuencia de una muestra, por lo que la cantidad de líneas en la lista debe ser igual a la cantidad de muestras de entrada. Se recomienda encarecidamente las rutas absolutas (rutas completas) para evitar los errores de ruta. Estos datos están guardados para esta práctica como ****list_test.txt****. Aquí hay un ejemplo de la lista de archivos de secuencia.

```bash
085-01 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R1_001.fastq

085-01 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R2_001.fastq

085-02 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R1_001.fastq

085-02 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R2_001.fastq

085-03 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R1_001.fastq

085-03 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R2_001.fastq
```

## Comprueba tus metadatos
Los metadatos son una tabla que contiene los ID de las muestras y la información que desea analizar y comparar. En la tabla, las muestras deben ordenarse como en la lista de archivos de secuencia del último paso. Cada fila representa una muestra y cada columna representa una característica. Las columnas deben estar separadas por tabulaciones. Toda la información de las descripciones de las muestras en la tabla de metadatos NO debe contener ningún símbolo de espacio (‘ ’), símbolo de barra invertida (‘/’) ni símbolo de tabla (‘\t’). Este es un ejemplo de la tabla de metadatos.

```bash
ID      TypeSample
085-01  suelo
085-02  agua
085-03  sedimento
```

## Correr el programa

Ahora para correr Parallel-META 3, solo se requiere ejecutar el siguiente comando de una sola línea:

```bash
PM-pipeline -i list_test.txt -m metadata_test.txt -R T -o output_test
```
## Al terminar de procesar los datos se generará el archivo de salida llamado ***output_test*** con el siguiente contenido
|°|°|°|°|°|
|-----|-----|-----|-----|-----|
| Abundance_Tables/ | Analysis_Report.txt | Alpha_Diversity/ | Beta_Diversity/ | Clustering/ |
| Markers/ | Network/ | Sample_Views/ | Single_Sample/ | Single_Sample.List |
| error.log  | meta.txt | scripts.sh | index.html | Distance_Matrix/ | 

## Dentro de la carpeta "Abundance_Tables/" podemos visualizar gráficas de abundancia relativa con base a ciertas clasificaciones

### Visualización de abundancia relativa a nivel de ***filo*** 

![taxa phylum Abd distribution-1](https://user-images.githubusercontent.com/54455898/170571276-d551f060-d113-45f3-b59d-db917834ea8c.png)

### Visualización de abundancia relativa a nivel de ***género*** 

![taxa genus Abd distribution-1](https://user-images.githubusercontent.com/54455898/170571663-5858a14a-2b3e-4f7b-a2fd-98c7e4d94e53.png)

