# La inmutabilidad
Otro de los principios de la programación funcional es aquel de la "inmutabilidad" de los objetos utilizados en un programa y por objeto entiéndase cualquier cosa que se pueda referenciar con una variable.
Así que ¿qué es un objeto inmutable? Pues es un objeto que no es "mutable". Esto es:

> Un objeto es mutable si se le permite cambiar de valor tantas veces como sea necesario.

Y consecuentemente:

> Un objeto es inmutable cuando no se le permite cambiar su valor inicial.

Así que a un objeto (variable) inmutable se le asigna un valor inicial y listo, nunca más le cambiamos este valor.

- Usando Python como referencia podemos tomar lo siguientes extractos de código.

```py
sum=0
data=[10,20,30,40,50]
ready=False
count=0
while not ready:
    if count>=5:
        ready=True
    else:
        sum+=data[count]
        count+=1
```

Con este extracto de código en Python no es dificil ver que:
- Se está calculando la sumatoria de la lista de datos.
- Se utilizan tres variables mutables:
  - `ready` para controlar el ciclo while
  - `sum` para acumular la sumatoriade los elementos en la lista data
  - `count` para iterar los elementos de la lista de datos

Este pequeño programa no es funcional simplemente por su uso de las variables mutables. Y es que a la programacióon funcional no le gustan las variables mutables. Y existe una reazón para ello:

> Las variables mutables son las culpables de que un programa produzca resultados inesperados, o de que un programa no funcione en general.

Pero ¿acaso se puede hacer algo serio sin variables mutables? la respuesta es afirmativa, y para eso está la programación funcional. Pero esto implica cambios en nuestros paradigmas. Por ejemplo:

Nunca reescribimos el valor de una variable, en todo caso:
1. Utilicemos nuevas variable spara que contengan el valor alterado de otra variable anterior:
  - En lugar de `count += 1`
  - Haremos `count2 = count + 1`

2. Pero ¿qué onda con los procesos repetitivos? O sea ¿qué onda con los ciclos? Esto ocurre así:
> En la programación funcional cualquier proceso repetitivo se lleva a cabo con recursividad, nunca con ciclos.

Que quede claro a la programación funcional no le ayudan los costos por lo siguiente:

* Se controlan con una variable mutable.
* Y normalmente se usan para procesar objetos mutables.
* Así que een resumen, nada de ciclos en la programación funcional.
  
## Funciones recursivas en lugar de ciclos
Todo proceso repetitivo es uno que ocurre de la siguiente manera:
1. Tiene un caso inicial en donde se establece las "condiciones iniciales".
2. Tiene un caso final que impone el caso final o "condición de parar".
3. Y finalmente tiene el "proceso recurrente" que es lo que habrá de ocurrir en cada iteración.


```py
# Initial case
sum=0
data=[10,20,30,40,50]
ready=False
count=0

while not ready:
    # Stop condition
    if count>=5:
        ready=True
    
    # Recurrent process
    else:
        sum+=data[count]
        count+=1
```
Pues este mismo procedimiento puede ocurrir usando una función recursiva. Pero primero ¿Qué es una función recursiva?

Resulta que:
> Una función recursiva es una función que resuelve un problema invocandose a sí misma con una versión más simple del problema.

O sea que la función tiene un problema que debe resolver, así que lo toma, lo simplifica y se vuelve a "llamar" para hacer lo mismo, con esta versión más simple. Para que esto logre éxito nuestra función debe organizarse así:

1. En algún momento eso de llamarse a sí misma con una versión más simple del problema deberá detenerse. A ésto lo llamamos el caso base, aquí hemos llegado al punto en donde el problema ya no se puede simplificar más, y a esta versión super simplificada del problema le generamos facilmente su solución.
2. Cuando no hemos llegado al caso base por que aún podemos simplificar más al problema, estamos en el *caso recursivo*, aquí tomamos nuestro problema en su estado actual, lo simplificamos debidamente y nos volvemos a llamar con la versión más simple. Pero esto no es todo:

> En el caso recursivo esperamos que el llamado recursivo nos "regrese" algo, un valor de retorno que quizá nosotros en el caso acctual debamos procesar para producir nuestro propio resultado.

Aquí tambien tengamos en cuenta que:

> Algunos problemas le exigen a una función que tenga ,ás de un caso recursivo, o también más de un caso base.

Y no estaá demás resaltar que:
- En el caso base no hay llamadas recursivas.
- En el caso recursivo almenos hay una llamada recursiva.

