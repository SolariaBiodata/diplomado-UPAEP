# Manual de comandos

Este repositorio tiene como propósito proveer una guía de facil acceso para los participantes del diplomado de bioinformática. La guía puede ser consultada a través de la [página](https://solariabiodata.github.io/diplomado-UPAEP/) construída por este repositorio.


## Despliegue en GitHub Pages

Para crear un acceso eficaz a la guía, se implementó un despliegue de GitHub Pages el cual se explica a continuación.

El despliegue se ha automatizado para seguir los cambios de una rama en específico (`gh-pages`). Es decir, para _renderear_ o _construir_ la página principal con los cambios deseados, es necesario agregar dichos cambios en la rama `gh-pages`. Para esto hay algunos caminos que se podrían seguir:

### 1. Generar una nueva rama a partir de `gh-pages`

**_(estrategia sugerida)_** 
 
Una vez que se desea contribuir con el repositorio es necesario asegurarse de tener la versión más actualizada del repositorio:

 ```bash
 git checkout gh-pages
 git pull
 ```

A partir de este punto es necesario crear una nueva rama, tratando de seguir las [convenciones de nombrado](https://www.conventionalcommits.org/en/v1.0.0/). P.E. si deseas agregar una nueva sección completa utiliza el tipo `feat` (de feature _característica nueva en inglés_), si se trata de una corrección utiliza `fix`, o si deseas agregar documentación (del uso del repositorio) utiliza `docs`. En este ejemplo asumiremos que quieres crear una nueva sección en el módulo de linux de comandos de navegación, entonces un nombre adecuado sería `feat/Agregar-comandos-navegacion-en-linux`. Para crear la rama se usará:

```bash
git checkout -b feat/Agregar-comandos-navegacion-en-linux 
```

Una vez ajustada la rama nueva de contribución se pueden agregar todos los cambios necesarios, tratando nuevamente de usar las [convenciones de nombrado de commits](https://www.conventionalcommits.org/en/v1.0.0/).

```bash
git add -A
git commit -m "fix(linux): Solventando typos en el comando less"
```

Cuando los cambios deseen sincronizarse con el repositorio central es necesario definir el `origen`, para ello es necesario ejecutar solo una vez el siguiente bloque con al menos un commit listo para empujarse al repositorio central:

```bash
git push -u origin feat/Agregar-comandos-navegacion-en-linux
```

Una vez definido el origen, cualquier otro cambio puede enviarse a la rama utilizando un `push` normal, i.e.:

```bash
git add -A
git commit -m "chore: Ejemplo de uso"
git push
```

Cuando estés satisfecho con los cambios planteados tienes que hacer un _Pull Request_ intentando agregar tus cambios a la rama `gh-pages`. Una vez más usa las convenciones para nombrar tu _Pull Request_ i.e: `feat(linux): Agregando comandos de navegación`. Un atajo para crear un _Pull Request_ a la rama `gh-pages` es seguir el siguiente [link](https://github.com/SolariaBiodata/diplomado-UPAEP/compare/gh-pages...). No obstante puedes hacerlo directamente al modificar este url agregando el nombre de tu rama al final `https://github.com/SolariaBiodata/diplomado-UPAEP/compare/gh-pages...<tu-rama>` sustituyendo `<tu-rama>` por el nombre de tu rama, en el ejemplo sería `feat/Agregar-comandos-navegacion-en-linux`.

Una vez que el _Pull Request_ sea satisfactoriamente agregado o _mergeado_ con la rama `gh-pages`, el proceso de construcción de la página se disparará automáticamente.

Si el proceso concluye exitosamente una :heavy_check_mark: se agrega al final del último commit en la página principal de `gh-pages`. Una vez que ocurre esto puedes revisar los cambios en la página rendereada.

