










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



























