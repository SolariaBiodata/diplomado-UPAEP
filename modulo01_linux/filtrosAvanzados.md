---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 3er [Diplomado de Bioinformática](./)

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
 - `\\` backslash, contrabarra, \\ 
 - `\b` backspace
 - `\n` línea nueva
 - `\r` retorno de carro
 - `\t` tabulador horizontal
 - `\a` una campana audible 🔔 🔊

Así mismo, los conjuntos se pueden expresar de la siguiente manera:

 - **CARACTER_1-CARACTER_2** simboliza todos los caracteres que existen entre **CARACTER_1** y **CARACTER_2** en orden ascendente. Por ejemplo `a-c` simboliza (`a`, `b`, `c`).
 - **CARACTER\*REPS** simboliza el **CARACTER** repetido **REPS** veces.

Por otro lado, es viable utilizar expresiones de corchetes. Para ello se describen en la siguiente tabla algunos conjuntos importantes.


| Expresión | Significado |
|--|--|
| `[:alnum:]` | Todos los caracteres alfanuméricos, sería lo mismo que `[0-9A-Za-z]` |
| `[:alpha:]` | Todas las letras, sería lo mismo que `[A-Za-z]` |
| `[:digit:]` | Todos los dígitos, sería lo mismo que `[0-9]` |
| `[:blank:]` | Todos los caracteres que representan espacios en blanco, por ejemplo `' '`, `\t`  |
| `[:graph:]` | Todos los caracteres imprimibles, excepto el espacio en blanco |
| `[:print:]` | Todos los caracteres imprimibles |
| `[:punct:]` | Todos los caracteres de puntuación |
| `[:space:]` | Todos los caracteres de espaciamiento, tanto horizontales como verticales |
| `[:lower:]` | Todas las letras minúsculas, sería lo mismo que `[a-z]` |
| `[:upper:]` | Todas las letras mayúsculas, sería lo mismo que `[A-Z]` |

Algunos ejemplos de uso serían:

```bash
cat archivo.txt | tr -s " " # Para eliminar espacios duplicados
cat archivo.txt | tr -d "|" # Para eliminar todos los pipes
cat archivo.txt | tr [:lower:] [:upper:]  # Para cambiar todas las letras a mayúsculas
cat secuencia.fasta | tr "ATCG" "UAGC" # Para obtener el transcrito de una secuencia de DNA
```

#### sed

El comando `sed` es un comando que invoca por si mismo a un lenguaje de expresiones para procesar texto. Es un editor **no interactivo** de texto.

```bash
sed [OPCIONES] [EXPRESION] [ARCHIVO]
```

Las opciones más usuales son

| Modificador | Descripción |
|--|--|
| `-e` | Ejecutar la siguiente expresión en el texto |
| `-f` | Ejecutar las expresiones contenidas en un archivo, se usa pasando la ruta hacia un archivo de texto : `sed -f /ruta/de/script.txt archivo.txt` en este ejemplo `/ruta/de/script.txt` es un archivo con una serie de expresiones para ser ejecutadas |
| `-i` | Ejecuta la expresión y sobreescribe el archivo de entrada (_in place_), si se agrega un sufijo lo escribe en un archivo que contiene en su nombre dicho sufijo |
| `-E`, `-r` | Usa las expresiones regulares extendidas |

Si no se usan los modificadores `-e` o `-f`, el primer argumento (que no sea una opción) es tomado como la expresión para el procesamiento.

El comando `sed` puede ser visto como un **mini lenguaje de programación**. Esto se debe a que las expresiones para procesar texto pueden ser acomodadas de tal forma que se logren diferentes resultados dependiendo de la estructura de las expresiones mismas.

Las expresiones de este comando por si mismas tienen una sintaxis:

```
sed '[direccion] instruccion argumentos'
```

En este caso `[direccion]` es opcional, hace referencia al número de línea (*N*) o rango de número de líneas (_N,M_).

Para las instrucciones conviene ver la siguiente tabla:

| Instrucción | Significado |
|--|--|
| `i` | Insertar línea antes de la actual |
| `a` | Insertar línea después de la actual |
| `c` | Cambiar línea actual |
| `d` | Borrar línea actual |
| `p` | Imprimir en `stdout` la línea actual |
| `s` | Sustituir cadena en la línea actual |
| `r fichero` | Añade el contenido de `fichero` en la línea actual |
| `w fichero` | Escribe la salida en `fichero` |
| `!` | Aplica la instrucción a las líneas no seleccionadas por la condición |
| `q` | Finalizar procesamiento de texto |

Los procesamientos de texto que permite `sed` son muy amplios, a continuación se mencionan ejemplos de casos de uso.

**Eliminación de líneas**

Una funcionalidad importante de `sed` es la capacidad que ofrece para eliminar líneas en archivos de texto

```bash
sed '2 d' archivo.txt 
```

En este caso el comando avanza a la linea `2` y ejecuta la instrucción `d`, por lo tanto elimina la segunda línea del archivo. Esta operación también se puede realizar por rangos:

```bash
sed '3,7 d' archivo.txt
```

**Sustitución de cadenas**

Posiblemente la función más importante del comando `sed` es la sustitución de texto, es decir, hacer una edición para sustituir una cadena de caracteres por otra cadena de nuestro interés. Para mostra esta función definamos un `archivo.txt` con este contenido:

```
hola
buenas
tardes
```

Una opción sería ejecutar la siguiente instrucción:

```bash
cat archivo.txt | sed 's/tardes/noches/'
```

Lo cual genera una salida en `stdout` como esta:

```
hola
buenas
noches
```

Algo muy importante a notar es la notación de la instrucción `s/tardes/noches/`, la cual sigue la sintaxis de [expresiones regulares](https://regexr.com/). En esta instrucción se usa el caracter `/` para delimitar 4 secciones importantes:

 1. La instrucción, en este caso `s` denota la **s**ustitución de cadenas.
 2. La cadena `tardes` es la cadena a buscar en el texto, y es la que será sustituída.
 3. La cadena `noches` es la cadena que se usará para sustituír en la salida.
 4. En la última sección se agregan condicionantes y modificadores, en este caso no hay ninguno.

Para profundizar en el funcionamiento del comando `sed` es necesario crear un archivo `texto.txt` con el siguiente contenido:

```
10 tiny toes
5 funny two
One two three
tree twice
```

Al ejecutar el comando

```bash
sed 's/t/T/' texto.txt
```

el resultado sería algo como esto:

```
10 Tiny toes
5 funny Two
One Two three
Tree twice
```

Como se puede notar el comando se ejecuta cuando encuentra la primer coincidencia por cada línea. La última sección en la expresión regular sirve para modificar ese comportamiento. Por ejemplo, al agregar `g` el modificador de ejecución **g**lobal de este modo:

```bash
sed 's/t/T/g' texto.txt
```

la salida en `stdout` será:

```
10 Tiny Toes
5 funny Two
One Two Three
Tree Twice
```

Usando el modificador `I` de **I**nsensibilidad a mayúsculas o minúsculas, en combinación con `g`:

```bash
sed 's/o/a/Ig' texto.txt
```

la salida en `stdout` será:

```
10 tiny taes
5 funny twa
ane twa three
tree twice
```

Existen _metacaracteres_ que pueden ser usados en las cadenas para específicar patrones específicos:

| Metacaracteres | Significado |
|--|--|
| `^` | Coincide con la posición inicial en la línea |
| `.` | Coincide con cualquier único caracter, excepto el caracter de nueva línea |
| `[ ]` | Una expresión de corchetes, coincidencia de un solo caracter con alguno de un grupo de caracteres delimitado entre corchetes |
| `[^ ]` | Una expresión de corchetes, coincidencia de un solo caracter con alguno de los caracteres complementarios a un grupo de caracteres delimitado entre corchetes |
| `$` | Coincide con la posición final en la línea |
| `\( \)` | Define una subexpresión |
| `\n` | Marca la `n`-sima subexpresión, `n` solo puede ir de `1` a `9` |
| `*` | Coincide la expresión anterior 0 o más veces, por ejemplo `ab*c` coincide con `"ac"`, `"abc"`, `"abbbc"`, etc |
| `\{m,n\}` | Coincide la expresión anterior almenos `m` veces y cuando máximo `n` veces |

Usando algunos ejemplos:

```bash
sed 's/^t/oooo/g' texto.txt
```

```
10 tiny toes
5 funny two
One two three
ooooree twice
```
***
```bash
sed 's/e$/oooo/g' texto.txt
```

```
10 tiny toes
5 funny two
One two threoooo
tree twicoooo
```
***
```bash
sed 's/[0-9]/*/g' texto.txt
```

```
** tiny toes
* funny two
One two three
tree twice
```
***
```bash
sed 's/[0-9]/*/g' texto.txt
```

```
** tiny toes
* funny two
One two three
tree twice
```
***
```bash
sed 's/[a-z]/*/g' texto.txt
```

```
10 **** ****
5 ***** ***
O** *** *****
**** *****
```


**Sustitución de delimitadores**

Una de las más grandes ventajas de `sed` es que en expresiones regulares implementadas en cualquier lenguaje de programación el caracter `/` es la forma absoluta para delimitar las secciones de la expresión regular. Por lo que, al querer realizar expresiones con cadenas que incluyen el caracter `/` (ampliamente usado para representar rutas en el sistema de archivo linux) es necesario escapar el caracter mediante `\/`. En `sed` se puede sustituír por cualquier caracter no incluído en las cadenas:

```bash
pwd | sed 's_/_\\_g'
```
es equivalente a:

```bash
pwd | sed 's/\//\\/g'
```

en ambos casos, se pretende sustituír el caracter de contención de directorios `/` por `\`, sin embargo es mucho más fácil de interpretar e implementar el primero.



**Ejecución múltiple**

Al trabajar con archivos de texto es viable tener que realizar múltiples sustituciones en un texto. Con `sed` se pueden usar múltiples instrucciones, ya sea mediante un script alojado en un archivo con cada instrucción en diferentes líneas, o bien escribiendo múltiples instrucciones separadas por un `;` como se muestra a continuación

```bash
sed '4 s/twice/None/g;3 s/three/Two/g' texto.txt
```

En este caso se interpreta como, ejecuta la primera instrucción en la línea `4`, la cual es sustituye la cadena `twice` por la cadena `None` de manera global; luego ejecuta la segunda instrucción en la línea `3`, la cual es sustituir  la cadena `three` por la cadena `Two` de manera global. Por lo que el resultado en `stdout` es:

```
10 tiny toes
5 funny two
One two Two
tree None
```


[Menú Principal](./)

[Atras](./operacionesAvanzadasArchivos)

[Siguiente](./busquedaPatrones)
