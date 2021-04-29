---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Lenguajes de programación

### Introducción a R y Python

Los lenguajes de programación son lenguajes formales con gramáticas bien definidas. En estos lenguajes la comunicación de mensajes se da de un usuario a una computadora, por lo cual es importante que nunca exista ambigüedad en los lenguajes.

R y Python han sido usados por muchos grupos en los últimos años. En bioinformática y en análisis de datos son los lenguajes predominantes.

| Python | R |
|--|--|
| ![alt text](https://anthoncode.com/wp-content/uploads/2019/01/python-logo-png.png "Python") | ![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/160px-R_logo.svg.png "R") |
| Es más fácil de aprender para los programadores | Es más sencillo de aprender para los usuarios con experiencia en estadística o matematicas |
| Lenguaje de propósito general | Lenguaje de dominio específico de análisis estadistico |
| Mantenido por la comunidad de desarrolladores e ingenieros de software | Las actualizaciones son frecuentes por parte de la comunidad académica |


#### R

`R` es un lenguaje de programación que evolucionó del lenguaje `S`. Actualmente se distribuye de manera oficial por la mayoría de distribuciones GNU/Linux, por lo que solo se requiere invocar al comando `R` desde la terminal para iniciar el interprete del lenguaje. Para MAC y Windows el interprete del lenguaje puede ser instalado de manera manual siguiento las instrucciones del [sitio oficial de R](https://cran.r-project.org/).

Este lenguaje puede ser interpretado en un modo interactivo, para ello se requiere de la invocación estándar:

```bash
R
```

no obstante, existe una forma de ejecutar programas en modo no interactivo, para ello se utiliza:

```bash
Rscript programa.R
```

Asimismo, existe una interfaz muy común para usar R en un ambiente de análisis más cómodo, esta interfaz se conoce como **RStudio**. Esta interfaz permite interaccionar con el lenguaje de una manera más gráfica, por lo que es una opción muy popular para ejecutar `R`. Este programa no es una distribución oficial del lenguaje, no obstante se reconoce su importancia por lo cual es una interfaz recomendable para el análisis de datos. Antes de usar la interfaz es necesario obtener los instaladores correspondientes en la [página oficial](https://www.rstudio.com/) y proceder con la instalación.

#### Python

Es un lenguaje de programación que ha ganado muchos adeptos en los últimos años. Actualmente se distribuye de manera oficial por la mayoría de distribuciones GNU/Linux, por lo que solo se requiere invocar al comando `python` desde la terminal para iniciar el interprete del lenguaje. Sin embargo es muy importante destacar que existen 2 versiones predominantes que son distintas y que actualmente se siguen manteniendo: _Python 2_ (en su versión 2.7) y _Python 3_ la cual es la distribución más habitual hoy en día. Es necesario hacer instalaciones del interprete cuando se trabaja en MAC o Windows, para ello se sugiere revisar los protocolos de instalación referenciados en la [página oficial](https://www.python.org/).

Este lenguaje puede ser interpretado en un modo interactivo, para ello se requiere de la invocación estándar:

```bash
python
```

no obstante, existe una forma de ejecutar programas en modo no interactivo, para ello se utiliza:

```bash
python programa.py
```

Existen muchos recursos para habilitar interfaces gráficas de despliegue de análisis en Python, a continuación se mencionan algunos de los recursos más importantes:

 - [Conda](https://docs.conda.io/en/latest/#)
 - [Jupyter](https://jupyter.org/install)
 - [Spyder](https://www.spyder-ide.org/)


#### Google Colab

[Colab](https://colab.research.google.com/) es una implementación de los notebooks de _Jupyter_ en la nube cómputo de Google. Esta es una herramienta muy útil, ya que nos permite utilizar `python` y `R` de manera sencilla sin siquiera instalar los intérpretes en nuestras máquinas locales.

En colab existen dos tipos de celdas

  1. Celdas de **código** las cuales permiten la ejecución de instrucciones en el lenguaje deseado (`R` o `python`, sólo uno).
  2. Celdas de **texto** con las cuales podemos agregar más información no ejecutable, la cual nos permite agregar texto enriquecido con el lenguaje _markdown_.

Las celdas de texto permiten incluso incluír fórmulas escritas en lenguaje $$LaTeX$$:

```latex
$$y=\frac{1}{\sigma\sqrt{2\pi}}e^{-\frac{1}{2}{\frac{x-\mu}{\sigma}}^2}$$
```

lo cual genera una fórmula así:

$$y=\frac{1}{\sigma\sqrt{2\pi}}e^{-\frac{1}{2}{\frac{x-\mu}{\sigma}}^2}$$


A continuación se describen algunos ejemplos de texto enriquecido con [_Markdown_](https://www.markdownguide.org/basic-syntax/)

| Ejemplo | Salida |
|--|--|
| `**negritas**` | **negritas** |
| `_cursivas_` | _cursivas_ |
| `~~tachado~~` | ~~tachado~~ |
| `# Título` | # Título |
| \``codigo`\` | `codigo` |


[Menú Principal](./)

[Atras](#)

[Siguiente](./tiposDatos)
