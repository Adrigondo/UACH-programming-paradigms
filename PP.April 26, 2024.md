Pero luego resulta que existen 2 formas en que una función puede ser recursiva:
1. Usando "recursividad delantera"
2. Usando "recursividad trasera"

Y todo tiene que ver con el donde la función hace el llamado recursivo (en el caso recursivo *NO ALCANZO A LEER*). Por ejemplo

1. En la recursividad trasera, el llamado recursivo es la última expresión/instrucción d ela función
2. Y en la recursividad delantera el llamado recursivo ocurre en cualquier instrucción/expresión excepto la última.

El uso de una u otra forma de recursividad implica cambios en la manera en que se entiende el comportamiento de la función porque usan diferentes métodos para lograr lo mnismo, específicamente:

1. En la recursividad delantera el caso base inicia el inicio del proceso y el recursivo su finalización.
2. En la recursividad trasera en cambio el caso base marca el fin del proceso y el recursivo su inicio

1. En la recursividad delantera la "acumulación" de resultados es el mismo resultado de la función
2. En la recursividdad trasera la acumulación de resultados es un parámetro de la función

Lo que si es verdad es lo siguiente:

1. La recursividad delantera es la más "natural", en la mayoría de los casos.
2. La recursividad trasera es muy optimizable, en la mayoría de los casos.

Debemos implementar lo siguiente:
$\text{summation}(n)=\displaystyle\summation_{i=0}^{n} i$

Y esto lo queremos implementar usando una función recuriva. Primero expresamos esa sumatoria como si fuera una función recurrente:

$
\text{summation}(n)= \begin{cases}
0 & | \ n=0 \\
n+\text{summation}(n-1) & | \ n>0 
\end{cases}
$

Aqui ya se nota aquello de que la recursividad delantera es la más natural, pues básicamente la expresión anterior se expresa como una función con recursividad delantera, Pues esto en Python sería así;

```py
def summation(n):
    if n==0:
        return 0  # Base case
    else
        return n+summation(n-1)  # Recursive case
```

Y ahora veamos como luce esto mismo en Haskell:
```hs
summation::Integer->Integer->Integer
summation n =
    if n==0 then {- Base case -}
        0
    else {- Recursive case -}
        n+(summation(n-1))
```

Pero aquí nos detenemos y consideremos la siguiente cuestión filosófica.
Desde un punto de vista funcional ¿Se valen los `If-Then-Else`? Pues bien, consideremos un `If-Then-Else` como si fuera una función:
1. Parametro: la condición
2. Retorno: lo que regrese si la condición es verdadera, o lo que te regrese si la condición es falsa

Así que perfecto, un `If-Then-Else` es toda una expresión funcional, pues sin importar si la condición es verdadera o falsa, siempre "regresa" algo. Pero un `If-Then` sinn `Else` no es una expresión:
1. Parametro: la condición
2. Retorno: si la condición es verdadera si habrá retorno, pero si es falsa no habrá nada de respuesta

Así que un `If-Then` sinn `Else` no es válido en la programación funcional, pues no equivale a una expresión, pues no responde nada cuando la condición es falsa.


### Haskell y sus guardias

La verdad es que a Haskell tampoco le agradan mucho los `If-Then-Else`, allí están nomás para que nadie llore. Pero a Haskell en el fondo no le agradan. A Haskell le gusta más si en lugar de `If-Then` sinn `Else` usamos los llamados *guardias* (*guards*, en inglés). Un guardia es una forma de "partir" un proceso en casos, cada caso con su propia condición:

```hs
function_name param1 param2 ... paramN | condition1 = expression1 {- Case for the first condition -}
                                       | condition2 = expression2 {- Case for the second condition -}
                                       | condition3 = expression3 {- Case for the third condition -}
                                       ...
                                       | otherwise = expressionk {- Default case -}
```

Así, nuestra función para la sumatoria también pudo ser la siguiente:
> ```hs
> summation::Integer->Integer->Integer
> summation n | n==0 = 0 {- Base case -}
>             | otherwise = n+(summation(n-1)) {- Recursive case -}
> ```

Todo muy bonito hasta aquí. Pero regresando a la función recursiva:

$
\text{summation}(n)= \begin{cases}
0 & | \ n=0 \\
n+\text{summation}(n-1) & | \ n>0 
\end{cases}
$

¿Cómo sería la función con recursividad trasera de esta función recurrente? Ya no es tan directa la cosa. Y es que ahora el caso base tan directa la cosa. Y es que ahora el caso base te debe regresar el resultado final, o sea, la acumulación final que contiene el resultado final y que viene en uno de los parámetros o argumentos de la función.
Pero ¿que pasa con el caso recursivo? Pues en la recursividad trasera para este caso, primero se hace la acumulación y luego se hace el llamado recursivo con la nueva acumulación como parámetro.

```py
def summation(n, accumulation):
    if n==0:
        return accumulation  # Base case
    else
        return summation(n-1, accumulation+n)  # Recursive case
```

Pero cuidado:
> En la recursividad trasera, puesto que la acumulación de resultados es un parámetro de la función, asegurémosnos de que en el llamado inicial tal parámetro tenga el valor correcto inicial para tal acumulación.

Es decir que en Python la función sumatoria con recursividadd trasera se invoca así:

```py
n=10
resp=summation(n, 0) # 0 is the initial value of the accumulation
```

Ahora pasemos a Haskell ¿cómo luciría la función sumatoria con recursividad por atrás? Luciría así:

> ```hs
> summation::Integer->Integer->Integer
> summation n accumulation | n==0 = 0 {- Base case -}
>                          | otherwise = summation(n-1)(accumulation+n) {- Recursive case -}
> ```

Y ya para terminar, invoquemos en Haskell la sumatoria así:
```
main::IO()
main=do
    putStrln("La sumatoria es " ++ (show(summation 10 0)))
```