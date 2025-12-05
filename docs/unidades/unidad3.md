# Introducción a la Programación Orientada a Objetos (POO)

## Conceptos Fundamentales de POO

### 1.1. ¿Qué es una Clase? (El Molde)

Una clase es una plantilla o molde para crear objetos. Es una definición abstracta que describe las características (atributos) y los comportamientos (métodos) que tendrán los objetos creados a partir de ella.

**Ejemplo:** La clase `Rectangulo` define que cualquier rectángulo tendrá un `lado_a` y un `lado_b`, y sabrá cómo `calcular_area()`.

**Convención:** En Python, los nombres de las clases siempre empiezan con mayúscula (PascalCase).

### 1.2. ¿Qué es un Objeto? (La Instancia)

Un objeto es una instancia concreta y tangible de una clase. Es un elemento real en la memoria de la computadora que ha sido creado a partir del molde.

**Ejemplo:** Si la clase es `Rectangulo`, un objeto sería `mi_cancha = Rectangulo(10, 5)`. La cancha es un rectángulo específico con sus propios valores.

### 1.3. 🧠 POO y Memoria: Atributos

La principal diferencia con el diseño funcional anterior es el manejo del estado.

| Concepto            | Descripción                                                            | Relación con la Memoria                                         |
|---------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|
| Variables Globales  | Vistas y modificadas por cualquier función en cualquier momento.       | Ocupan una única posición en la memoria compartida.             |
| Atributos (self.variable) | Variables internas que definen el estado particular de un objeto. | Cada objeto (`mi_cancha`, `mi_circulo`) tiene su propia copia de estos atributos en una zona de memoria separada. |

Este concepto se llama **Encapsulamiento**: agrupar los datos (atributos) y las operaciones que actúan sobre esos datos (métodos) dentro de una unidad (la clase).

## 2. 🛠️ Métodos Especiales: El Constructor `__init__`

Los métodos especiales (llamados *Dunder Methods* por el doble underscore) son la forma en que las clases interactúan con el sistema Python. El más importante es el constructor.

### El Método Constructor: `__init__(self, ...)`

Este método se llama automáticamente justo después de crear el objeto. Su trabajo es inicializar y dar valores iniciales a los atributos del objeto.

- **self:** Es el primer parámetro de cualquier método de instancia en Python. Representa al objeto que se está creando o al objeto que está llamando al método.

- **Relación con la Memoria:** Cuando se escribe `mi_circulo = Circulo(5)`, el proceso es:

  - Python reserva espacio en la memoria.
  
  - Llama al método `__init__` pasándole esa nueva porción de memoria como `self`.
  
  - Dentro de `__init__`, la línea `self.radio = 5` almacena el valor 5 en la memoria recién reservada para ese objeto `mi_circulo`.