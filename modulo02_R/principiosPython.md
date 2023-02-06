![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 3er[Diplomado de Bioinformática](./)

## Lenguajes de programación

### Principios de Python 

[Python](https://www.r-project.orghttps://www.python.org/) es un lenguaje de programación fácil de aprender. Posee estructuras de datos de alto nivel eficientes y permite un estilo efectivo de programación orientada a objetos. Pyhton es un lenguaje de programación que por su dinámica da pie a su uso de _scripting_, es decir, la generación de programas sencillos y rápidos de implementar que pueden funcionar fuera de un paquete. No obstante, mucha de la popularidad de este lenguaje se debe a la estructura que se puede generar en cuanto a paqueterías y bibliotecas desarrolladas por la comunidad. 

Para invocar el interprete de python solo se necesita usar un comando en nuestra consola de comandos:

```bash
python
```

Ya vimos con [anterioridad](./tiposDatos) los tipos de valores que son usados en lenguajes de programación, sin embargo existen diferentes elementos dentro del lenguaje de progamación `python` que aportan todo el poder de procesamiento de datos.

#### Operadores

Los _operadores_ son los elementos de programación que permiten relacionar datos. En `python` existen diferentes tipos de operadores que se pueden usar con diferentes tipos de datos.

**Aritméticos**

A continuación se describen los operadores que se pueden utilizar

| Operador | Significado |
|----------|-------------|
| `(` `)` | Paréntesis |
|  `**` | Potencia |
| `*` | Multiplicación |
| `/` | División |
| `//` | División entera |
| `%` | Módulo |
| `+` | Adición |
| `-` | Sustracción |

**Binarios**

Para la computadora los valores que nosotros percibimos como números (o caractéres) son definidos de forma binaria. En nuestro caso usamos el sitema de representación decimal, lo cual significa que tenemos 10 símbolos (`0`,`1`,`2`,`3`,`4`,`5`,`6`,`7`,`8`,`9`) para representar cualquier número, en el sistema binario solo existen el `0` y el `1`. Así, existe una representación binaria para todos los números.

Existen operaciones especiales que se pueden ejecutar usando operaciones a nivel binario. Cabe destacar que las operaciones binarias se ejecutan **mucho más rápido** que otras operaciones matemáticas, por lo que se pueden aprovechar su uso al analizar cantidades masivas de datos. Esto se debe a que se interpretan a nivel de procesador directamente.

A continuación una tabla con las operaciones binarias que pueden realizarse:

| Operador | Significado |
|----------|-------------|
| `>>` | Corrimiento binario a la derecha |
| `<<` | Corrimiento binario a la izquierda |
| `&` | AND |
| `\|` | OR |
| `^` | XOR |

Los corrimientos basicamente funcionan como un atajo para multiplicar un número por $2^n$, los corrimientos a la izquierda utilizan $n$ positivos, los corrimientos a la derecha utilizann $n$ negativos. En otras palabras, corrimientos a la izquierda doblan los números, en cambio corrimientos a la derecha los parten por mitades.

Los operadores `AND`, `OR` y `XOR` son compuertas lógicas que proceden del álgebra booleana. En este caso los `1` son interpretados como `verdadero` y los `0` como `falso`.

_`AND`_

| 6 | 5 || `6&5` = `4` |
|--|--||--|
| 1 | 1 || **1** |
| 1 | 0 || **0** |
| 0 | 1 || **0** |

_`OR`_

| 6 | 5 || `6|5` = `7` |
|--|--||--|
| 1 | 1 || **1** |
| 1 | 0 || **1** |
| 0 | 1 || **1** |

_`XOR`_

| 6 | 5 || `6^5` = `3` |
|--|--||--|
| 1 | 1 || **0** |
| 1 | 0 || **1** |
| 0 | 1 || **1** |

**Booleanos**

En el algebra booleana se opera en un espacio donde con 2 estados se puede describir lo que sea. Típicamente los estados son `verdadero` y `falso`. En python se usan los valores lógicos `True` y `False`. Estos valores lógicos se pueden relacionar a través de operadores lógicos, como se muestra a continuación:

_`AND`_

| `A` | `B` | `A and B` |
|--|--|--|
| `False` | `False` | **`False`** |
| `False` | `True` | **`False`** |
| `True` | `False` | **`False`** |
| `True` | `True` | **`True`** |

_`OR`_

| `A` | `B` | `A or B` |
|--|--|--|
| `False` | `False` | **`False`** |
| `False` | `True` | **`True`** |
| `True` | `False` | **`True`** |
| `True` | `True` | **`True`** |

_`NOT`_

| `A` | `not A` |
|--|--|
| `False` | **`True`** |
| `True` | **`False`** |

**Comparación**

En programación, una relación muy importante que existe en los datos son las comparaciones, las cuales ayudan a evaluar mediante un criterio específico dos valores.

| Operador | Significado |
|----------|-------------|
| `==` | Igual que |
| `!=` | Diferente que |
| `>` | Mayor que |
| `>=` | Mayor o igual que |
| `<` | Menor que |
| `<=` | Menor o igual que |

Es importante destacar que estas comparaciones generan resultados del tipo lógico, es decir valores para un resultado verdadero que en pyhton se asiga **`True`** y falso representado como **`False`**.

**Operadores de asignación**

El último tipo de operadores de R son muy útiles, ya que permiten asignar valores a elementos conocidos como _variables_. A continuación una tabla que resume los operadores disponibles en este lenguaje de programación:

| Operador | Significado | Ejemplo |
|--|--|--|
| `=` | Asignación, asigna el valor de la derecha a la izquierda | `x = 1` |
| `+=` | Asignación y adición, agrega el valor de la derecha al de la izquierda | `x += 1` |

**Precedencia de operadores**

Es importantísimo asignar un orden de ejecución cuando se combinan operadores en computación.


| Prioridad | Operador | Significado |
|-----------|----------|-------------|
| 1 | `(` `)` | Paréntesis |
| 2 |  `**` | Potencia |
| 3* | `+x`, `-x`, `~x` | Adición unitaria, sustracción unitaria, NOT binario |
| 4 |  `*`, `/`, `//`, `%` | Multiplicación, división, división entera y módulo |
| 5 | `+`, `-` | Adición, sustracción |
| 6 | `>>`, `<<` | Corrimientos binarios |
| 7 | `&` | AND binario |
| 8 | `\|` | OR binario |
| 9 | `^` | XOR binario |
| 10 | `==`, `!=`, `>`, `>=`, `<`, `<=`, `is`, `is not`, `in`, `not in` | Comparaciones y operadores de pertenencia |
| 11 | `not` | NOT lógico |
| 12 | `and`| AND lógico |
| 13 | `or` | OR lógico |

**Operadores en cadenas de texto**

Así como se pueden procesar valores númericos y lógicos, en Python también se pueden procesar valores de texto que contienen caracteres.

A continuación se presenta una tabla de los operadores de texto

| Operador | Significado |
|--|--|
| `+` | Concatenación |
| `*` | Repetición |
| `[]` | Selección de caracter |
| `[:]` | Selección de rango de caracteres |
| `in` | Está contenido en |
| `not in` | No está contenido en |
| `%` | Realizar formateo especial* |

Se puede apreciar el funcionamiento de los operadores a continuación:

```python
var = 'Hola '*3 + 'Solaria'
var
```
```
'Hola Hola Hola Solaria'
```

Otro ejemplo:

```python
'sol' not in var
```
```
True
```

Asimismo, para realizar formateos es importante que aparte de utilizar el operador `%` se combine con las opciones que se describen a continuación:

| Caracter | Descripción |
|--|--|
| `%c` | Caracter |
| `%s` | Conversión por cadena |
| `%i` | Conversión por entero |
| `%o` | Conversión por octal |
| `%x` | Conversión por hexadecimal |
| `%e` | Formato con notación exponencial |
| `%f` | Formato con punto decimal |

por ejemplo:

```python
"Hola %s, te presento unos ejemplos %c %i %o %x %e %f" % ("Solaria",36,34.5,16,14,3.1453,1/3)var = 'Hola '*3 + 'Solaria'
```
```
'Hola Solaria, te presento unos ejemplos $ 34 20 e 3.145300e+00 0.333333'
```

#### Variables


Las variables son los elementos que permiten almacenar datos a través de símbolos. Son equiparables a las variables algebráicas, ya que las variables pueden contener valores diferentes en distintos momentos.

Las variables pueden contener datos y para generar una variable es necesario usar **operadores de asignación**. A continuación se muestra como asignar variables numéricas:

```python
#definicion explicita
numero1 = int(2)
numero2 = float(2.5)x <- 1

#definicion implicita
numero3 = 2.3545
numero4 = 1
```

También se pueden asignar en variables cadenas de texto:

```python
texto1="Esto es un texto"
texto2='Esto es otro texto'
texto3="""Holi
caracoli"""

# definicion explicita
texto4=str(54)
```

Así como variables con valores lógicos:

```python
logic1 = True
```

No obstante, una de las definiciones con más potencial en `python` se trata de las funciones nominadas. Una función es un bloque de código con un nombre asociado, que recibe cero o más argumentos como entrada, sigue una secuencia de sentencias, la cuales ejecuta una operación deseada y devuelve un valor y/o realiza una tarea, este bloque puede ser llamados cuando se necesite.

```python
def my_fun():
  print("Hola Solaria")
```
Una vez definida se puede invocar de la siguiente manera:

```python
my_fun()
```
```
Hola Solaria
```

La sintaxis concreta es:

```python
def NOMBRE(PARAMETROS):
    """DOCSTRING_DE_FUNCION"""
    PROCESOS
    RETURN [EXPRESION]
```

En Python todos los objetos cuentan con una variable especial llamada doc gracias a la que podemos describir para qué sirven y cómo se usan los objetos. Estas variables reciben el nombre de docstrings, cadenas de documentación.


[Menú Principal](./)

[Atras](./tiposDatos)

[Siguiente](./estructurasPython)
