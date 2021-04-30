---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Lenguajes de programación

### Tipos de datos básicos

En los lenguajes de programación uno de los principales elementos con los que se cuenta son los datos. Los datos son todos los elementos de información que pueden estar almacenados en variables, estas variables son los medios que tienen los lenguajes de programación para almacenar información que puede cambiar a lo largo del tiempo. Otros medios para almacenar información son las constantes, mismas que contienen solo un valor el cual es inmutable.

Los datos pueden estar constituídos de diversas maneras, es decir, existen diversos tipos de ellos cada uno de los cuales tienen ciertas propiedades o características.

#### Numéricos

El primer tipo de datos es el tipo numérico. Este, como su nombre lo indica, nos permite representar el concepto de los números. Asi bien, este tipo de datos generalmente tiene otras divisiones, las cuales se deben a las distintas clase de números que existen en las matemáticas.


| Tipo matemático | Descripción | Python | R |
|--|--|--|--|
| $$\mathbb{Z}$$ | Los _enteros_ son todos los números que se pueden representar sin un componente fraccional $$\{-\infty,\dots,-3,-2,-1,0,1,2,3,\dots,\infty\}$$ | `int`, `long` | `integer` |  
| $$\mathbb{R}$$ | Los _flotantes_ (números de punto flotante) son las aproximaciones que se usan en computación paara representar números reales $$\{-\infty,\dots,\infty\}$$ | `float`  | `double` |  
| $$\mathbb{C}$$ | Los _complejos_ son números que tienen un componente real y un componente imaginario de la forma $$a+b\dot\imath$$ donde $$a$$ y $$b$$ son numeros reales, en cambio $$\dot\imath$$ representa al número imaginario que satisface la ecuación $$\dot\imath^{2} = -1$$ | `complex` | `complex` |  
  
Cabe destacar que las representaciones numéricas en computación tienen una precisión buena, más no perfecta, esto se debe a que en la computadora los números solo pueden representarse en base 2, por lo que se pierde precisión debido a ello.

#### Cadenas de caracteres

Otro tipo de datos habitual en programación son las cadenas de caracteres o texto. Cabe mencionar que para ello es conveniente pensar que cada unidad de información corresponde a un símbolo el cual representa un caracter o letra. Entonces por ejemplo, para representar una letra `s` es necesario un caracter el cual en computación puede ser codificado por una serie de bits (usualmente un _byte_ cuando se usan codificaciones de 8 bits). Cuando se concatenan múltiples caracteres se obtiene una cadena de caracteres, este arreglo de información (`s` `o` `l` `a` `r` `i` `a`) puede representar una palabra `"solaria"`. Es importante mencionar que en muchos lenguajes de programación, se suele representar una cadena de caracteres cuando se delimitan por una pareja de `"`.

| Python | R |
|--|--|
| `str` | `character` |

#### Valores lógicos

Los valores lógicos representan los valores más sencillos de operar en _algebra booleana_: $$0$$ y $$1$$. En computación esto es muy relevante ya que las computadoras pueden representar estos valores mediante estados binarios de voltaje _apagado_ ⚫ y _encendido_ ⚪ en los componentes electrónicos. El algebra boolana tiene una serie de propiedades que en computación son muy útiles ya que se pueden representar compuertas lógicas _AND_ (conjunción), _OR_ (disyunción) y _NOT_ (negación). Estas funciones son representadas en computación por operadores que relacionan valores `falso` y `verdadero`.

| Booleano | Python | R |
|--|--|--|
| $$0$$ | `False` | `FALSE`, `F` |
| $$1$$ | `True` | `TRUE`, `T` |


[Menú Principal](./)

[Atras](./introduccion)

[Siguiente](#)
