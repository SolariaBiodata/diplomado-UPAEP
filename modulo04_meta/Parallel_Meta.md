---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 2o [Diplomado de Bioinformática](./)

# Procesamiento de datos de microbioma con Parallel-META 3

![imagen_pm](https://user-images.githubusercontent.com/54455898/170573799-385cde3c-68fa-4cb4-a418-7525bacc818d.jpg)


## Cuestión actual sobre los datos metagenómicos

El número de metagenomas está aumentando rápidamente. Sin embargo, los métodos actuales para el análisis metagenómico están limitados por su capacidad para la extracción de datos en profundidad entre una gran cantidad de microbiomas, cada uno de los cuales tiene una estructura comunitaria compleja. Además, la dificultad de configurar y operar la canalización computacional también complica el procesamiento de datos eficiente para los investigadores.

## ¿Qué es Parallel-Meta?

* Parallel-Meta (PM) es un paquete de software fácil de usar para el análisis rápido y completo de datos de microbiomas en múltiples plataformas.

* PM cubre una amplia gama de funciones para el preprocesamiento de datos, estadísticas, visualización mediante algoritmos de última generación.

* Todo el procedimiento de PM está optimizado por un esquema de computación paralelo que permite el procesamiento rápido de miles de microbiomas.

## Pasos previos para ejecutar Parallel-Meta

### Hacer la lista de archivos de secuencia

Debe permitir que Parallel-META conozca las rutas de sus muestras de entrada mediante una lista de archivos de secuencias. En la lista, cada línea contiene la ruta exacta de un solo archivo de secuencia de una muestra, por lo que la cantidad de líneas en la lista debe ser igual a la cantidad de muestras de entrada. Se recomienda encarecidamente las rutas absolutas (rutas completas) para evitar los errores de ruta. Estos datos están guardados para esta práctica como ***list_test.txt***. A continuación se muestra un ejemplo de la lista de archivos de secuencia.

```bash
085-01 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R1_001.fastq

085-01 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R2_001.fastq

085-02 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R1_001.fastq

085-02 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R2_001.fastq

085-03 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R1_001.fastq

085-03 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R2_001.fastq
```

### Comprueba tus metadatos
Los metadatos son una tabla que contiene los IDs de las muestras y la información que desea analizar y comparar. En la tabla, las muestras deben ordenarse como en la lista de archivos de secuencia del último paso. Cada fila representa una muestra y cada columna representa una característica. Las columnas deben estar separadas por tabulaciones. Toda la información de las descripciones de las muestras en la tabla de metadatos NO debe contener ningún símbolo de espacio (‘ ’), símbolo de barra invertida (‘/’) ni símbolo de tabla (‘\t’). El ejemplo de abajo representa la tabla de metadatos que se usará para la parte práctica.

```bash
ID      TypeSample
085-01  suelo
085-02  agua
085-03  sedimento
```

## Ejecución del programa

Ahora para correr Parallel-META 3, solo se requiere ejecutar el siguiente comando de una sola línea:

```bash
PM-pipeline -i list_test.txt -m metadata_test.txt -R T -o output_test
```
### Al terminar de procesar los datos se generará el archivo de salida llamado ***output_test*** con el siguiente contenido

| °  | °  | °  | °  | °  |
|---|---|---|---|---|
| Abundance_Tables/  |  Analysis_Report.txt | Alpha_Diversity/  | Beta_Diversity/  | Clustering/  |
|  Markers/ |  Network/ |   Sample_Views/ |  Single_Sample/ | Single_Sample.List  |
| error.log  | meta.txt  | scripts.sh  | index.html   | Distance_Matrix/  |


### Dentro de la carpeta "Abundance_Tables/" podemos visualizar gráficas de abundancia relativa con base a ciertas clasificaciones

### Visualización de abundancia relativa a nivel de ***filo*** 

![taxa phylum Abd distribution-1](https://user-images.githubusercontent.com/54455898/170571276-d551f060-d113-45f3-b59d-db917834ea8c.png)

### Visualización de abundancia relativa a nivel de ***género*** 

![taxa genus Abd distribution-1](https://user-images.githubusercontent.com/54455898/170571663-5858a14a-2b3e-4f7b-a2fd-98c7e4d94e53.png)

### Diversos gráficos que podemos obtener con PM

Como te habrás dato cuenta, los diferentes tipos de ficheros generados por PM se nombran con el prefijo "taxa", los cuales son resultados de taxonomia, así como "func" que son resultados funcionales metabólicos.

Las siguientes figuras son ejemplos que también se pueden visualizar en los resultados de PM. Para consultar información más específica puedes consultar el manual de [Parallel_META](http::/bioinfo.single-cell.cn/Released_Software/parallel-meta/sampledata/TutorialPM3.pdf)

![i_piechart_PM](https://user-images.githubusercontent.com/54455898/170790669-2cfb15ad-c6c3-424e-8469-2a8d5f87c323.png)



