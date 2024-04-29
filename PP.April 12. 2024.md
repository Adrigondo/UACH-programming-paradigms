Antes de continuar sepamos que tenemos opciones para implementar programación funcional en cuanto a lenguajes.
1. Lenguajes orientados a objetos que soportan los principios de la programación funcional:
   * Python
   * Scala
   * Javascript (y sus derivadas)
2. Y lenguajes estrictamente hechos para programación funcional
   * Lisp, el "padre" de los lenguajes funcionales
   * Scheme, un Lisp bonito y fácil de aprender.
   * Clojuro, otro Lisp, pero más moderno.
   * Haskell, el lenguaje funcional, basado en *cálculo lambda* y el favorito de nerds insoportables...
  
# Haskell como lenguaje de programación funcional.
Haskell es actualmente el lenguaje funcional más popular.
Es yb lenguaje muy pero muy particular.
1. Utiliza como funciones puras al concepto de función lambda del cálculo lambda
2. No es propiamente un cínico "paquete" si no que se compone de varios de ellos.

Así que si queremos instalar Haskell, debemos instalar un buen paquete de paquetes, para no "batallar" (tanto), existe un paquete que nos instala el paquete con todos los paquetes que conforman a Haskell. Para hacernos de este paquete de instalación, debemos:
1. Ir a haskell.org
2. Ir a "Use GHCup*, para descarfar el paquete GHCup (Glasgow Haskell Cup compiler), el instalador de Haskell.
3. De allí ir a *instalations* para dirigirnos a una página que nos indica como obtener GHCup.
   1. Una que nos indica GHCup en los Linux, BSDs y MACOS X
   2. Y otra que nos indica como en Windows
En ambos casos el proceso de obtener GHCup ocurren en la terminal del sistema.

Y esto es muy importante porque en el caso de Windows la instalación de GHCuup ocurre usando la terminal Powershell, y nada más en ella.

Este enorme comando de Powershell primero descarga GHCUp, y luego "avanza" el proceso de instalación de Haskell ahora sí

> Es importante arrancar el PowerShell en modo "normal" para hacer esto y no en modo administrador.

