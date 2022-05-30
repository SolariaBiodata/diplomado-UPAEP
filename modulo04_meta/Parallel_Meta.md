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

## Instalación 

El programa PM ya se encuentra habilitado en el servidor de ***Solaria Biodata*** , de igual forma puedes instalarlo en tu equipo de computo ejecutando los siguientes pasos.

### Descargue el paquete adecuado para su sistema operativo (Mac OS o Linux)

Dirígete a esta [página_oficial](http://bioinfo.single-cell.cn/parallel-meta.html) para descargar la versión más actual.

### Descomprimir el paquete

```bash
tar -xzvf parallel-meta.tar.gz
```
### Entrar al directorio descomprimido

```bash
cd parallel-meta/
```
### Ejecutar el instalador

```bash
source install.sh
```
### Verificación

Pueder revisar si se instaló correctamente Parallel-META 3 presionando ***Enter*** a lo siguiente en tu terminal

```bash
PM-pipeline
```

## Pasos previos para ejecutar Parallel-Meta

### Lecturas de secuenciación descomprimidas

Es muy importante revisar que tus archivos de secuenciación se encuentren descromprimidos, ya que al momento de correr PM no generará como tal un error, y se podría desperdiciar demasiado tiempo en tanto a los recursos de cómputo. Normalmente las lecturas de secuenciación se encuentran comprimidas en formato ***gz*** el cual es un algoritmo de compresión estándar GNU zip (gzip).

Si se encuetran todas tus lecturas comprimidas dentro de la misma carpeta puedes ejecutar el siguiente comando:

```bash
gunzip *.gz
```
En dado caso de que desees volver a comprimir todas tus lecturas en un solo paso simplemente corres la siguiente instrucción en la terminal:

```bash
gzip *.fastq
```
### Elaboración de una lista de archivos de secuencia

Debe permitir que Parallel-META conozca las rutas de sus muestras de entrada mediante una lista de archivos de secuencias. En la lista, cada línea contiene la ruta exacta de un solo archivo de secuencia de una muestra, por lo que la cantidad de líneas en la lista debe ser igual a la cantidad de muestras de entrada. Se recomienda encarecidamente las rutas absolutas (rutas completas) para evitar los errores de ruta. Estos datos están guardados para esta práctica como ***list_test.txt***. A continuación se muestra un ejemplo de la lista de archivos de secuencia.

```bash
085-01 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R1_001.fastq

085-01 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-01_S1_L001_R2_001.fastq

085-02 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R1_001.fastq

085-02 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-02_S2_L001_R2_001.fastq

085-03 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R1_001.fastq

085-03 /home/centos/diplomadoUPAEP/aa_solaria/fastqs/metagenomics/reads_profiling/085-03_S3_L001_R2_001.fastq
```

### Comprobación de metadatos
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

Las siguientes figuras son ejemplos que también se pueden visualizar en los resultados de PM. Para consultar información más específica puedes revisar el manual de [Parallel_META](http://bioinfo.single-cell.cn/Released_Software/parallel-meta/sampledata/TutorialPM3.pdf)

#### Gráfico circular interactivo

![i_piechart_PM](https://user-images.githubusercontent.com/54455898/170790669-2cfb15ad-c6c3-424e-8469-2a8d5f87c323.png)

El gráfico circular interactivo resume las composiciones taxonómicas de un grupo seleccionado. Los investigadores pueden hacer clic en una sección particular de interés para analizar mejor sus composiciones en un nivel taxonómico más bajo.

##### Mapas de calor 

![heatmap_PM](https://user-images.githubusercontent.com/54455898/170793547-663dcb5e-9059-4086-8f35-8b153dc57fba.png)

Los mapas de calor son una poderosa herramienta que visualizan los datos de microbioma en micromatrices. Básicamente, son imágenes de ***falso color*** en las que las celdas de la matriz con valores relativos altos se colorean de manera diferente a las que tienen valores relativos bajos.

#### Redes de interacción microbiana

![network_pm](https://user-images.githubusercontent.com/54455898/170794162-65372fb9-bb14-401a-ad59-ff2970fde86a.png)

Las redes de interacciones microbianas son cruciales para el análisis de establecimiento y mantenimiento concreto de una población microbiana. Estas interacciones ocurren por el reconocimiento ambiental seguido por la transferencia de información molecular y genética que incluye muchos mecanismos y clases de moléculas.

### Otros ficheros importantes 

A menudo se utilizan diferentes medidas de alto nivel para describir el microbioma en una muestra. Dichas medidas no brindan información sobre los cambios en la abundancia de taxones específicos, pero nos permiten acceder a un cambio o diferencia más amplio en la composición de los microorganismos.

En esta última seccion se enlistan ciertas medidas proporcionadas por Parallel Meta.

####  Diversidad Alfa y Beta

* La diversidad ***alfa*** es una medida de la diversidad del microbioma aplicable a una sola muestra. 
* la diversidad ***beta*** es una medida de la similitud o diferencia de dos comunidades. 

En cuanto a la diversidad alfa, existen muchos índices, cada uno de los cuales refleja diferentes aspectos de la heterogeneidad de la comunidad. Las diferencias clave se relacionan en cómo los índices valoran la variación en especies raras si consideran solo la presencia/ausencia o incorporan la abundancia, y cómo interpretan la ausencia compartida. 

La diversidad beta es una medida esencial para muchos métodos estadísticos populares en principalmente en ecología, como los métodos basados en la ordenación, y se usa ampliamente para estudiar la asociación entre las variables ambientales y la composición microbiana.

En resumen, las medidas de diversidad alfa pueden verse como una estadística resumida de una sola población (diversidad dentro de la muestra), mientras que las medidas de diversidad beta son estimaciones de similitud o diferencia entre poblaciones (entre muestras).

#### Curvas de rarefacción

Las curvas de rarefacción se utilizan a menudo cuando se calculan los índices de diversidad alfa debido a que el número creciente de taxones secuenciados permite estimaciones cada vez más precisas de la diversidad de la población total. Por lo tanto, las curvas de rarefacción se pueden utilizar para estimar la riqueza total de la muestra, en comparación con la riqueza de la muestra observada.


[Menú Principal](./)

[Atras](./)

[Siguiente](./)




