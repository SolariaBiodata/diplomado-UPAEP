---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Lenguajes de programación

### Estructuras de Python 

Cuando trabajamos con **Python** procesamos objetos que contienen datos. Cada uno de esos objetos tiene una estructura particular, sin embargo existen algunas propiedades estructurales de los objetos que son consecuencia de sus características. 

![](https://drive.google.com/uc?id=1M7Z8g2qLHOOQWP2hzTaG6nTP7OlV3Jan&export=download)

En términos generales ya hemos visto las estructuras puntuales o de dimensión $$0$$ (`var1 = 3`). Sin embargo conviene revisar las estructuras con base en sus dimensiones.

#### Datos unidimensionales

Son estructuras en donde podemos almacenar información que es interpreatada como elementos individuales de un índice. A continuación revisaremos estas estructuras

**Listas**

Una lista en Python es una estructura de datos formada por una secuencia ordenada de objetos. Lo especial de las listas en Python es que nos permiten almacenar cualquier tipo de valor como enteros, cadenas y hasta otras funciones. En el caso de `R` estos son denominados vectores.

```python
# Una lista puede estar compuesta por valores numéricos
list1 = [7, 8, 9]
# Tambien por caracteres
list2 = ['uno', 'dos', 'tres']
```

Por defecto, las listas aceptan tipos de datos heterogéneos en este lenguaje:

```python
# Combinación de caracteres, numeros y booleanos
list3 = ['uno', 1, 'dos punto cinco', 2.5, True]
```

También es posible realizar listas de listas:

```python
# Lista de Listas
list5 = [[1,2,3],[4,5,6],[7,8,9]]
list5
```
```
[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

Antes de iniciar con el procesamiento de una lista, puede ser conveniente inicializar una lista vacía:

```python
list6 = []
```

En python se usa un estilo de indexación basado en $$0$$ esto quiere decir que el primer elemento de una lista tiene el índice `0`, el segundo `1`, y así sucesivamente, por tanto es posible acceder a los elementos de una lista de esta forma:

```python
list3[2]
```
```
'dos punto cinco'
```

**Arrays**

Python tiene listas, enteros, punto flotante, etc. Para cálculo numérico necesitamos más... allí aparece **Numpy**. Numpy es un paquete que provee a Python con arreglos multidimensionales de alta eficiencia y diseñados para cálculo científico.

Un array puede contener:

- tiempos discretos de un experimento o simulación.
- señales grabadas por un instrumento de medida.
- pixeles de una imagen, etc.

para usar este tipo de estructuras es necesario importar un paquete

```python
import numpy as np
```

en este caso, se usa un _alias_ para poder invocar a numpy con mayor facilidad. El uso de `np` como abrebiatura de `numpy` es una práctica estándar en la comunidad, por lo cual se usará de aquí en adelante.

Una vez que se ha cargado el paquete se puede generar un array de esta forma:


```python
var = np.array([1,2,3,4])
```

**Diccionarios**

Un Diccionario es una estructura de datos y un tipo de dato en Python con características especiales que nos permite almacenar cualquier tipo de valor como enteros, cadenas, listas e incluso otras funciones. Estos diccionarios nos permiten además identificar cada elemento por una clave (Key).

```python
diccionario = {'nombre' : 'Carlos', 'edad' : 22, 'cursos': ['Python','Django','JavaScript'] }
```

En este caso existen 3 claves y 3 valores que se relacionan de este modo:

| Clave | Valor |
|--|--|
| `'nombre'` | `'Carlos'` |
| `'edad'` | `22`|
| `'cursos'` | `['Python','Django','JavaScript']` |

Podemos acceder al elemento de un Diccionario mediante la clave de este elemento, como veremos a continuación:

```python
print(diccionario['nombre'])
print(diccionario['edad'])
print(diccionario['cursos'][2])
```
```
Carlos
22
JavaScript
```

#### Datos multidimensionales

**Matrices**

Las matrices son una estructura de daos bidimensionales donde los elementos se organizan en filas y columnas. Python no tiene un tipo de dato incorporado para trabajar con matrices, sin embargo podemos tratar la matriz como una lista de listas, por ejemplo:

```python
A = [[1,2,3],
     [4,5,6]]
print(A)
```
```
[[1, 2, 3], [4, 5, 6]]
```

El uso de las listas anidadas para trabajar como una matriz funciona para tareas simples, sin embargo, a la hora de trabajar con matrices complejas podremos usar el paquete Numpy.

Hay varias formas de crear una array en NumPy, veamos un ejemplo con Integers, Floats y números complejos:


```python
B = np.array( [[1,2,3],
     [4,5,6],
     [7,8,9],
     [10,11,12]])
```

Con numpy se puede generar un arreglo de `0`s con la forma $$m \times n$$:

```python
C = np.zeros((2,3))
```

Asimismo se puede convertir una lista mediante el método `reshape`:

```python
list1 = [1,2,3,4,5,6,7,8,9,10]
D = np.array(list1).reshape(2,5)
```

#### DataFrames

El DataFrame es una estructura de 2 dimensiones etiquetada donde podemos almacenar datos de diferentes tipos. DataFrame es similar a una tabla `SQL`, una hoja de cálculo de Excel, una matriz de tipo heterogénea o simplemente una tabla.

Pandas es una biblioteca de código abierto de Python que proporciona análisis y manipulación de datos en la programación en Python. Para empezar a trabajar con el paquete de pandas, hay que importar el paquete:


```python
import pandas as pd
```

En la mayor parte de los casos, nosotros no vamos a definir un dataframe desde cero, sino que vamos a cargar información o tablas previamente generada en otros pasos. Ejemplos:

 - Una Tabla de Abundancia Taxonómica
 - Resultados de BLAST
 - Grafos Acíclicos
 - Relaciones Padre / Hijo
 - Mapas Genéticos

Se puede importar datos de la siguiente manera:

| Tipo de archivo | Ejemplo de importación con pandas |
|--|--|
| **Excel** | `pd.read_excel('datos.xlsx', 'Sheet1')` |
| **CSV** | `pd.read_csv('datos.csv')` |
| **TSV** | `pd.read_csv('datos.tsv', sep = '\t')` |

Por último, es de interés en ocasiones generar un DataFrame desde objetos hechos durante el procesamiento.

En este código, creamos un DataFrame con tres columnas y tres filas usando el método `DataFrame()` de pandas. El resultado será el siguiente:

```python
#Primero haremos un Diccionario
frame = {'Nombre': ['Ana', 'Mia', 'Kat'], 'Edad': [18, 20, 22], 'Carrera': ['Ingeniería', 'Piloto', 'Chef']}
pandas.DataFrame(frame)
```
```
  Nombre	Edad	Carrera
0	Ana	    18  	Ingeniería
1	Mia   	20  	Piloto
2	Kat	    22	  Chef
```


[Menú Principal](./)

[Atras](./principiosPython)

[Siguiente](#)
