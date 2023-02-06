---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 3er[Diplomado de Bioinformática](./)

## Introducción a Linux

### Búsqueda de patrones

Una de las tareas que es común en diferentes problemas de bioinformática recae en la búsqueda de información en archivos de gran tamaño. Hasta este punto se han visto diferentes estrategias para slecciar de información basándose en los resultados de inspecciones primarias. No obstante en muchos casos podemos partir de cierto conocimiento previo, ya sea de algún patrón esperado o bien de alguna clase de información contextual. En este tema se revisarán las herramientas más poderosas de Linux que nos ayudan en estos casos.

#### grep

Algunos archivos de texto pueden contener mucha información, es posible que en algunos casos solo una parte de esa información es valiosa para procesarse de acuerdo a nuestras necesidades. El comando `grep` nos ayuda a buscar la información más relevante, esto se hace mediante una búsqueda de coincidencias de texto. Este comando permite buscar en uno o más archivos un objetivo o _patrón_, cada línea de un archivo de texto puede (o no) contener dicho _patrón_, cuando existe una coincidencia, se imprime la línea del texto en la cual se halló la coincidencia.

> El origen del nombre de este comando son las iniciales de **g**lobal **r**egular **e**xpression and **p**rint

Debido a su funcionalidad, el comando `grep` es un gran apoyo para buscar patrones en archivos de bioinformática. Una gran cantidad de veces es la herramienta predilecta para buscar coincidencias de una cadena esperada de texto dentro de los archivos de Linux. Por ello es útil conocer la sintáxis básica del comando:

```bash
grep [OPCIONES] PATRON [ARCHIVO(S)]
```

Como se puede apreciar, existen 4 elementos básicos en la invocación de este comando:

  1. El comando `grep`
  2. Las opciones o modificadores del comando
  3. La _cadena_ de texto o _patrón_ que se desea buscar
  4. La entrada de texto, suelen ser el o los archivos donde se desea buscar el _patrón_

Las opciones del comando `grep` son muy variadas, lo cual nos da una gran ventaja y le dan una gran versatilidad al comando. Antes de revisar las opciones completas conviene revisar características importantes del _patrón_. Típicamente los _patrones_ se delimitan por el caracter `"` cuando se invoca desde la consola de comandos. Los _patrones_ de texto que se pueden buscar siguen la convención de las [expresiones regulares](./filtrosAvanzados#sed). No obstante puede modificarse la interpretación de los mismos de acuerdo con los siguientes _modificadores_:

| Modificador | Interpretación del _patrón_ |
|--|--|
| `-E` | Como una expresión regular **e**xtendida |
| `-F` | Como una _cadena_ de caracteres fija, no como expresión regular |
| `-G` | Como una expresión regular básica (por defecto se usa está interpretación) |
| `-P` | Como una expresión regular compatible con `Perl` (experimental) |

Cabe mencionar que la principal diferencia entre `-E` y `-G` recae en el uso de escape para ciertos caracteres. Por lo general con la opción por defecto, es necesario escapar algunos caracteres de control en la expresión regular (por ejemplo `|`, `{`, `}`). Por otro lado, las expresiones regulares surgieron en el lenguaje de programación `Perl`, desde su adopción diferentes lenguajes de programación han ocurrido algunos cambios para estandarizar el modo en el que se implementan en las tan diferentes sintáxis de dichos lenguajes, lo cual dio lugar en principio a la interpretación básica y luego a la extendida. No obstante, la interpretación extendida es similar a la interpretación de `Perl`, por lo que es muy importante no confundir ambas interpretaciones, ya que pueden ocurrir diferencias muy sutiles que solo un experto podría diferenciar.

Por otro lado, existen algunos modificadores que sirven para indicar explícitamente el tipo de _patrón_ que se desea ingresar al comando:

| Modificador | Descripción |
|--|--|
| `-e` | Usa el siguiente argumento como _patrón_, se puede usar múltiples veces en una misma invocación, en ese caso `grep` devolverá un resultado cada vez que alguno de los _patrones_ sea encontrado. |
| `-f` | Usa el siguiente argumento como la ruta de un archivo que contiene uno o más _patrones_, devolverá un resultado cada vez que alguno de los _patrones_ sea encontrado. |

***

`grep` como muchos comandos en Linux, posee una buena cantidad de _modificadores_ que le aportan gran versatilidad al comando:

| Modificador | Tipo | Descripción |
|--|--|--|
| `-v` | Control de coincidencia | Ivierte la condición de resultado, solo selecciona líneas que **NO** coincidan con el _patrón_ suministrado. |
| `-i` | Control de coincidencia | Ignora la diferencia entre mayúsculas y minúsculas cuando busca el _patrón_ en el texto. |
| `-w` | Control de coincidencia | Selecciona solo aquellas líneas en las que el _patrón_ coincide con palabras completas, es decir, el _patrón_ no es una subcadena de otra palabra. Las _cadenas_ que son consideradas como palabras son aquellas que se delimitan por caracteres no alfanuméricos y `_`. |
| `-x` | Control de coincidencia | Selecciona aquellas líneas que coinciden perfectamente con el _patrón_. |
| `-c` | Control de salida | Suprime la salida normal, imprime el conteo de las líneas que coincidieron con el _patrón_. |
| `-m` | Control de salida | Detiene la búsqueda cuando se alcanza el número indicado a continuación de coincidencias. |
| `-n` | Control de los prefijos de salida | Agrega como prefijo el número de la línea en el texto que coincide con el _patrón_. |
| `-H` | Control de los prefijos de salida | Imprime el nombre del archivo con el texto que coincide con el _patrón_. Es la opción por defecto cuando se utilizan múltiples archivos de entrada. |
| `-h` | Control de los prefijos de salida | **NO** imprime el nombre del archivo con el texto que coincide con el _patrón_. Es la opción por defecto cuando se utiliza solo un archivo de entrada. |
| `-A` | Control de contexto | En la salida imprime tantas líneas como se especifica a continuación que siguen despues de la línea en la que se halla coincidencia con el _patrón_. (**A**fter match). |
| `-B` | Control de contexto | En la salida imprime tantas líneas como se especifica a continuación que preceden a la línea en la que se halla coincidencia con el _patrón_. (**B**efore match). |
| `-C` | Control de contexto | En la salida imprime tantas líneas como se especifica a continuación que preceden y siguen después de la línea en la que se halla coincidencia con el _patrón_. (**C**ontext match). |
| `-r` | Control de archivos | Se busca el _patrón_ de manera recursiva en todos los archivos de un directorio. |

A continuación se plantean ejemplos de uso, para el desarrollo de estos ejemplos se asume la creación de un archivo `texto.txt` con el siguiente contenido:

```
This is a line
This is also a Line
I will Also type this
I will display this
final line
```

Si se desea buscar las líneas que coincidan con  `display`:

```bash
grep "display" texto.txt
```

```
I will display this
```

Si se dese buscar el complemento:

```bash
grep -v "display" texto.txt
```

```
This is a line
This is also a Line
I will Also type this
final line
```

***

Si se desea buscar una _cadena_ sin importar la aparición de mayúsculas o minúsculas:

```bash
grep -i "also" texto.txt
```

```
This is also a Line
I will Also type this
```

***

Si se desean buscar varias _cadenas_:

```bash
grep -i -e "also" -e "display" texto.txt
```

```
This is also a Line
I will Also type this
I will display this
```

***

Para realizar el conteo de coincidencias:

```bash
grep -c "will" texto.txt
```

```
2
```

***

Buscar líneas que comiencen con un _patrón_ específico:


```bash
grep ^I texto.txt
```

```
I will Also type this
I will display this
```

o terminen con un _patrón_:


```bash
grep -i line$ texto.txt
```

```
This is a line
This is also a Line
```

***

Búsqueda de cadenas completas:

```bash
grep -iw line texto.txt
```

```
This is a line
This is also a Line
final line
```

***

Búsqueda contextual:

```bash
grep -A 1 "display" texto.txt
```

```
I will display this
final line
```

```bash
grep -B 1 "display" texto.txt
```

```
I will Also type this
I will display this
```


```bash
grep -C 1 "display" texto.txt
```

```
I will Also type this
I will display this
final line
```

***

Para encontrar las líneas de una arhivo que coinciden:


```bash
grep -n 1 "display" texto.txt
```

```
4:I will display this
```


#### awk

`awk` es un comando que invoca un poderoso interprete del lenguaje de programación homónimo. Este lenguaje de programación es muy versátil y permite a los usuarios de Linux trabajar con archivos de texto. `awk` se desarrolló desde las primeras arquitecturas de Unix, principalmente por el estilo de reportes tabulares que se han hecho para monitoreo del sistema operativo. `awk` es prácticamente un lenguaje de programación completo, y en la actualidad puede ser invocado desde algunas versiones más actuales como `gawk` o `nawk`.

> Erroneamente se cree que el nombre de AWK proviene del prefijo de la palabra _awkward_, sin embargo su origen coincide con las iniciales de sus creadores: A. **A**ho, P. **W**einberger y B. W. **K**ernigham

La estructura básica de un programa de `awk` tiene la siguiente forma:

```awk
patron { accion }
```
donde, `patron` especifíca en qué condición se ejecuta la `accion`. Como la mayoría de las herramientas de Linux, `awk` está pensado para operar sobre líneas de un archivo, es decir, cuando se suministra un archivo cono entrada, cada instrucción se ejecuta para dicha línea de información. Si la condición se satisface, entonces la acción definida es ejecutada. El `patron` por defecto se satisface con cualquier línea. Asimismo existen otros patrones importantes invocados con las palabras `BEGIN` y `END`, por lo que un ejemplo muy sencillo de un _script_ de ejecución de `awk` sería el siguiente:

```awk
BEGIN { print "INICIANDO"}
      { print }
END   { print "TERMINADO"}
```

La condición `BEGIN` siempre se satisface justo antes de empezar a leer la primera línea. En cambio, la condición `END` se ejecuta al finalizar de leer la última línea de la entrada.

Es muy importante mencionar que cuando invocamos al comando `awk` desde la consola de comandos, muchas veces queremos hacerlo mediante una sola línea de ejecución. Por ello es conveniente establecer una forma de concentrar la información de múltiples líneas de instrucciones, para ello se utiliza el caracter `;` como representación de un salto de línea en el _script_ de `awk` así por ejemplo, la forma de invocar el _script_ de `awk` que vimos con anterioridad sigue esta estructura:

```bash
awk 'BEGIN { print "INICIANDO" };{ print };END { print "TERMINADO" }' <(echo "contenido")
```

En la invocación de `awk` existen 4 elementos principales:

  1. Comando `awk`.
  2. Modificadores (en el ejemplo no se nota ninguno).
  3. Argumento que resulta ser un _Script_ de `awk` (contiene las instrucciones en lenguaje `awk`).
  4. Argumento que contiene una entrada (suele ser un archivo de texto, en este ejemplo redireccionamos un `echo "contenido"`).

esta invocación genera una salida en `stdout` así:

```
INICIANDO
contenido
TERMINADO
```

**Sintáxis de AWK**

Como `awk` es un lenguaje de programación existen algunos elementos muy importantes a tener en consideración cuando escribimos instrucciones de dicho lenguaje. Lo primero a mencionar es que en este lenguaje podemos contener dos tipos de elementos con los cuales operar: `cadenas` (de caracteres) o `números`. El interprete de `awk` determinará automáticamente cuando un elemento se trate de un tipo u otro, sin embargo los usuarios pueden modificar la asignación automática de tipos por al usar `"` para delimitar un valor. Por ejemplo `"123"` es una cadena con los caracteres `"1"`, `"2"` y `"3"`, sin embargo `123` representa al número $$123$$.

Como en otros lenguajes de programación en `awk` existen _variables_ que son formas de representar elementos que contienen un valor, (y ese valor puede cambiar). La forma de asignar un valor en una _variable_ sigue la siguiente sintáxis:

```awk
var=3
```
Donde `var` representa a una variable, a la cual se le asigna (mediante el _operador_ `=`) el valor `3`. Como se puede observar, existe un elemento que nos permite relacionar un valor y una variable, a esos elementos que operan relacionando elementos se les conoce como _operadores_.

Existen diferentes tipos de _operadores_ en este lenguaje de programación, comencemos con los _operadores_ de _expresiones_ aritméticas. A continuación se presentan _operadores_ binarios, es decir que operan con dos _variables_:

| Operador | Tipo | Significado | Ejemplo | Resultado |
|--|--|--|--|--|
| `+` | Aritmético | Adición | `7+3` | `10` |
| `-` | Aritmético | Sustracción | `7-3` | `4` |
| `*` | Aritmético | Multiplicación | `7*3` | `21` |
| `/` | Aritmético | División | `7/3` | `2.3333` |
| `%` | Aritmético | Módulo | `7%3` | `1` |
| `' '` \<espacio\> | Cadena | Concatenación | `7 3` | `73` |

Cabe destacar que existen algunos operadores que operan con una sola _variable_, para ello asumamamos que `x` tiene el valor de $$3$$:

| Operador | Tipo | Significado | Ejemplo | Resultado |
|--|--|--|--|--|
| `+` | Aritmético | Multiplicación por `1` | `print +x` | `3` |
| `-` | Aritmético | Multiplicación por `-1` | `print -x` | `-3` |
| `++` | Aritmético | Autoincremento del valor (`x+1`) | `x++` | `4` |
| `--` | Aritmético | Autodecremento del valor (`x-1`) | `x--` | `2` |

Otros _operadores_ muy importantes son los de asignación, en estos casos, una _variable_ se relaciona con una _expresión_ mediante un _operador_ en la forma `variable operador expresión`:

| Operador | Significado |
|--|--|
| `=` | Asignación |
| `+=` | Adiciona resultado a la variable |
| `-=` | Sustrae resultado de la variable |
| `*=` | Multiplica la variable por el resultado |
| `/=` | Divide la variable entre el resultado |
| `%=` | Aplica módulo a la variable |

Asimismo existen _operadores_ condicionales, con los cuales se comparan dos _valores_ o _variables_, como resultado se generan valores _verdadero_ o _falso_, los cuales se representan con `1` y `0`, respectivamente:

| Operador | Significado |
|--|--|
| `==` | ¿Es igual a? |
| `!=` | ¿No es igual a? |
| `>` | ¿Es mayor que? |
| `>=` | ¿Es mayor o igual que? |
| `<` | ¿Es menor que? |
| `<=` | ¿Es menor o igual que? |

En `awk` existen otros _operadores_ condicionales que relacionan _cadenas_, estos operadores son una de las herramientas más poderosas de este lenguaje de programación, ya que relacionan valores de manera muy conveniente:

| Operador | Significado |
|--|--|
| `~ ` | ¿Coincide con/en? |
| `!~` | ¿No coincide con/en? |

Estos operadores permiten comparar _cadenas_ de caracteres utilizando [expresiones regulares](./filtrosAvanzados#sed). Sin embargo, en `awk`, la _expresión_ debe delimitarse con el caracter `/`:

```awk
var ~ /cadena/
```
Finalmente se encuentran los _operadores_ booleanos, es decir los que operan con los resultados de las _expresiones_ condicionales:

| Operador | Función Booleana | Significado | Ejemplo | Resultado |
|--|--|--|--|--|
| `&&` | _AND_ | Ambos valores deben ser `verdadero` para que el resultado sea `verdadero` | `1 && 0` | `0` |
| `||` | _OR_ | Al menos un valor debe ser `verdadero` para que el resultado sea `verdadero` | `1 || 0` | `1` |
| `!` | _NOT_ | Cambia un valor por el valor complementario | `!0` | `1` |

**Variables especiales**

Como `awk` está orientado a procesar texto que ingresa a través de un argumento en la invocación, existen algunas variables que comunican la información contenida en la entrada al _script_. La variable `$0` es la variable que contiene en cada momento el contenido de texto de cada línea que se lee de un archivo. Sin embargo, la versatilidad de `awk` se debe a que de manera automática se generan variables posicionales (`$1`, `$2`, `$3`, ...) las cuales contienen información de columnas o campos en una línea. Es decir, la variable `$1` contiene la información del primer campo, la variable `$2` la del segundo campo, y así sucesivamente. Asi mismo, (imaginemos que una línea contiene cuatro campos), las siguientes expresiones generarán el mismo resultado:

```awk
print $0
print $1, $2, $3, $4
```
Este lenguaje es muy conveniente porque permite modificar el contenido de algunas columnas, pero también porque permite alterar el orden de impresión de las mismas, lo cual resulta muy conveniente ya que se puede formatear texto de manera muy precisa.

***

Otra variable muy importante de este lenguaje es `FS`, esta variable representa el caracter usado como separador de campos en la entrada de texto. Por defecto la variable `FS` contiene espaciadores en blanco (tabuladores o espacios). Sin embargo, existen muchos archivos que usan otros delimitadores como `;`, `,`, `:`, `|`, etc. Por esa razón es muy importante mencionar como indicarle a `awk` cuál es el separador de campos más apropiado para el texto a procesar. Para ello existen dos formas, la primera consiste en realizar la invocación con el modificador `-F`:

```bash
awk -F ";" '{ print $2 }' <(echo "contenido;dos")
```
La segunda forma de asignar el valor de `FS` consiste en hacerlo en el bloque incial `BEGIN`:

```bash
awk 'BEGIN{ FS=";" };{ print $2 }' <(echo "contenido;dos")
```

***

Así como `FS` está determinado por defecto a caracteres de espacio en blanco, otra _variable_ también está asignada de esa manera: `OFS`. Con esa _variable_ se indica el separador de campos cuando los resultados se envían a `stdout`. A veces parte del formateo que podemos hacer con `awk` depende de asignar separadores específicos de campo, por lo cual es indispensable mostrar el método para modificar el valor asignado en dicha variable. La forma estándar para realizar la asignación de `OFS` es muy similar a la segunda forma de asignar `FS`:

```bash
awk 'BEGIN{ OFS=";" };{ print $0 }' <(echo "contenido dos") # Asignando solo OFS
awk 'BEGIN{ FS=";"; OFS="\t" };{ print $0 }' <(echo "contenido;dos") # Asignando FS y OFS al mismo tiempo
```

***

Otra _variable_ útil es `NF` ya que con ella podemos conocer la cantidad de campos en una línea determinada. Esto es muy útil cuando, por alguna razón, un archivo de texto contiene diferente cantidad de campos, y queremos ejecutar instrucciones diferentes basándose en la cantidad de campos de cada línea. Por otro lado `$NF` contiene el valor del último campo de la línea respectiva.

```bash
awk 'NF > 2{print}' ejemplo.vcf
```

***

La _variable_ `NR` representa el número de registros (o líneas) que tiene un archivo. Esta variable es muy útil cuando queremos ejecutar instrucciones específicas basándonos en el número de línea. Un caso de uso muy claro, es cuando se tiene un archivo con encabezados que contienen comentarios que siguen la estructura general de una tabla:


```bash
awk 'NR%3 == 0 { print }' ejemplo.vcf
```

**Pasando valores de variables**

Es muy importante la funcionalidad para compartir valores de una variable entre el `shell` y `awk`. En seguida se muestra la forma de realizar un pase de valores entre variables:

```bash
let x=5
awk -v var=$x 'BEGIN { FS=";"}; $1~/G/ { var+=$2 }; END { print var }' <(echo "TCA;2")
```

Como se puede notar, para hacer el pase de variables se utiliza el modificador `-v` y enseguida se integra el pase del valor de la variable de shell `$x` en la variable de awk `var`.


[Menú Principal](./)

[Atras](./filtrosAvanzados)

[Siguiente](#)
