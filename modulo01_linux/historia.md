---
usemathjax: true
---
![alt text](https://solariabiodata.com.mx/wp-content/uploads/2021/07/logo_red.png "Soluciones de Siguiente Generación")
# 3er [Diplomado de Bioinformática](./)

## Introducción a Linux

### Breviario Histórico

#### MULTICS

Antes del Proyecto MULTICS, los sistemas operativos no estaban diseñados para soportar múltiples usuarios y procesos en tiempo compartido. En su lugar, las computadoras se programaban manualmente para realizar tareas específicas y se ejecutaban en un modo de procesamiento por lotes. Esto significaba que un usuario presentaba un conjunto de trabajos o tareas a la computadora y luego esperaba a que se completaran antes de recibir los resultados.

Este enfoque de procesamiento por lotes fue adecuado para muchas aplicaciones empresariales de la época, como el procesamiento de nóminas y la contabilidad, pero no era adecuado para la informática científica, que requería una interacción más frecuente y rápida con la computadora.

A medida que las computadoras se volvieron más rápidas y sofisticadas, se hizo evidente la necesidad de sistemas operativos que pudieran soportar múltiples usuarios y procesos en tiempo compartido. Esto permitiría a muchos usuarios trabajar simultáneamente en la misma computadora y acceder a los recursos de manera eficiente y equitativa.

El Proyecto MULTICS, abreviatura de Multiplexed Information and Computing Service, fue un proyecto colaborativo de investigación y desarrollo que se llevó a cabo en los años 60 y principios de los 70. Fue uno de los primeros sistemas operativos que se diseñaron para manejar múltiples usuarios y procesos en tiempo compartido. 

El proyecto MULTICS fue una colaboración entre el MIT (Instituto Tecnológico de Massachusetts), Bell Labs y General Electric. El objetivo principal era desarrollar un sistema operativo para un nuevo tipo de computadora, el GE-645, que estaba siendo desarrollado por GE.

El sistema operativo MULTICS se diseñó para ser un sistema operativo interactivo y multitarea en tiempo compartido que permitiría a muchos usuarios acceder a una sola computadora al mismo tiempo. MULTICS fue el primer sistema operativo diseñado específicamente para soportar el procesamiento de tiempo compartido y proporcionar a los usuarios una interfaz interactiva para interactuar con la computadora. El proyecto se centró en la creación de un sistema operativo que fuera escalable, seguro y fácil de usar, y que pudiera satisfacer las necesidades de una amplia variedad de usuarios.

MULTICS se diseñó con una arquitectura avanzada, con un kernel centralizado y una serie de módulos independientes que proporcionaban servicios específicos. Estos módulos incluían un sistema de archivos jerárquico, un sistema de protección de recursos, un sistema de gestión de procesos y un sistema de comunicación interprocesos.

El proyecto MULTICS tuvo un impacto significativo en el desarrollo de sistemas operativos modernos. Sus ideas y conceptos influyeron en la creación de muchos sistemas operativos posteriores, incluyendo Unix, que se desarrolló en el MIT después de que el proyecto MULTICS se cancelara en 1969.

A pesar de su importancia histórica, el proyecto MULTICS tuvo dificultades y no se completó según lo previsto. El proyecto sufrió retrasos y aumentos de costos significativos, y el sistema operativo final resultó ser demasiado complejo y difícil de usar. Además, el mercado de computadoras se estaba moviendo hacia una arquitectura más descentralizada, con computadoras más pequeñas y menos costosas, lo que hizo que el modelo centralizado de MULTICS fuera menos relevante.

A pesar de estos problemas, el proyecto MULTICS proporcionó una base sólida para el desarrollo de sistemas operativos posteriores, y su legado se puede ver en muchos de los sistemas operativos modernos que usamos hoy en día.


#### UNIX

Dado que el objetivo del proyecto MULTICS era crear un sistema operativo interactivo y escalable que pudiera utilizarse en una amplia variedad de computadoras. Sin embargo, el proyecto se retrasó y se volvió cada vez más costoso, lo que llevó a GE a retirarse en 1969.

En ese momento, un grupo de programadores en Bell Labs liderados por Ken Thompson y Dennis Ritchie comenzaron a trabajar en un nuevo sistema operativo llamado UNIX. UNIX fue inspirado por las ideas del Proyecto MULTICS, pero fue diseñado para ser más simple, más portátil y más fácil de usar. Los programadores de UNIX utilizaron el lenguaje de programación C para escribir el sistema operativo, lo que lo hizo fácil de portar a diferentes plataformas de hardware.

Mientras tanto, el Proyecto MULTICS continuó con la participación del MIT y Bell Labs, y finalmente produjo un sistema operativo en 1973. Sin embargo, el sistema operativo resultante era muy complejo y costoso, lo que limitó su adopción.

UNIX, por otro lado, comenzó a ganar popularidad y fue ampliamente utilizado en la década de 1980, especialmente en las universidades y en la industria de la informática. Sin embargo, algunos en el equipo MULTICS criticaron a UNIX por ser demasiado simple y por carecer de ciertas características de seguridad y escalabilidad que se habían diseñado en el Proyecto MULTICS.

A pesar de estos desacuerdos, UNIX y MULTICS se desarrollaron en paralelo durante muchos años y ambos contribuyeron significativamente al desarrollo de los sistemas operativos modernos. Hoy en día, el legado de ambos proyectos se puede ver en sistemas operativos como Linux, macOS y Windows, que han sido influenciados por las ideas y los avances desarrollados por MULTICS y UNIX.

UNIX fue uno de los primeros sistemas operativos diseñados para ser portátil entre diferentes tipos de hardware de computadora. Esto significa que el mismo sistema operativo podría ejecutarse en diferentes plataformas de hardware sin necesidad de reescribir todo el software del sistema operativo.

UNIX fue un sistema operativo revolucionario para su época porque introdujo muchos conceptos nuevos que hoy en día son comunes en los sistemas operativos modernos. Uno de los conceptos más importantes introducidos por UNIX fue la idea de un sistema operativo modular que se divide en pequeñas partes independientes que se pueden combinar para crear un sistema operativo personalizado. Este enfoque modular permitió a los programadores crear sistemas operativos a medida para satisfacer las necesidades específicas de sus aplicaciones.

Otro concepto importante introducido por UNIX fue la interfaz de línea de comandos, que permitía a los usuarios interactuar con el sistema operativo mediante la entrada de comandos en un terminal en lugar de utilizar una interfaz de usuario gráfica. Esto permitió a los usuarios realizar tareas complejas de manera rápida y eficiente, lo que era especialmente importante en los sistemas informáticos de la época que tenían capacidades limitadas.

A medida que UNIX se desarrolló y se extendió, se crearon varias variantes de UNIX, cada una de las cuales se adaptó a diferentes necesidades y requisitos de los usuarios. Una de las variantes más conocidas es Linux, que se desarrolló como una versión de UNIX de código abierto.

Hoy en día, UNIX todavía se utiliza en una amplia variedad de sistemas informáticos, incluidos los servidores de redes, las supercomputadoras y las estaciones de trabajo de ingeniería. Aunque ha evolucionado mucho desde su creación original, UNIX sigue siendo una de las bases fundamentales de la informática moderna y ha sido una gran influencia en el desarrollo de muchos otros sistemas operativos.

#### POSIX

A medida que muchos proyectos fueron liderados por distintos equipos de trabajo, se tuvo la necesidad de crear una vía de comunicación que fuera compatible entre todos los sistemas operativos que se basaran en UNIX. 

POSIX es un conjunto de estándares creados para garantizar la compatibilidad entre diferentes sistemas operativos UNIX y sistemas similares. POSIX significa es un acrónimo que significa "Portable Operating System Interface", que en español significa "Interfaz de Sistema Operativo Portátil". Este término se refiere a un conjunto de estándares desarrollados para garantizar la compatibilidad entre diferentes sistemas operativos UNIX y sistemas similares. Estos estándares definen una interfaz estandarizada entre el software de aplicación y el sistema operativo subyacente, lo que permite que el software de aplicación se ejecute en diferentes sistemas operativos UNIX sin necesidad de cambios significativos en el código.

El objetivo de POSIX es crear una interfaz estandarizada entre el software de aplicación y el sistema operativo subyacente, lo que permite que el software de aplicación se ejecute en diferentes sistemas operativos UNIX sin necesidad de cambios significativos en el código. POSIX define una serie de estándares para el lenguaje de programación C, el shell de comandos, la biblioteca de funciones, la interfaz de usuario y otros componentes de los sistemas operativos.

Los estándares POSIX fueron desarrollados en respuesta a la creciente necesidad de una interoperabilidad mejorada entre sistemas operativos UNIX de diferentes proveedores. Antes de la introducción de POSIX, cada proveedor de sistemas operativos UNIX tenía su propia implementación, lo que hacía difícil la portabilidad del software de aplicación entre diferentes sistemas.

La adopción de los estándares POSIX ha permitido que los sistemas operativos UNIX de diferentes proveedores sean compatibles entre sí y con otros sistemas operativos similares. Además, los estándares POSIX han sido adoptados por muchos otros sistemas operativos, incluyendo Linux y macOS.

Hoy en día, POSIX sigue siendo una especificación importante para la interoperabilidad entre sistemas operativos, y es ampliamente utilizado por los desarrolladores de software que desean crear aplicaciones portátiles y compatibles con múltiples sistemas operativos.


#### GNU/Linux

La historia de GNU/Linux se remonta a finales de la década de 1970, cuando el programador y activista Richard Stallman comenzó a trabajar en el Proyecto GNU, una iniciativa para crear un sistema operativo completo de software libre y de código abierto. Stallman estaba preocupado por la creciente dependencia de las empresas de software propietario y quería crear un sistema operativo que permitiera a los usuarios tener control total sobre sus computadoras.

El Proyecto GNU comenzó con la creación de una serie de herramientas de software libre, incluido el compilador GCC (GNU Compiler Collection) y el editor de texto Emacs. Estas herramientas fueron ampliamente adoptadas por la comunidad de desarrolladores de software, lo que ayudó a fomentar la creación de un ecosistema de software libre y de código abierto.

El primer sistema operativo GNU fue concretado en 1983 Richard Stallman. Originalmente, el sistema operativo se desarrolló con la intención de incluir un núcleo (kernel) llamado Hurd, pero este núcleo todavía no está listo para su uso generalizado, y muchos usuarios de GNU intentaron usar opciones para suplir esta carencia temporal, incluso agregar componentes del kernel original de UNIX (que irónicamente, rompía con la filosofia de software libre del mismo proyecto GNU).

Por lo tanto y a pesar del éxito inicial del Proyecto GNU, había un componente clave que faltaba: un núcleo de sistema operativo. En 1991, el estudiante finlandés de informática Linus Torvalds comenzó a trabajar en un núcleo de sistema operativo como proyecto de pasatiempo. Este núcleo, que eventualmente se convertiría en el núcleo Linux, se basaba en gran medida en las ideas y tecnologías del Proyecto GNU.

A medida que Linux ganaba popularidad entre la comunidad de desarrolladores de software, la comunidad comenzó a usar el núcleo Linux junto con las herramientas de software libre del Proyecto GNU para crear sistemas operativos completos basados en GNU/Linux. Estos sistemas operativos incluyen Debian, Red Hat, Ubuntu y muchas otras distribuciones populares de GNU/Linux.

A medida que la popularidad de GNU/Linux crecía, las empresas comenzaron a adoptar GNU/Linux en sus servidores y estaciones de trabajo. La naturaleza de software libre y de código abierto de GNU/Linux permitió que las empresas personalizaran el sistema operativo para satisfacer sus necesidades específicas, lo que lo hizo atractivo para una amplia gama de empresas y organizaciones.

Hoy en día, GNU/Linux es uno de los sistemas operativos más populares del mundo, utilizado en todo, desde servidores web hasta sistemas embebidos en dispositivos móviles. La comunidad de desarrollo de software libre y de código abierto que respalda a GNU/Linux sigue siendo vibrante y activa, con miles de desarrolladores en todo el mundo contribuyendo al proyecto.

En términos de funcionalidad, GNU proporciona un conjunto completo de herramientas y utilidades del sistema que incluyen editores de texto, compiladores de programas, bibliotecas, herramientas de depuración, etc. Estas herramientas están diseñadas para ser portátiles y funcionar en diferentes sistemas operativos, lo que permite que se utilicen en sistemas operativos distintos de Linux.

En resumen, la historia de GNU/Linux es una historia de colaboración y comunidad. El Proyecto GNU y el núcleo Linux, creados por personas diferentes en diferentes momentos, se unieron para crear uno de los sistemas operativos más importantes y versátiles del mundo. La naturaleza de software libre y de código abierto de GNU/Linux ha permitido que la comunidad de desarrollo se expanda y evolucione con el tiempo, lo que ha llevado a una amplia adopción en todo el mundo.

#### Núcleo Hurd

Sin embargo, GNU puede ejecutarse sin Linux y hay algunas variantes de GNU que utilizan otros núcleos. Por ejemplo, la distribución de sistema operativo Debian GNU/kFreeBSD utiliza el núcleo FreeBSD en lugar de Linux, y la distribución de sistema operativo GNU GuixSD utiliza el núcleo de GNU Hurd.

El núcleo Hurd de GNU es una implementación de un núcleo de sistema operativo completamente nuevo y ha sido diseñado desde cero para ser distribuido como software libre. A diferencia de otros núcleos de sistema operativo, el núcleo Hurd no es un monolito, sino que está formado por varios servidores que se comunican entre sí mediante un protocolo específico. Este diseño proporciona una mayor flexibilidad y seguridad en comparación con los núcleos monolíticos tradicionales.

El conjunto de utilidades del sistema de GNU incluye un amplio conjunto de herramientas de línea de comandos y programas gráficos que proporcionan una funcionalidad similar a la que se encuentra en otros sistemas operativos, como Linux o macOS. Estas herramientas son compatibles con POSIX y están diseñadas para ser portátiles y funcionar en diferentes sistemas operativos.

El entorno de escritorio GNOME es un conjunto de aplicaciones y herramientas gráficas que proporcionan una experiencia de usuario más amigable y consistente en GNU. GNOME incluye un administrador de ventanas, un explorador de archivos, un cliente de correo electrónico, un reproductor multimedia, un navegador web y muchas otras aplicaciones.

En general, GNU se basa en la filosofía del software libre, lo que significa que su código fuente es libremente disponible para que cualquiera lo use, modifique y distribuya. Esta filosofía también se extiende a su licencia, la Licencia Pública General de GNU (GPL), que requiere que cualquier trabajo derivado de GNU se distribuya bajo los mismos términos de la GPL.

#### Resúmen

Los puntos principales de GNU/Linux son:

- Es un sistema operativo libre y de código abierto: Esto significa que el código fuente del sistema operativo está disponible para que cualquiera lo use, modifique y distribuya, lo que fomenta la colaboración y la innovación.

- El núcleo del sistema operativo es Linux: Linux es un núcleo de sistema operativo gratuito y de código abierto que se utiliza como parte del sistema operativo GNU/Linux. El núcleo de Linux proporciona una interfaz entre el hardware y el software del sistema operativo.

- Es altamente personalizable: Como es un sistema operativo de código abierto, los usuarios pueden personalizar el sistema operativo según sus necesidades y preferencias. Esto se logra mediante la instalación y configuración de diferentes programas y utilidades.

- Gran variedad de aplicaciones: Existe una gran cantidad de aplicaciones disponibles para GNU/Linux, muchas de ellas gratuitas y de código abierto. Estas aplicaciones incluyen navegadores web, clientes de correo electrónico, editores de texto, suites de oficina, herramientas de desarrollo de software, reproductores multimedia y mucho más.

- Es seguro: En general, GNU/Linux es considerado más seguro que otros sistemas operativos debido a su diseño seguro y a la capacidad de los usuarios para personalizar la seguridad del sistema operativo.

- Es estable y escalable: GNU/Linux es conocido por su estabilidad y escalabilidad, lo que lo hace ideal para su uso en servidores y sistemas empresariales.

- Es compatible con una amplia variedad de hardware: GNU/Linux es compatible con una amplia variedad de hardware, lo que lo hace ideal para su uso en dispositivos de escritorio y móviles, servidores, sistemas embebidos y más.

En resumen, GNU/Linux es un sistema operativo libre, altamente personalizable, seguro, estable y escalable, compatible con una amplia variedad de hardware y con una gran cantidad de aplicaciones disponibles.

[Menú Principal](./)

[Atras](#)

[Siguiente](./sistemaArchivos)
