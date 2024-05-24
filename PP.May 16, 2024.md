##  Funciones como entidades de orden superior
Algo muy único de la programación funcional y de los lenguajes de progrmación funcional en general es que
1. Las funciones pueden ser asignadas o variables como valor
2. Pueden ser parámetros de otras funciones
3. Pueden ser el valor de retorno de otras funciones

Cuando una función logra lo que estos puntos dicen, entonces las funciones son tratadas como *"entidades de orden superior"*.
Y ciertamente Haskell trata a las funciones como tal. Por ejemplo, dada la siguiente función:

```hs
sum::Integer->Integer->Integer
sum x y = x + y
```

En la función main podríamos asignar `sum` o una variable `sum_again`:
```hs
let sum_again=sum
```
Y luego usar `sum_again` para aasignarle a resp el resultado de sumar 10+20:
```hs
let resp=(sum_again, 10, 20)
```
También podríamos haber implementado `sum_again` pero como una función que:
- Tome como argumento a `sum`
- Un segundo argumento entero `x`
- Y un tercer argumento entero `y`
- Y que regrese el resultado entero de llamar `(sum x y)`
  
```hs
sum_again::(Integer->Integer->Integer)->Integer->Integer->Integer
sum_again fn x y = (fn x y)
```

Y en la función main podemos asignar a resp el resultado de llamar a `sum_again`, con `sum` como primer argumento, 10 como segundo y 20 como tercero.

```hs
let resp=(sum_again 10 20)
```
Y ahora hagamos una variable `addOne` que recibe como valor la función sumale con un entero como primer argumento y un 1 como segundo argumento producto de una función "wrapper" que solo regresa