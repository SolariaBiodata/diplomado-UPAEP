---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Lenguajes de programación

### Plotly

#### R

img src="https://plotly.com/all_static/images/plotly_graphing_libraries_1.png" width=150 align=right>
<br>
<br><br>

Hacer gráficas es una de las herramientas más poderosas para comunicar características importantes de un análisis de datos. No obstante la visualización de datos va un paso más adelante con la posibilidad de interaccionar directamente con un gráfico para obtener alguna clase de información clave. [Plotly](https://plotly.com/) es un paquete de visualización de datos que permite a `R` generar gráficos interactivos. Este paquete de hecho es una biblioteca multiplataforma (también corre en `python`) y su desarrollo es de libre acceso y distribución. Lo cual provee de una serie de herramientas para obtener ayuda de la comunidad ([foro](https://community.plotly.com/), [página para reportar problemas](https://github.com/ropensci/plotly/issues))

Plotly está construído a partir de `javascript`, un lenguaje de programación ampliamente usado por la comunidad de desarrollo de aplicaciones web. Como resultado de la implementación de `plotly` se pueden obtener gráficos interactivos los cuales se pueden embeber nativamente en aplicaciones web 🌐 (como colab, jupyter, rstudio, spyder, etc).

`plotly` puede ser instalado muy fácilmente ya que se encuentra disponible en el CRAN.

```R
install.packages("plotly")
library(plotly)
```

Plotly sigue una sintáxis muy similar a la que se implementa con otros paquetes de `R`:

```R
fig <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
fig
```




<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="starwars.html" height="525" width="100%"></iframe>

#### Python

[Plotly](https://plotly.com/) es un paquete multiplataforma (también está disponible para `R`) el cual tiene como objetivo implementar diversos métodos de visualización de datos. 

```python
import os
import sys
import numpy as np
import pandas as pd
import plotly.express as px

from urllib.request import urlretrieve
from Bio import SeqIO, SearchIO, Entrez
from Bio.Seq import Seq
from Bio.SeqUtils import GC
from Bio.Blast import NCBIWWW
from Bio.Data import CodonTable
```


Una vez que se ha importado plotly, podemos generar diversos tipos de gráficas:

```python
fig = px.line(y=[7,-4,30],x=["s","b","d"], title="Plotly inicial de Solaria")
print(fig)
```

```
Figure({
    'data': [{'hoverlabel': {'namelength': 0},
              'hovertemplate': 'x=%{x}<br>y=%{y}',
              'legendgroup': '',
              'line': {'color': '#636efa', 'dash': 'solid'},
              'mode': 'lines',
              'name': '',
              'showlegend': False,
              'type': 'scatter',
              'x': array(['s', 'b', 'd'], dtype=object),
              'xaxis': 'x',
              'y': array([ 7, -4, 30]),
              'yaxis': 'y'}],
    'layout': {'legend': {'tracegroupgap': 0},
               'template': '...',
               'title': {'text': 'Plotly inicial de Solaria'},
               'xaxis': {'anchor': 'y', 'domain': [0.0, 1.0], 'title': {'text': 'x'}},
               'yaxis': {'anchor': 'x', 'domain': [0.0, 1.0], 'title': {'text': 'y'}}}
})
```

```python
fig.show
```

<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="starwars.html" height="525" width="100%"></iframe>


**Ejercicio con blast**

Primero se ejecuta un análisis de _BLAST_ con `biopython` y se guarda el resultados:

```python
input_file = "unknown-sequence.fa"
fasta_loc = ("https://raw.githubusercontent.com/chris-rands/"
             "biopython-coronavirus/master/unknown-sequence.fa")

if not os.path.exists(input_file):
    urlretrieve(fasta_loc, input_file)

#Leer el fasta
record = SeqIO.read(input_file, "fasta")

# Correr el blast en NCBI
result_handle = NCBIWWW.qblast("blastn", "nt", record.seq)
## este paso tarda varios minutos

# Leer el resultado de blast en XML
blast_qresult = SearchIO.read(result_handle, "blast-xml")
```

Un primer paso consiste en revisar la distribución de los datos de una variable `evalue`, el cual corresponde al _e value_ del alineamiento entre la secuencia problema con cada secuencia blanco:

```python
xevalue=[]
for i in range(50):
  xevalue.append(blast_qresult.hsps[i].evalue)

fig=px.histogram(x=xevalue)
fig.show()
```


Se hace lo mismo con las longitudes de todos los _hits_:

```python
xlengths=[]
for i in range(50):
  xlengths.append(len(blast_qresult.fragments[i].hit.seq))
fig=px.histogram(x=xlengths)
fig.show()
```

Con dos variables numéricas es viable hacer un diagrama de dispersión (_scatter plot_)

```python
fig=px.scatter(x=xevalue,y=xlengths)
fig.show()
```

Ahora se usa `numpy` y `pandas` para automatizar el análisis y usando otra variable con los `bitscore`:

```python
xbits=[]
for i in range(50):
  xbits.append(blast_qresult.hsps[i].bitscore)


npxlengths=np.array(xlengths)
npxevalues=np.array(xevalue)
npxbits=np.array(xbits) 

blastMetrics=pd.DataFrame(np.hstack((npxbits[:,None],npxevalues[:,None],npxlengths[:,None])),columns=['bitscore','evalue','longitud'])
```

Se genera un _scatter plot_ de 3 dimensiones:

```python
fig=px.scatter_3d(blastMetrics,x='bitscore',y='evalue',z='longitud')
fig.show()
```

Y se puede generar una versión filtrada:


```python
fig=px.scatter_3d(blastMetrics.loc[blastMetrics['bitscore']>1000],x='bitscore',y='evalue',z='longitud')
fig.show()
```







[Menú Principal](./)

[Atras](./estadisticaR)

[Siguiente](./#)
