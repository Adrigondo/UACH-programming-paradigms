### ¿Recursividad delantera o trasera?
Cuando tenemos que implementar una función recursiva, ¿Lo hacemos usando recursividad trasera o mejor recursividad delantera (o sea, no trasera)? Para responder a esta pregunta vale la pena recordar todo lo que ocurre a muy bajo nivel cuando se ejecuta una función:

1. Se "mandan" los argumentos de la función a los registros del procesador (los primeros cuatro) o a la pila (del quinto en adelante).
2. En Windows deberá apartarse un espacio para la "memoria somnbra".
3. Se almacena en la pila la dirección de retorno.

> Al conjunto formado por los argumentos de la función, la memoria sombra y la dirección de retorno se le conoce como marco de pila

Cuando se utiliza recursividad delantera y cuando se utiliza recursividad trasera, se almacena un marco de pila por cada llamada recursiva que la función haga. El problema es que cada marco de pila se "apila" en la pila arriba del marco de la llamada anterior".

Si una función recursiva se "llama" a si misma una cierta cantidad muy pero muy grande de veces se va agotar el espacio en la pila del programa, produciendo un *stack overflow* lo que produce que el Sistema Operativo interrumpa al programa.

Pues resulta que:
1. Ambos, recursividad trasera y recursividad delantera pueden producir un stack overflow.
2. Pero la recursividad trasera tiene una particularidad: permite llevar a cabo "optimizaciones" para no agotar nunca la pila.

### La "eliminación" de la recursividad transera
Y ¿cómo es esa "optimización" que la recursividad trasera puede hacer, pero la recursividad delantera no? Es sencillo:
> Puesto que la llamada recursiva es la última instrucción en la función, eso significa que no necesitamos guardar su resultado, ni "recordar" resultados previos

O sea que bien podemos no utilizar ningún otro marco de pila más que el del llamado original. Debemos conocer que:

> La fomra más común de "optimizar" una función con recursividad trasera es eliminar la función con recursividad trasera y en su lugar poner un ciclo WHILE.

Pero todo esto sucede a bajo nivel, el programador que utiliza programación funcional por que se creé muy chido ni cuenta se da...

Ahora bien, debemos conocer también que:
> Haskell internamente se las arregla para no meterse con la pila en ninguna función

Esto significa que en Haskell ninguna función ayuda la pila del progra, sea recursiva o no, sea recursiva delantera, o sea recursiva traseras, en Haskell las funciones simplemente no produciran stack overflow.

Se nos pide que hagamos una función recursiva que calcule $n!$, el factorial de n. Por definición:


$
n!\text{facto}(n)= \begin{cases}
1 & | \ n=0 \\
n(\text{facto}(n-1)) & | \ n>0 
\end{cases}
$

Si usamos recursividad delantera:
```hs
facto::Integer->Integer
facto n | n==0 = 1
        | otherwise = n*facto(n-1)
```
Y en la función principal la usamos así:
```hs
main::IO()
main=do
    let n=5
    let resp=facto n
    putStrln("El factorial es " ++ (show resp))
```

Pero si usamos recursividad trasera, entonces hay que cambiarle un poco...
```hs
facto::Integer->Integer->Integer
facto n acum | n==0 acum
             | otherwise=facto(n-1)(n*acum)
```
Y la función principal la usmos así:
```hs
main::IO()
main=do
    let n=5
    let resp=facto n 1
    putStrln("El factorial es " ++ (show resp))
```

Obsérvese que el valor inicial del acumulador en la llamada a facto es 1, pues la multiplicatoria así debe iniciar.

---
Ahora se nos pide que hagamos una función recursiva que nos regrese el n-ésimo número de la serie de Fibonacci:

Formalmente podemos plantear esto de la siguiente manera:

$
n!\text{facto}(n)= \begin{cases}
1 & | \ n=0 \\
1 & | \ n=1 \\
\text{fibo}(n-1)+\text{fibo}(n-2)& | \ n>1 
\end{cases}
$

En Haskell, usando recursividad delantera:
```hs
fibo::Integer->Integer
fibo n | n==0=0
       | n==1=1
       | otherwise=(fibo(n-1))+(fibo(n-2))
```
Y en la función main lo usamos así:
```hs
main::IO()
main=do
    let n=10
    let resp=fibo n
    putStrln(El resultado es " ++ (show resp))
```
Y luego vamos con la versión de `fibo` que usa recursividad trasera, pero cuidado:

> La función `fibo`, por definición, tiene dos llamados recursivos, luego

```hs
fibo::Integer->Integer->Integer
fibo n acum1 acum2 | n==0 = acum1
                   | n==1 = acum2
                   | otherwise = fibo(n-1) acum2 (acum1+acum2)
```

Y la usamos en la función main como lo siguiente:
```hs
main::IO()
main=do
    let n=10
    let resp=fibo n 0 1
    putstrln("El resultado es" ++ (show resp ))
```

Notese que en el llamado original a fibo el primer acumulador es 0, el resultado para cuando n=0, el segundo acumulador es de 1, el resultado para cuando n=1.