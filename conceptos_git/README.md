* [Ejercicio](#Ejercicio)
* [Preguntas](#Preguntas)
  * [Preguntas](#Preguntas)
    * [Pregunta 0](#Pregunta-0)
        * [Respuesta 0](#Respuesta-0)
    * [Pregunta 1](#Pregunta-1)
    * [Pregunta 2](#Pregunta-2)
    * [Pregunta 3](#Pregunta-3)

### Ejercicio

Vamos a describir el estado de un repositorio de git de forma simplificada, tiene 2 partes importantes:

* el árbol de commits, que es lo que guarda [la base de datos de snapshots de git](https://git-scm.com/book/en/v2/Getting-Started-What-is-Git%3F) En el diagrama, cada commit apunta a su(s) padre(s).
* la tabla de [branches](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell), que dice qué branches tenemos y a qué commits apuntan

En un repositorio local, además tenemos:
* el *current branch*, el branch en el cual estamos trabajando en este momento
* el staging area
* el working directory

Hemos empezado a trabajar en un proyecto de git y está en este estado (seguimos la notación de git indicando el current branch con un asterisco). El working tree y el staging area están sin cambios.

![ejercicio_git](media/ejercicio_git.svg)


### Preguntas:

**Todas las preguntas empiezan con el estado inicial descrito arriba**, no son cambios cumulativos.

Los diagramas son svg así que se pueden editar fácilmente con [inkscape](https://inkscape.org/); hacer un diagrama a mano y subir una foto también es una opción.

#### Pregunta 0

(Ejemplo) Supongamos que hacemos unos cambios y ejecutamos `git commit -m "Better idea"`:

Cambia el diagrama para representar el nuevo estado del repositorio.

##### Respuesta 0

NB: hay que inventarse la fecha y el hash:

![ejercicio_git_ejemplo](media/ejercicio_git_ejemplo.svg)

#### Pregunta 1

Supongamos que tenemos otra idea, así que hacemos otro branch en este punto y cambiamos a este branch:
```
git branch another-idea
git checkout another-idea
```

Cambia el diagrama para representar el nuevo estado del repositorio: tanto el grafo de commits como la tabla de branches pueden cambiar.


##### Respuesta 1

Si realizamos un `git branch [new-branch-name]` y posteriormente  `[git checkout another-idea]` el árbol de commits no cambia.
Creamos una nueva rama (another idea). Cambiamos la rama activa a la nueva rama ( e.j. en este caso `another-idea` y desde este 
momento todo los commits que se realicen serán añadidos a la nueva rama ya que modificamos la dirección el puntero HEAD  a `another-idea`

Podemos observar el valor de **HEAD** con el comando `git show head`. Otra forma de entender el funcionamiento del puntero HEAD es que cuando realizamos un commit el puntero avanza a la siguiente posición en el commit tree.

#### Pregunta 2

Supongamos que hemos decidido integrar los cambios de la rama `idea` a `master`, así que cambiamos de rama y ejecutamos un merge:

```
git checkout master
git merge idea
```

Cambia el diagrama para representar el nuevo estado del repositorio: tanto el grafo de commits como la tabla de branches pueden cambiar.

#### Solución 2

Si realizamos un `checkout master `  cambiamos de rama a `master` con el mecanismo explicado en la
solución anterior (Puntero HEAD) posteriormente ejecutamos el comando `git merge idea` en el que fusionamos estas dos ramas. 
En el caso de que las ramas no hayan divergido, es decir, que exista un proceso lineal de extremo a extremo, se podría realizar un avance 
rápida como mecanismo de fusión de estos repositorios. Caso contrario, se realiza un **3-way merge** en el que anexa un nuevo nodo integrando estos cambios.

En el caso de existir conflictos, git nos lo hará saber a través de un <font color='red'>MERGE CONFLICT</font> . 

Existen varias **alternativas** para solucionar este problema podemos desde realizar cambios puntuales en uno ( o varios) de los archivos 'conflictivos'
o ejectutar `git mergetool` para visualizar estos conflictos de una forma más sencilla.



#### Pregunta 3

Nos hemos bebido un par de botellas de vino y ejecutamos

```
git reset --hard master
```
#### Solución 3

Al ejecutar un git reset con la opción `---hard`. 
Hacemos un  reset del puntero `HEAD` , el índice y el árbol de trabajo.

Otras posibles opciones de reset son:

1. `--mixed`, HEAD e índice
1. `--soft`, únicamente el HEAD
1. `--keep`, HEAD pero mantiene cambios locales 



Cambia el diagrama para representar el nuevo estado del repositorio: tanto el grafo de commits como la tabla de branches pueden cambiar.

Marta was here4
Jon Ander was here2
