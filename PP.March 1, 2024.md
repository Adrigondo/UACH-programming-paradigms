#### English
## Encapsulation
And another main concept of the object oriented paradigm is related to the encapsulation and data abstraction.

> Some authors separate the concepts of abstraction and encapsulation but in this course, they are as related that we'll use them together.

With data abstraction we are refering to the act of the object done for *hide* itself inside characteristics, showing the external world all that is considered to be visible or accesible.
A way to do this is with the encapsulation.

// paragraph 1
// paragraph 2

An attribute or method with private access is the one who is not accesible to nobody in the outside world. Their use is private, meaning that just the methods of the object can access to it.

Otherwise are the attributes or methods with public access, this attribute or method is accesible to everyone outside.

Then, there are the attributes or methods with protected access. Their are not accesible to the outside, except to those objects that are of the same class or are from one class derived of the current class.


#### Spanish
## Encapsulamiento
Y aun otro concepto clave del paradigma orientado a objetos (POO) tiene que ver con aquello del encapsulamiento y abstracción de datos.

> Algunos autores separan los conceptos de abstracción y de encapsulamiento, pero en este curso los cosideramos tan relacionados que los manejamos juntos

Por abstracción de datos nos referimos a la acción que el objeto lleva a cabo para "ocultar" las particularidades internas de si mismo, presentando al mundo exterior solo lo ue el consiera que debe ser visible o accesible para el exterior. Luego una manera de lograr esto es mediante encapsulamiento.

Llamamos **encapsulamiento** a la manera en que el objeto oculta lo que no quiere que sea visible y presenta lo que si quiere que sea accesible al mundo exterior. La manera más rápida y efectiva de lograr esto es mediante uno de sus atrributos (los de instancia) y cada uno de sus métodos (los de instancia).

Existen 3 tipos de modificadores de acceso:
1. Acceso privado
2. Accesso público
3. Acceso protegido

Un atributo y método con acceso privado es uno que simplemente no es accesible para nadie en el mundo exterior. Su uso es privado para los propios métodos del objeto.

Todo lo contrario a esto es el atributo o método con acceso público, este atributo o este método es accesible para todos en el mundo exterior.

Y luego esta el atributo o método con acceso protegido. Este atributo o método no está accesible para nadie en el mundo exterior, a menos que ese alguien exterior sea un objeto de la misma clase del actual, o de una clase derivada de la clase actual.

En un diagrama de clase UML, para indicar que un atributo o un método tiene un modo de acceso, se utiliza una sibología muy especial.
| Simbolo | Acceso |
|-|-|
| + | Público |
| - | Privado |
| * | Protegido |


Este símbolo se agrega antes del nombre del atributo o método, como en:
<table>
<thead>
    <tr>
        <th colspan=2>Nombre clase</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td>+</td>
        <td>nombreAtributo<sub>1</sub></td>
    </tr>
    <tr>
        <td>-</td>
        <td>nombreAtributo<sub>2</sub></td>
    </tr>
    <tr>
        <td>*</td>
        <td>nombreAtributo<sub>3</sub></td>
    </tr>
    <tr>
        <td>+</td>
        <td>nombreMetodo<sub>1</sub>()</td>
    </tr>
    <tr>
        <td>-</td>
        <td>nombreMetodo<sub>2</sub>()</td>
    </tr>
    <tr>
        <td>*</td>
        <td>nombreMetodo<sub>3</sub>()</td>
    </tr>
</tbody>
</table>

Y es que al final, si bien los modos de acceso definen el comportamiento y, el aspecto del objeto son detalles que se establecen al definir la clase del objeto.

## Ruby y el encapsulamiento
Pero llegó la hora de "aterrizar" todos estos conceptos del encapsulamiento en Ruby, y es muy escpecial como Ruby maneja esto.
Para comenzar:
> En Ruby todo atributo (de instancias) es privado

Es decir que ni siquiera nos dejan elegir que modo queremos para un atributo, es privado y punto.
Más alla de esta *regla de oro*, en Ruby para indicar este modo de acceso usamos algo así como bloques, algo como en la siguiente definición:
```ruby
 class LaClase
    public

    private

    protected

end
```
Claro que con las restricciones de Ruby lo único que puede ser privado, protegido ó público son los métodos.

> Si el definir un método no le indicamos un método de acceso, por default es público.

### Metodos accesores de atributos
Ya dijimos, todo atributo (de instancia) en Ruby tiene acceso privado y eso nadie lo cambia.
Pero ¿qué si queremos que el mundo externo si vea (acceda) a ese atributo? Si bien esto en principio no es posible, Ruby nos permite definirle accesores a tal atributo.

> Un accesor (*accesssor* en inglés) es un método público hecho para acceder a un atributo privado.

Existen 2 tipos de accesores:
1. Setters o escritores
2. Getters o lectores

Un metodo escritor es un método hecho para "escribirle" un valor a un atributo privado y un metodo lector es uno que sirve para "leer" su valor actual.
Supongamos que tenemos un atributo llamado `@atri`, claro, es un atributo de instancia. Para definirle un método accessor, tanto lector como escritor, vamos a usar la siguiente deficnición:
```ruby
attr_accesor: atri
```
Esto define tanto un método lector como uno escritor asociado al atributo atri. Y ¿cómo se invocan esos métodos? Simple:
```ruby
objeto.atri = algo
algo = objeto.atri
```

De la clase *Punto2D* anterior, definamos los accesores para los atributos `@x` y `@y`.

//