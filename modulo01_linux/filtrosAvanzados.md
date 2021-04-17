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

siendo \\[N \in \mathbb{Z}^{+}; M \in \mathbb{Z}^{+};\\]

 - **N** representa al N-ésimo componente (_byte_, caracter o columna)
 - **N-** representa a todos los componentes desde el N-ésimo hasta el último de cada línea
 - **N-M** representa a todos los componentes entre el N-ésimo y el M-ésimo, incluídos N y M
 - **-M** representa a todos los componentes desde el primero hasta el M-ésimo de dicha línea
 - **N,M** representa a solo los componentes N-ésimo y M-ésimmo de cada línea

ahora, **N** y **M** pueden representar por sí mismos otros rangos, por lo que se pueden construir cualquier combinación de rangos para especificar muy detalladamente los componentes que se desean extraer:

```bash
cut -d "," -f 1,5-8,10,12,21- archivo.csv
```

En este ejemplo, de un archivo de valores separados por comas, se extraerían las columnas (1,5,6,7,8,10,12,21,22,23,...).

#### tr

Este comando permite intercambiar cualquier conjunto de caracteres por otro conjunto de caracteres. Intercambia la aparición del primer conjunto con el segundo conjunto. Este comando toma el texto de `stdin` hace el intercambio y lo despliega en `stdout`.

```bash
tr [OPCIONES] [CONJUNTO_1] [CONJUNTO_2]
```
Los caracteres expresados en el `CONJUNTO_1` son sustituídos uno a uno por los expresados en el `CONJUNTO_2`, para ello se asume que los conjuntos son del mismo tamaño. Si el `CONJUNTO_1` contiene más caracteres que el `CONJUNTO_2`, el último caracter del `CONJUNTO_2` se repite hasta que ambos conjuntos tienen el mismo tamaño. Si el `CONJUNTO_2` es más grande, el exceso de caracteres al final en dicho conjunto es ignorado.

Las opciones de este comando son las que se presentan con los siguientes modificadores:

| Modificador | Descripción |
|--|--|
| `-c` | Usa el complemento de `CONJUNTO_1` como `CONJUNTO_1` |
| `-d` | Sustituye los caracteres del `CONJUNTO_1` con el caracter `''`, es decir, los elimina |
| `-s` | Reemplaza cada secuencia de caracteres repetidos en el `CONJUNTO_1` con solo una ocurrencia del mismo caracter, `-s` proviene de _squeeze-repeats_ |
| `-t` | Trunca el exceso de caracteres al final del `CONJUNTO_1` para que tenga la misma longitud que `CONJUNTO_2` |

Los _conjuntos_ deben ser expresados como cadenas de caracteres. La mayoría de los caracteres se representan a sí mismos excepto por:

 - `\NNN` es el caracter con valor octal NNN
 - `\\\\` backslash, contrabarra \\ 
 - `\\b`  backspace







#### sed





[Menú Principal](../)

[Atras](./operacionesAvanzadasArchivos)

[Siguiente](#)
