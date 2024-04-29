# Unidad III. Paradigma funcional
Recuerdese Que el paradigma funcional es un paradigma "declarativo", lo que implica en primer lugar que
> Un programa no está hecho de instrucciones sino de expresiones

Aunque esto último es en realidad un idealismo que no necesariamente se cumple a la perfección. Además ¿qué es una expresión y porqué es diferente de una instrucción? En principio.

una instrucción esun comando que luego de ser ejecutado (quizá por el procesador) regresa un resultado ó a lo mejor no regresa nada, y una expresión en cambio, es algo que se evalúa y siempre regresa un resultado.

## Funciones puras
En el paradigma funcional esas expresiones con las que se hace un programa son un tipo de expresión muy especial llamada **función para**.
Así que ¿qué es una función pura? Pues resulta que:
> Una función pura es una expresión que recibe un conjunto (finito) de argumentos o parámetros y produce con ellos y solo con ellos un resultado.

- $f(x)=x^2$ es una función pura.
    Toma un único argumento $x$ y produce un resultado $x^2$ que solo depende de esa $x$ y nada más.
- $f(x)=x^2+10$ no es estrictamente una función pura
    Su resultado no solo depende de x, su único argumento, si no de una constante interna 10
- $f(x,y)=x^2+y$ si es una función pura.
    El resultado solo depende de esos 2 argun¿mentos
    > De hecho f(x,10)=x^2+10 ya logra lo que la función anterior lograría.
- $g(x,y)=x^2+10y+z$ no es una función pura.
    El reusltado depende de una tercer variable $z$ que no es uno de los argumentos, además de ese coeficiente 10 que aparece allí.
La cuestión de los coeficientes constantes y los terminos constantes, si no se es muy "purista" se pueden permitir si nos aseguramos de que nunca cambien de valor, y así las funciones anteriores serían todas funciones puras, siempre que no realizemos cambios a los valores de las constantes.

Entonces desde el punto de vista de un paradigma funcional, un programa está hecho de puras funciones puras, y nada más...
Esto es verdad pero le falta.
Y es que para lograr tal caso necesitamos cumplir con ciertos principios a los que llamaremos los *principios de la programación funcional*. Y estos principios son los siguientes:
1. El programa no mantiene estado
2. Y por lo tanto no hay variables matables
3. Y por lo canto no existen cosas como ciclos
4. Y por lo tanto mejor usamos recursividad
5. Y ademas las funciones son *entidades* de orden superior.