---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](./)

## Bioinformática

### Bases de datos 

En bioinformática es muy importante contar con fuentes de información estándar y confiable debido a que la reproducibilidad de los resultados es un aspecto indispensable en el análisis de datos biológicos. Por ese motivo diversos consorcios han unido esfuerzos para recopilar, almacenar y gestionar la información biológica en diferentes ámbitos. Estos han desarrollado diversos portales que contienen repositorios de información (coloquialmente llamados _bases de datos_).

Las _bases de datos_ requieren una estructura muy particular, misma que se construye en función de la naturaleza misma de la información que contiene. Es muy importante que la información sea de fácil acceso, y que se optimice los métodos de actualización de la misma, asimismo, resulta crucial que exista la menor redundancia posible y que la estructura de los datos sea uniforme.

| Tipo | Base de datos |
|--|--|
| Secuencia| [INSDC](http://www.insdc.org/) |
| Secuencia | [NCBI](https://www.ncbi.nlm.nih.gov) |
| Secuencia | [EMBL](https://www.ebi.ac.uk/services) |
| Secuencia | [DDBJ](https://www.ddbj.nig.ac.jp/index-e.html) |
| RNA | [Rfam](https://rfam.xfam.org/) |
| RNA | [RDP](https://rdp.cme.msu.edu/) |
| RNA | [Silva](https://www.arb-silva.de/) |
| RNA | [miRBase](http://www.mirbase.org/) |
| Proteínas | [PDB](https://www.rcsb.org/) |
| Proteínas | [Uniprot](https://www.uniprot.org/) |
| Proteínas | [Pfam](http://pfam.xfam.org/) |
| Proteínas | [SwissProt](https://www.expasy.org/resources/uniprotkb-swiss-prot) |
| Proteínas | [PIR](https://proteininformationresource.org/) |
| Rutas metabólicas | [KEGG](https://www.genome.jp/kegg/) |
| Rutas metabólicas | [BRENDA](https://www.brenda-enzymes.org/) |
| Ontologías | [GeneOntology](http://geneontology.org/) |
| Genómica humana | [1KG](https://www.internationalgenome.org/home) |
| Genómica humana | [OMIM](https://www.omim.org/) |
| Genómica humana | [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/) |
| Patógenos | [ViPR](https://www.viprbrc.org/brc/home.spg?decorator=vipr) |
| Patógenos | [MBGD](https://mbgd.nibb.ac.jp/) |
| Patógenos | [ViralZone](https://viralzone.expasy.org/) |
| Patógenos | [EnteroBase](https://enterobase.warwick.ac.uk/) |


**[NCBI](https://www.ncbi.nlm.nih.gov/)**

El Centro Nacional para Información Biotecnológica (NCBI por sus siglas en inglés) es el repositorio más conocido a escala mundial. En este repositorio conviven múltiples subrepositorios con diferentes niveles de información y que se describen a continuación


| Repositorio | Descripción |
|--|--|
| [SNP](https://www.ncbi.nlm.nih.gov/snp/) | dbSNP es una base de datos donde se almacena la información de polimorfismos genéticos en diversas especies |
| [PubMed](https://pubmed.ncbi.nlm.nih.gov/) | Pubmed es una base de datos que contiene información de artículos y literatura científica de áreas de la biotecnología |
| [Taxonomy](https://www.ncbi.nlm.nih.gov/taxonomy/) | Esta base de datos contiene clasifiaciones curadas de la nomenclatura de los organismos contenidos en NCBI |
| [Genome](https://www.ncbi.nlm.nih.gov/genome/) | Contiene información de los mapas genómicos, ensambles y genomas anotados |
| [GEO](https://www.ncbi.nlm.nih.gov/gds/) | Gene Expression Omnibus es el repositorio de información donde se almacenan datos de expresión genética |
| [SRA](https://www.ncbi.nlm.nih.gov/sra/) | Sequence Read Archive es el sitio donde se almacenan los datos crudos de corridas de secuenciación masiva desde 2009 |
| [RefSeq](https://www.ncbi.nlm.nih.gov/refseq/) | Genomas de referencia con información altamente curada |
| [GenBank](https://www.ncbi.nlm.nih.gov/genbank/) | Es la colección de todas las secuencias de DNA publicamente disponibles en el NIH |



### Búsqueda de secuencias

Debido a la enorme cantidad de secuencias que actualmente se enecuentran depositadas en las bases de datos, uno de los mayores retos es poder acceder de manera sistemática a la información contenida. Una función indispensable para estas bases de datos consiste en realizar búsquedas de secuencias para encontrar aquellas que compartan ciertas características con algunas secuencias que son de nuestro interés.

Una herramienta que ha sido muy importante para realizar búsquedas en los grandes repositorios de información es [BLAST](https://blast.ncbi.nlm.nih.gov/Blast.cgi). El nombre de este programa se deriva de las siglas en inglés de _Herramienta de Búsqueda Básica por Alineamientos Locales_. Esta herramienta encuentra regiones de similaridad entre secuencias biológicas. Compara secuencias de nucléotidos o proteínas contra bases de datos y calcula la significancia estadística de la coincidencia.

| Herramienta | ¿Qué busca? | ¿En dónde? |
|--|--|
| nblast | Secuencia de nucleótidos | Secuencias de nucleótidos |
| pblast | Secuencia de aminoácidos | Secuencias de aminoácidos |
| blastx | Secuencia de nucleótidos | Secuencias de aminoácidos |
| tblastn | Secuencia de aminoácidos | Secuencias de nucleótidos |
| psi-blast | Secuencia de aminoácidos lejanamente relacionada | Secuencias de aminoácidos |
| delta-blast | Dominios conservados  | Secuencias de aminoácidos |
| phi-blast | Secuencia de nucleótidos o aminoácidos con patrones de expresiones regulares | Secuencias de nucleótidos o aminoácidos |



[Menú Principal](./)

[Atras](./introduccion)

[Siguiente](./#)
