# Las funciones *anónimas*
Conocemos que en un lenguaje funcional las funciones sin "entidades de orden superior", lo que significa que una función es por si misma un valor, algo que puede ser asignado a una variable, o pasar como parámetro a otra función, o ser el resultado de otra función. Y a propósito de esto, también debemos conocer un detalle propio de la programación funcional y es que otros lenguajes de programación no funcional han adoptado las funciones anónimas.

También llamadas *funciones lambda* estas son funciones que se definen en una única expresión que "se usa" en donde se define... Es decir que
> Una función anónima no se define como una "función normal", sino que se define en una única expresión sencilla para luego utilizarse allí mismo.

En Haskell una función anónima se define:

```hs
\para1 \para2 \para3 .... \parak -> expression
```
La función anónima regresa como resultaddo lo que sea que evalúe la expresión del cuerpo con los parámetros "sustituídos" por valores.
- Definamos una función muy simple como
  
  $f(x)=x+18$

  Y luego hagamos $resp=f(10)$ a ver que onda. Una manera de hacerlo en Haskell es usando una función anónima:
  ```hs
  let resp=(\x->x+18) 10
  putStrln("El resultado es "++(show resp))
  ```
  Nótese que eso de (\x->x+18) 10 significa "aplícale" un 10 al argumento x de la función $f(x)=x+18$ o algo así.

- Ahora resulta que tenemos una función como
  
  $g(x,y)=x+y$

  Y queremos hacer $resp=g(10,20)$ En Haskell esto podráimos lograrlo así:
  ```hs
  let resp=((\x,\y->x+y)10)20
  putStrln("El resultado es "++(show resp))
  ```

  Y nótese que eso de `((\x,\y->x+y)10)20` significa "aplicale" un 10 a x y luego "aplícale" un 20 a y. O sea, en la lista de argumentos, leídos de izquierda a derecha se les aplican los valores leídos de izquierda a derecha.
  También podríamos haber hecho lo siguiente:
  ```hs
  let f=\x->x+18
  let g=\x,\y->x+y
  ```
  Y luego usar $f$ y $g$ como #funciones comúnes y corrientes", como en:
  ```hs
  let resp1=f 10
  let resp2=g 10 20
  putStrln("El resultado 1 es "++(show resp1))
  putStrln("El resultado 2 es "++(show resp2))
  ```
  
  Podemos regresar una función anónima desde otra función.

  ```hs
  the_function::(Integer->Integer):
  the_function=\x->x+18
  ```

  Y luego en la función main:
  ```hs
  main::IO()
  main=do
    let f=the_function
    let resp=f 10
    putStrln("El resultado es "++(show resp))
  ```

## Mapas, filtros y funciones anónimas
Tenemos una lista, y queremos aplicar una función a cada elemento de la lista. Podríamos hacerlo "a mano", usando una función que tome tanto la función a aplicar como la lista de cuyos elementos le aplicaremos a la función:
- Apliquemos $f(x)=x+18$ a cada elemento de la lista $[10,20,30]$
  ```hs
  apply::(Integer->Integer)->[Integer]->[Integer]->[Integer]
  apply fn list list2 list3 | list1==[] = list2
                            | otherwise= aplicable apply(tail list1)([fn(head list)]++list2)
  ```

  Y en la función principal haríamos algo como:
  ```hs
  let datos=[10,20,30]
  let resp=(apply (\x->x+18)datos [])
  putStrln("El resultado es "++(show resp))
  ```

  Esto está muy bien pero ya existe en Haskell una función que le aplica otra función a los elementos de alguna lista, y te produce otra lista con esa lista original pero aplicando la función a cada elemento, está función se llama map, y se usaría así:
  ```hs
  let resp=map(\x->x+18)[10,20,30]
  ```
  Aquí, al final, resulta que `resp=[10,20,30]`. Y luego está `filter`, otra función que toma una función y una lista como argumento, y regresa otra lista como resultado, y este resultado es la aplicación de esa función a cada elemento de la lista.... más o menos...

  Lo que sucede es que en filter la función en el primer argumento es una función en el primer argumento es una función "booleana", y el resultado de filter es una lista con los elementos de la lista original que cumplieron la condición booleana de la función.

- De la lista $[1,18,2,35,12,3]$. "filtremos" aquellos mayores a 10...
  ```hs
  let resp=filter(\x->x>10)[1,18,2,35,12,3]
  ```
  Al final tenemos que $resp=$[18,35,12]$.