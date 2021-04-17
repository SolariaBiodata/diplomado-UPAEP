---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](../)

## Introducción a Linux

### Filtros Avanzados

Algunos archivos de texto pueden contener mucha información, es posible que en algunos casos solo una parte de esa información es valiosa para procesarse de acuerdo a nuestras necesidades. En este tema se revisarán comandos que permiten la selección estratégica de la información de archivos de texto. 


#### cut

Opera en archivos tabulares para **seleccionar columna(s)** de interés. Un archivo tabular puede ser cualquier archivo que contenga información ordenada en columnas usando un delimitador definido. El resultado es visualizado en la salida estándar. 

```bash
cut [OPCIONES] [FICHERO]
```

Las opciones de este comando son la forma por la cual se definen instrucciones específicas para extraer la información. Para este comando cada modificador debe ser seguido por un valor específico de acuerdo a nuestros requerimientos.

| Modificador | Valor | Descripción |
|--|--|--|
| `-c` | **Rango** | Corte por caracteres, cada posición de caracter en cada línea es evaluado, solo se devuelven los caracteres definidos en el **Rango** |
| `-b` | **Rango** | Corte por _bytes_, cada posición de _bytes_ en cada línea es evaluado, solo se devuelven los _bytes_ definidos en el **Rango** |
| `-f` | **Rango** | Corte por columnas (o campos), solo se devuelven las columnas definidas en el **Rango** |
| `-d` | **Caracter** | Delimitador de columnas, es el caracter que se usa como delimitador de columnas, este modificador solo se puede usar cuando se utiliza el modificador `-f` el valor por defecto es un _tabulador_ (`"\t"`) |

Para definir un **Rango** es necesario seguir algunas convenciones, mismas que se presentan a continuación:

 - **N** representa al N-ésimo componente (_byte_, caracter o columna), donde \[N \in \mathbb{Z}^{+} \]

#### tr



### sed





[Menú Principal](../)

[Atras](./operacionesAvanzadasArchivos)

[Siguiente](#)
