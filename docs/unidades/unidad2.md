# Unidad 2 — Iteraciones

# 7. Iteración

Los ordenadores se utilizan a menudo para automatizar tareas repetitivas. Repetir tareas idénticas o similares sin cometer errores es algo que las máquinas hacen bien y las personas hacemos mal.

La ejecución repetida de un conjunto de sentencias se llama **iteración**. Python proporciona varias características para facilitar esto. Ya hemos visto la sentencia `for` en capítulos anteriores, que es la forma de iteración que probablemente usarás más a menudo. Pero en este capítulo veremos la sentencia `while` (mientras), otra forma de iterar útil en circunstancias ligeramente diferentes.

## 7.1. Asignación

Como hemos mencionado anteriormente, es legal hacer más de una asignación a la misma variable. Una nueva asignación hace que una variable existente refiera a un nuevo valor (y deje de referirse al antiguo).

```python
tiempo_aire = 15
print(tiempo_aire)

tiempo_aire = 7
print(tiempo_aire)
```

Aquí tienes una lección completa adaptada al español, siguiendo la estructura y contenido del recurso original, pero optimizada para MkDocs Material. Puedes copiar y pegar este bloque directamente en tu archivo .md.
Markdown

# 7. Iteración

Los ordenadores se utilizan a menudo para automatizar tareas repetitivas. Repetir tareas idénticas o similares sin cometer errores es algo que las máquinas hacen bien y las personas hacemos mal.

La ejecución repetida de un conjunto de sentencias se llama **iteración**. Python proporciona varias características para facilitar esto. Ya hemos visto la sentencia `for` en capítulos anteriores, que es la forma de iteración que probablemente usarás más a menudo. Pero en este capítulo veremos la sentencia `while` (mientras), otra forma de iterar útil en circunstancias ligeramente diferentes.

## 7.1. Asignación

Como hemos mencionado anteriormente, es legal hacer más de una asignación a la misma variable. Una nueva asignación hace que una variable existente refiera a un nuevo valor (y deje de referirse al antiguo).

```python
tiempo_aire = 15
print(tiempo_aire)

tiempo_aire = 7
print(tiempo_aire)
```
La salida de este programa es:


```bash
15
7
```
Esto sucede porque la primera vez que se imprime tiempo_aire, su valor es 15, y la segunda vez, es 7.

!!! warning "Precaución: Asignación vs Igualdad" Es especialmente           importante distinguir entre una sentencia de asignación y una expresión booleana que prueba igualdad.

* Python usa el token igual (`=`) para la asignación.
* Python usa el doble igual (`==`) para comparar igualdad.

Recuerda que `a = 7` es una instrucción (haz que `a` valga 7), mientras que `a == 7` es una pregunta (¿es `a` igual a 7?).

##  Actualización de variables

Una de las formas más comunes de asignación es una actualización, donde el nuevo valor de la variable depende de su valor anterior.

```python

n = 5
n = 3 * n + 1
```

La línea 2 significa: "obtén el valor actual de n, multiplícalo por 3 y súmale 1, y asigna la respuesta a n". Después de ejecutar esto, n valdrá 16.

Si intentas actualizar una variable que no ha sido creada (inicializada), obtendrás un error.

!!! failure "Error de nombre" python >>> w = x + 1 NameError: name 'x' is not defined

Antes de poder actualizar una variable, debes inicializarla, generalmente con una simple asignación:



# 📦 Modularidad y Empaquetado: Creando un Módulo de Utilidades

En programación, la **modularidad** es la práctica de dividir un programa grande en partes pequeñas, independientes y manejables, llamadas **módulos**. Esto hace que el código sea más limpio, fácil de mantener y reutilizable.

Python facilita esto con los **paquetes** y **módulos**. Usaremos un ejemplo simple, una **Mini Calculadora Geométrica**, para ilustrar cómo se estructura un paquete utilitario sin dependencias de estado global.

---

## 1. 📁 Estructura del Proyecto

Para que Python reconozca una colección de archivos como un **paquete**, debemos seguir una estructura de directorios específica. El nombre del directorio externo (aquí, `mini_geom_project`) puede ser cualquiera, pero el directorio interno (`mini_geom`) es el nombre real del paquete que se importará.

```plaintext
mini_geom_project/
├── mini_geom/             <-- Nombre del Paquete (El código fuente)
│   ├── __init__.py        <-- Interfaz (Obligatorio para el paquete)
│   └── calculations.py    <-- Lógica (Donde residen las funciones)
└── pyproject.toml         <-- Configuración para la distribución
```

Este archivo está diseñado para ser claro, educativo y fácil de integrar.

## 2. 📝 El Módulo de Lógica: `calculations.py`

Este archivo contiene la **lógica de negocio** o las **funciones utilitarias**. 

```python
# mini_geom/calculations.py

import math

def area_circulo(radio):
    """Calcula el área de un círculo ."""
    # ... validaciones y cálculo ...
    return math.pi * radio**2

def perimetro_rectangulo(lado_a, lado_b):
    """Calcula el perímetro de un rectángulo."""
    # ... validaciones y cálculo ...
    return 2 * (lado_a + lado_b)

def area_triangulo(base, altura):
    """Calcula el área de un triángulo ."""
    # ... validaciones y cálculo ...
    return 0.5 * base * altura
```

**Concepto Clave: Aislamiento**

La lógica matemática vive solo aquí. Si quisiéramos cambiar el cálculo (e.g., usar una constante pi más precisa), solo tendríamos que modificar este archivo.

## 3. 🛡️ La Interfaz Pública: `__init__.py`

El archivo `__init__.py` es el portal del paquete. Permite dos cosas fundamentales:

1. Indica a Python que el directorio `mini_geom` debe tratarse como un paquete.
2. Define qué funciones del módulo interno (`calculations.py`) son visibles directamente cuando un usuario importa el paquete. Esto se llama **abstracción**.

```python
# mini_geom/__init__.py

# Importamos las funciones desde el módulo interno (calculations.py)
from .calculations import (
    area_circulo, 
    perimetro_rectangulo, 
    area_triangulo
)

# Definimos la versión y la lista de elementos exportados
__version__ = "1.0.0"
__all__ = ["area_circulo", "perimetro_rectangulo", "area_triangulo"]
```

**Concepto Clave: Abstracción**

El usuario del paquete no necesita saber que las funciones están dentro del archivo `calculations.py`. El `__init__.py` abstrae esa estructura interna.

La línea `__all__ = ["area_circulo", "perimetro_rectangulo", "area_triangulo"]` define explícitamente qué elementos del módulo se exportan cuando se usa `from mini_geom import *`. Esto ayuda a controlar qué partes del módulo están disponibles públicamente.

Las líneas `from .calculations import ( area_circulo, perimetro_rectangulo, area_triangulo )` importan las funciones del módulo `calculations.py` y las exponen a nivel del paquete. Esto permite que los usuarios accedan a las funciones directamente desde el paquete sin necesidad de conocer la estructura interna.

Al importar las funciones en `__init__.py`, los usuarios pueden utilizar las funciones del paquete de manera más sencilla. 

Por ejemplo, si no se incluyera la línea de importación en `__init__.py`, un usuario tendría que acceder a las funciones de la siguiente manera:

```python
from mini_geom.calculations import area_circulo
```

Sin embargo, al importar las funciones en `__init__.py`, el usuario puede simplemente hacer:

```python
from mini_geom import area_circulo
```

Esto simplifica el uso del paquete y oculta la estructura interna, permitiendo que los usuarios trabajen con el paquete de manera más intuitiva y directa.

## 4. 🚀 Uso del Paquete por el Usuario Final (`main.py`)

Un script de usuario que consume el paquete se beneficia de la interfaz limpia. La importación es directa desde el nombre del paquete.

```python
# main.py

# Importación limpia gracias al __init__.py:
from mini_geom import area_circulo, perimetro_rectangulo

# 1. Uso de las funciones:
radio_c = 4
area = area_circulo(radio_c)
print(f"Área del círculo de radio {radio_c}: {area:.2f}")

# 2. Reutilización simple:
lado1 = 10
lado2 = 5
perimetro = perimetro_rectangulo(lado1, lado2)
print(f"Perímetro del rectángulo ({lado1}x{lado2}): {perimetro}")
```

| Beneficio     | Descripción                                                                                             |
|---------------|---------------------------------------------------------------------------------------------------------|
| Organización  | El código está separado por responsabilidades (lógica, interfaz, configuración).                        |
| Reutilización | Las funciones pueden ser importadas y usadas en cualquier proyecto sin copiar el código.                |
| Mantenibilidad| Los errores o actualizaciones en un módulo (e.g., `calculations.py`) no afectan a otros módulos, simplificando el debugging. |
| Abstracción   | Los usuarios solo ven la interfaz pública, sin necesidad de conocer los detalles internos de la implementación. |


La modularidad es solo el primer paso; el despliegue y la distribución son lo que permite que otros (o usted mismo en otro proyecto) realmente usen su paquete.

Aquí hay una elaboración detallada sobre cómo se prepara, configura y distribuye el paquete `mini_geom`, incluyendo el archivo `README.md` y la estructura moderna de `pyproject.toml`.

## 🏗️ Preparación para el Despliegue del Paquete

Antes de distribuir su paquete, necesitará dos archivos esenciales y el archivo de configuración `pyproject.toml`.

### 1. `README.md` (Documentación)

El `README.md` es la carta de presentación de su paquete. Explica qué hace, cómo se instala y cómo se usa. Es fundamental para cualquier paquete que quiera ser distribuido.

```markdown
# Mini Geom 📐

Un paquete utilitario de Python simple para el cálculo de áreas y perímetros de figuras geométricas básicas.

## 🚀 Instalación

Este paquete no está publicado en PyPI (por ahora), pero puede instalarlo localmente clonando el repositorio:

```bash
git clone https://github.com/su-usuario/mini_geom_project.git
cd mini_geom_project
pip install .
```

## ✨ Uso

Una vez instalado, importe las funciones directamente desde el paquete `mini_geom`:

```python
from mini_geom import area_circulo, perimetro_rectangulo
import math

# Área del círculo: A = π * r²
print(f"Área del círculo de radio 5: {area_circulo(5):.2f}") 
# Salida: 78.54

# Perímetro del rectángulo: P = 2 * (a + b)
print(f"Perímetro del rectángulo (10x5): {perimetro_rectangulo(10, 5)}")
# Salida: 30
```

Cuando ejecutamos `pip install .` en la máquina, lo que sucede es lo siguiente:

1. **Construcción del Paquete**: `pip` lee el archivo `pyproject.toml` para determinar cómo construir el paquete. Esto puede incluir la compilación de código si es necesario.
2. **Instalación de Dependencias**: Si el paquete tiene dependencias especificadas, `pip` intentará instalarlas.
3. **Instalación del Paquete**: `pip` instala el paquete en el entorno Python activo. Esto incluye copiar los archivos del paquete a un directorio donde Python pueda encontrarlos y registrar el paquete como instalado.
4. **Registro de Metadatos**: `pip` guarda información sobre el paquete instalado, como su nombre, versión y dependencias, para que pueda ser gestionado más tarde.

Este proceso permite que el paquete sea utilizado en cualquier script Python en ese entorno.