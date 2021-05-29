---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Bioinformática

### Ensambles _de novo_

La secuenciación permite obtener el contenido de la secuencia de miles de lecturas. Estas son fragmentos provenientes de moléculas de DNA cuya función biológica está determinada por la completitud de la secuencia. Por lo tanto, uno de los procesos más importantes en la secuenciación consiste en la _reconstrucción_ de la secuencia original, es decir, de la molécula de orígen biológico que se fragmentó al incio del proceso. Los procesos que se orientan a resolver este problema se conocen como _ensambles_.

Un tipo particular de ensamble es el _de novo_, lo cual ímplica que la única información disponible para realizar el ensamble es la información de secuencia contenida en todas las lecturas. Un caso análogo al problema de armar un rompecabezas sin ninguna clase de guía.

Un concepto crucial para resolver el problema de los ensambles es el sobrelapamiento:

```
           CTCGGCTCTAGGCCCTCATTTTT
           CTCGGCTCTAGGCCCTCATTTT
        TATCTCGACTCTAGGCCCTCA
        TATCTCGACTCTAGGCC
    TCTATATCTCGGCTCTAGG
GGCGTCTATATCTCG
GGCGTCTATATCT
GGCGTCTATATCT
```
```
GGCGTCTATATCTCGGCTCTAGGCCCTCATTTTT
```

Así mismo, también otro concepto importante que implica alinear dos secuencias:

 a. `TCTATATCTCGGCTCTAGG` $$a$$
 b. `TATCTCGACTCTAGGCC` $$b$$

```
TCTATATCTCGGCTCTAGG
    IIIIIII IIIIIII
    TATCTCGACTCTAGGCC
``` 

en este caso el **sufijo** de $$a$$$ es similar al **prefijo** de $$b$$, tomando en cuenta que la similaridad es flexible, es decir, podemos aceptar coincidencias perdidas debido a que pueden existir diversas fuentes de variación.

Existen diferentes métodos para recuperar ensambles _de novo_, a continuación se describen algunos criterios importantes:

| Método | Fundamentos | Casos de uso |  Ejemplos de software |
|--|--|--|--|
| **OLC** | Construcción de grafos de sobrelapes <br> Refinamiento de los grafos <br> Generación de consensos | Funcionan mejor con lecturas largas | Celera Assembler, Newbler, Arachne, Canu |
| **Gráficas de Bruijn** | Descomposición de lecturas en k-meros <br> Generación de gráficas de cobrelapes de k-meros <br> Implementación de la solución algorítmica para encontrar _ciclos Eulerianos_ | Se usan con lecturas de alta calidad, pueden ser lecturas cortas | Euler, Velvet, Spades, Abyss |

**velvet**

Para implementar este software se requieren de dos programas `velveth` y `velvetg`. El primero realiza la generación de k-meros, donde precisamente el valor $$k$$ se determina. El segundo realiza la solución del gráfico de _de Bruijn_ utilizando la estructura de directorios generado por `velveth`.

```bash
velveth ruta/salida/ 31 -separate mislecturas_R1.fastq mislecturas_R2.fastq
velvetg ruta/salida/
```









[Menú Principal](./)

[Atras](./archivosBioinfo)

[Siguiente](./#)
