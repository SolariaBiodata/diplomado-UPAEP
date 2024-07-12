# filter()
La función filter() se utiliza para filtrar filas de un data frame según condiciones lógicas. La sintaxis básica de esta función es la siguiente: 
~~~
filtered_data <- filter(data, condition1, condition2, ...)
~~~
En donde *data* es el frame que se desea filtrar, mientras que condition1 y condition2 son las condiciones lógicas que las filas deben cumplir para ser incluidas en el resultado que será almacenado en la variable *filtered_data*.
## Instalar y cargar paquetería dyplr
 Antes de utilizar filter(), se necesita asegurar que el paquete dplyr esté instalado y cargado en el entorno de trabajo.
 ~~~
 install.packages("dplyr")
 ~~~
 ~~~
 library(dplyr)
 ~~~
 ## Operadores usados en condiciones 
| Operador  | Descripción                                     |
|-----------|-------------------------------------------------|
| `==`      | Igual a                                         |
| `!=`      | Diferente de                                    |
| `>`       | Mayor que                                       |
| `<`       | Menor que                                       |
| `>=`      | Mayor o igual que                               |
| `<=`      | Menor o igual que                               |
| `%in%`    | En un conjunto                                  |
| `&`       | Y lógico (AND)                                  |
| `\|`      | O lógico (OR)                                   |
| `is.na()` | Es NA (valor perdido)                           |
| `!is.na()`| No es NA (no es un valor perdido)               |
| `!`       | Negación lógica                                 |
| `any()`   | Al menos uno verdadero                          |
| `all()`   | Todos verdaderos                                |

## Ejemplo 1: Filtrando Datos de Experimentos de Cultivo Celular
Supongamos que tenemos un data frame con datos de experimentos de cultivo celular. Los datos incluyen la línea celular, la concentración de un compuesto, la viabilidad celular y la fecha del experimento.

Creamos el data frame:
~~~
experimentos <- data.frame(
  linea_celular = c("HeLa", "A549", "HeLa", "MCF7", "A549", "MCF7"),
  concentracion = c(10, 15, 20, 10, 15, 20),
  viabilidad = c(90, 85, 80, 75, 70, 65),
  fecha = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05", "2023-01-06"))
)

print(experimentos)
~~~
Ahora filtraremos los experimentos de la línea celular "HeLa" con viabilidad mayor al 80%. 
~~~
experimentos_filtrados <- filter(experimentos, linea_celular == "HeLa", viabilidad > 80)
print(experimentos_filtrados)
~~~
Obteniendo como resultado: 
~~~
linea_celular concentracion viabilidad      fecha
         HeLa            10         90 2023-01-01
~~~

## Ejemplo 2: Filtrando Datos de Ensayos de PCR
Supongamos que tenemos un data frame con datos de ensayos de PCR, que incluyen el gen objetivo, el umbral de ciclo (Ct) y el tipo de muestra.

Creamos el data frame: 
~~~
pcr_ensayos <- data.frame(
  gen_objetivo = c("GAPDH", "ACTB", "GAPDH", "ACTB", "GAPDH", "ACTB"),
  Ct = c(23.5, 24.0, 22.8, 23.2, 25.1, 24.5),
  tipo_muestra = c("control", "tratado", "control", "tratado", "control", "tratado")
)

print(pcr_ensayos)
~~~
Ahora filtramos los ensayos del Gen "GAPDH" con Ct Menor a 24.
~~~
pcr_filtrados <- filter(pcr_ensayos, gen_objetivo == "GAPDH", Ct < 24)
print(pcr_filtrados)
~~~
Obteniendo como resultado:
~~~
gen_objetivo   Ct tipo_muestra
       GAPDH 23.5      control
       GAPDH 22.8      control
~~~
## Ejemplo 3: Filtrando Datos de Secuenciación Genómica
Supongamos que tenemos un data frame con datos de secuenciación genómica, que incluyen el ID de la muestra, el número de lecturas y la tasa de error.
Creamos el data frame.
~~~
secuenciacion <- data.frame(
  id_muestra = c("M1", "M2", "M3", "M4", "M5"),
  lecturas = c(1000000, 1500000, 2000000, 2500000, 3000000),
  tasa_error = c(0.01, 0.02, 0.015, 0.03, 0.025)
)

print(secuenciacion)
~~~
Filtramos muestras con más de 1,500,000 lecturas y una tasa de error menor a 0.02.
~~~
secuenciacion_filtrada <- filter(secuenciacion, lecturas > 1500000, tasa_error < 0.02)
print(secuenciacion_filtrada)
~~~
Obteniendo como resultado:
~~~
id_muestra lecturas tasa_error
        M3    2e+06      0.015
~~~

## Ejercicio 4: Filtrando datos de valoraciones nutricionales
Instala y carga el paquete *readr* para leer archivos de texto, además del paquete dpyr. 
~~~
install.packages("readr")
library(readr)
install.packages("dplyr")
library(dplyr)
~~~
Asegurarse de tener el archivo de texto guardado en el directorio de trabajo en RStudio. Luego, se lee el archivo en un data frame usando la función *read.table*.
~~~
data <- read.table("ruta/a/tu/archivo.txt", header = TRUE)
~~~
Revisar los primeros registros del data frame para asegurarse de que los datos se hayan leído correctamente.
~~~
head(data)
~~~
Utilizar la función subset para filtrar las filas donde la columna *AGE* sea menor a 30 años. Con ello podremos visualizar todos los datos de personas menores a 30 años.
~~~
filtered_data <- subset(data, AGE < 30)
~~~
Revisa los primeros registros del data frame filtrado para asegurarte de que el filtrado se ha realizado correctamente.
~~~
head(filtered_data)
~~~

Recursos: 

https://warwick.ac.uk/fac/sci/moac/people/students/peter_cock/r/geo/

https://rsanchezs.gitbooks.io/rprogramming/content/chapter9/filter.html



