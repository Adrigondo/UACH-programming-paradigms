# English
It is needed to know than the attributes accessors are not the only way to implement getters and setters mehtods in Ruby.

Many Time, we can implement our own methods. For example, if we do an instance attribute @attr (that is private by default), we can implement it getter as:
```rb
def get_attr():
    return @attr
end
```
And the setter method can ibe:
```rb
def set_attr(value):
    @attr=value
end
```

# Español
Debemos conocer que los accesores de atributos no son la única forma de implementar métodos lectores y escritores en Ruby. En muchas ocasiones podemos implementar nuestros propios métodos. Por ejemplo, si hacemos algún atributo de instancia @atri (que por default es privado) bien podriamos implementarle su lector como:
```rb
def lector_de_atri:
    return @atri
end
```
Y su método escritor como:
```rb
def escritor_de_atri:
    @atri=valor
end
```

## Herencia
Y llegamos al que es quizá el concepto más importante detrás del POO(paradigma orientado a objetos): la herencia entre clases.
> La herencia es importante por que es la manera en que la POO da lugar al reuso de código.

La herencia se trata de que todo atributo y todo método definido para una clase base sea "heredado" a otra **clase derivada**, de modo que ahora la clase derivada tiene todo lo que la clase base tiene más sus propias cosas. En un diagrama UML de clases la herencia es como una relación "es un" entre la clase derivada y la clase base:

![alt text](image.png)

Nótese que en esta relación de herencia **Clase B**, que es una clase derivada de **Clase A** tiene por herencia, al atributo `atri1` y al método `meto2()`, aunque en el diagrama estos no aparecen especificados en Clase B.


# Herencia simple y herencia múltiple
En realidad en la POO existen 2 formas de herencia entre clases:
1) La herencia simple
2) La herencia múltiple

La *herencia simple* ocurre cunado una clase derivada solo hereda desde una única clase base:

![alt text](image-2.png)

Y como era de esperar, la **herencia múltiple** ocurre cunado la clase derivada hereda desde más de una clase base:

![alt text](image-3.png)

Aquí `C Class` que hereda desde `A Class` y `B Class` termina heredando los atributos `attr1` y `method1()` desde `A Class` y a,l `attr2` y `method2()` desde `B Class`, aunque estos no se especifiquen en el diagrama.

### Herencia múltiple y el conflicto de nombres

En la relación de herencia múltiple del ejemplo anterior todo está bien, ya que todas las clases cuentan con atributos y metodos distintos. Pero ¿Qué sucede con la siguiente situación?

![alt text](image-4.png)

Aquí hay un gran problema:
- En `C class` tenemos un atributo propio llamado `attr1`.
- Pero hereda un atributo `attr1` de `A class`.
- Y también hereda un atributo `attr1` de `B class`.

Así que tenemos un *conflicto de nombres*, y este coonflicto se trata de:

> ¿Con qué atributo `attr1` termina `C Class`? <br>
> ¿Acaso es el que recibe de `A Class`, o el que recibe de `B Class`, o el que se define para si misma?

Un conflicto de nombres, en primer lugar no debería de existir
> ¿Porqué dos clases base tienen un mismo atributo si son 2 naturalezas diferntes?

Es decir que en muchos casos los conflictos de nombre señalan un mal diseño de clases. Aunque por otro lado:

> Cada lenguaje que soporte POO tiene sus propias políticas de "desambiguamiento" para conclictos de nombre.
