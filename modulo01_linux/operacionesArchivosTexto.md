---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 3er [Diplomado de Bioinformática](./)

## Introducción a Linux

### Operaciones con archivos de texto

#### Tipos de archivos estándar

En linux sabemos que existen diferentes tipos de ficheros:

 - `-` Archivos estándar
 - `d` Directorios
 - `l` Ligas simbólicas
 - `c` Caracter de dispositivo
 - `b` Bloque de dispositivo
 - `s` Socket local
 - `p` Tubería nombrada

En esta sección nos centraremos especialmente en los archivos comunes o estándar. Este tipo de archivos se tratan de aquellos que pueden ser modificados para contener información que es relevante para los usuarios.

Existe una forma de clasificar los archivos estándar:

 - Archivos binarios
 - Archivos de texto

Esta clasificación es importante porque gracias a ella, sabemos como se puede interaccionar con los archivos. Por ejemplo, en la siguiente imagen se puede apreciar que un mismo archivo puede ser interpretado de diferentes formas:

![BinaryFile](https://drive.google.com/uc?id=1okRj3TmZTUbAjb7shpJJ020EqdJ-CGYM&export=download "Archivos binarios")

En este ejemplo se muestra una imagen, la cual es un archivo binario. Al decir binario nos referimos a que este archivo es una secuencia de *bytes* o agrupaciones estructuradas de `0`'s  y `1`'s. Un programa de gestión de imágenes puede interpretar correctamente esa estructura y desplegar la información relevante para el usuario (la imagen). En cambio, si usamos un interprete de texto, la secuencia de *bytes* puede ser interpretada de manera equivocada.

En escencia, un archivo de texto también es un archivo binario, sin embargo, existen estándares en la forma en la que están estructurados los *bytes* que los componen. Así cada uno de los bytes puede ser interpretado como un caracter en especial y un humano puede interpretar el contenido de manera natural.

Existen algunos archivos que, aunque guardan información en forma de texto, también contienen otros elementos de formato. Estos archivos no deben ser usados como archivos de texto ya que la información enriquecida que contienen, está codificada en estructuras de *bytes* diferentes de las aceptadas en los estándares internacionales de texto.

#### Asignación de permisos

Para asignar los permisos de un archivo utilizamos el comando `chmod`.

```bash
chmod [OPCIONES] [FICHEROS]
```

En la sección de opciones es donde nosotros indicamos la asignación de permisos que deseamos darle a los ficheros:

```bash
chmod +r archivo.txt
chmod -w archivo.txt
chmod -x archivo.txt
```

Ejecutando de este modo el comando `chmod` podemos cambiar los tipos de permisos para todos los usuarios. Sin embargo muy posiblmente queremos asignar específicamente los permisos dependiendo de cada tipo de usuario, para ello necesitamos de la codificación de permisos. Recordemos cómo se codifican los permisos

| | Valor | Propietario | Grupo | Otros |
|--|--|--|--|--|
| **Posición** | | :one: | :two: | :three: |
| **Lectura** | \\[2^2 = 4\\]  | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| **Escritura** | \\[2^1 = 2\\]  | :heavy_check_mark: | :heavy_check_mark: | |
| **Ejecución** | \\[2^0 = 1\\]  | :heavy_check_mark: | | |
|  |  |  \\[4 + 2 + 1\\] | \\[4 + 2 + 0\\] | \\[4 + 0 + 0\\]  |
|  |  |  **7** | **6** | **4** |

Por lo cual los permisos asociados a este fichero se representan con el número `764`. Nosotros podemos usar esta codificación directamente en el comando `chmod`:

```bash
chmod 764 archivo.txt
```


[Menú Principal](./)

[Atras](./comandosTerminal)

[Siguiente](./operacionesAvanzadasArchivos)
