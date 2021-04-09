![alt text](https://solariabiodata.com.mx/images/solaria_banner.png "Soluciones de Siguiente Generación")
# 1er [Diplomado de Bioinformática y Docking](../)

## Introducción a Linux

### Comandos de la terminal

#### man

`man` es un comando que invoca manuales de uso de otros comandos al ser pasados como argumento de este comando. La sintaxis de uso es:

```bash
man <comando>
```

Donde _\<comando\>_ se refiere a cualquier otro comando, del cual quieras conocer el manual de uso.

#### date

El comando `date` te permite acceder a la información de la fecha y hora actuales en el sistema operativo. En otras palabras, este comando de usa como un reloj. La sintáxis de este comando es la siguiente:

```bash
date [OPCION] [+FORMATO]
```
 
 El ejemplo más simple de uso es:
 
 ```bash
date
```

lo cual generará una salida como la siguiente:

```output
Fri Apr  2 10:35:46 CST 2021
```


#### uname

Este comando se usa para obtener información relevante del sistema que tenemos en nuestra computadora. Concretamente nos da información acerca de la arquitectura del procesador y la versión del kernel que usa nuestro sistema operativo. 

```bash
uname -a
```

La salida de este comando se parece a este resultado:

```output
Linux hydra 4.19.0-8-amd64 #1 SMP Debian 4.19.98-1 (2020-01-26) x86_64 GNU/Linux
```

Esta salida contiene la siguiente información:

 - `Linux` Nombre del kernel.
 - `hydra` Nombre del anfitrión (_Hostname_)
 - `4.19.0-8-amd64` Nombre de la liberación del kernel
 - `#1 SMP Debian 4.19.98-1 (2020-01-26)` Versión del kernel
 - `x86_64` Arquitectura del hardware (_del procesador_)
 -  `GNU/Linux` Nombre del sistema operativo


#### who

`who` es un comando que te permite conocer los usuarios que actualmente están conectados al sistema operativo.

```bash
who
```

La salida de este comando se parece a este resultado:

```output
root     pts/0        2021-03-26 10:20 (:0)
solaria  pts/1        2021-04-02 11:01 (::1)
```

Cada línea contiene cuatro campos separados por espacios:
 
 - El nombre del usuario
 - El identificador de la terminal que usa el usuario
 - El momento en el que el usuario se conectó
 - El nombre del anfitrión o dirección IP desde la cual el usuario se conectó



[Menu principal](../) 
[Atras](./sistemaArchivos)
[Siguiente](./operacionesArchivosTexto)
