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

```

Cuando ejecutamos `pip install .` en la máquina, lo que sucede es lo siguiente:

1. **Construcción del Paquete**: `pip` lee el archivo `pyproject.toml` para determinar cómo construir el paquete. Esto puede incluir la compilación de código si es necesario.
2. **Instalación de Dependencias**: Si el paquete tiene dependencias especificadas, `pip` intentará instalarlas.
3. **Instalación del Paquete**: `pip` instala el paquete en el entorno Python activo. Esto incluye copiar los archivos del paquete a un directorio donde Python pueda encontrarlos y registrar el paquete como instalado.
4. **Registro de Metadatos**: `pip` guarda información sobre el paquete instalado, como su nombre, versión y dependencias, para que pueda ser gestionado más tarde.

Este proceso permite que el paquete sea utilizado en cualquier script Python en ese entorno.

## 2. `pyproject.toml` (Configuración de Construcción)

El archivo `pyproject.toml` es el estándar moderno (desde 2017) para configurar cómo se construye, distribuye y publica su paquete. Reemplaza al antiguo archivo `setup.py` para la mayoría de las configuraciones de metadatos.

```toml
# pyproject.toml

[build-system]
# Especificamos las herramientas necesarias para construir el paquete.
requires = ["setuptools>=61.0", "wheel"] 
build-backend = "setuptools.build_meta"

[project]
# --- Metadatos del Paquete ---
name = "mini-geom-calculator"      # 👈 El nombre que se usará en PyPI y con `pip install`
version = "1.0.0"                  # 👈 Versión actual (debe coincidir con __init__.py)
description = "Un paquete utilitario para cálculos de geometría simple."
readme = "README.md"
authors = [
    {name = "Su Nombre", email = "su.email@ejemplo.com"},
]
license = {text = "MIT License"}   # O especificar un archivo `LICENSE`
keywords = ["geometría", "calculadora", "utilidades"]

# Clasificadores que ayudan a la gente a encontrar su paquete en PyPI
classifiers = [
    "Programming Language :: Python :: 3",
    "License :: OSI Approved :: MIT License",
    "Operating System :: OS Independent",
    "Development Status :: 4 - Beta", # Indica que no es completamente final
]

# Dependencias (si su paquete necesitara numpy, se listaría aquí)
dependencies = [
    # En este caso, solo necesitamos la librería estándar math, no hay dependencias externas
]

[project.urls]
Homepage = "https://github.com/su-usuario/mini_geom_project"
```

Este archivo `pyproject.toml` especifica cómo se debe construir el paquete, define los metadatos necesarios para la publicación y describe las dependencias requeridas para el correcto funcionamiento del paquete. Además, proporciona información útil para los usuarios que buscan el paquete en PyPI, como el estado de desarrollo y las palabras clave asociadas.

## 3. 📤 Distribución del Paquete

Una vez que la estructura está lista, el proceso de distribución consta de dos pasos: **Construcción** y **Publicación**.

### Paso A: Construir los Archivos de Distribución

El proceso de construcción toma el código fuente y lo empaqueta en formatos estándar de distribución. Para esto, se necesita la herramienta `build` (puede usar `pip install build` si no la tiene).

Ejecute este comando desde el directorio raíz del proyecto (`mini_geom_project`):

```bash
python -m build
```

Este comando genera dos tipos de archivos en un nuevo directorio llamado `dist/`:

- **Sdist (Source Distribution) (`.tar.gz`)**: Contiene el código fuente y los metadatos. Permite reconstruir el paquete en diferentes entornos.

- **Wheel (`.whl`)**: Es un formato de distribución binaria, más rápido de instalar para el usuario final, ya que ya está preconstruido para una versión de Python.

### Paso B: Publicar en PyPI (El Índice de Paquetes de Python)

El objetivo de este proceso es subir los archivos generados en `dist/` a PyPI (Python Package Index), el repositorio oficial de paquetes.

1. **Instalar `twine`**: Es la herramienta estándar para subir paquetes de forma segura. Instálela con:

    ```bash
    pip install twine
    ```

2. **Subir los archivos**: Ejecute `twine` y apunte a los archivos en el directorio `dist/`:

    ```bash
    python -m twine upload dist/*
    ```

    `twine` le pedirá su nombre de usuario y contraseña de PyPI (o un token de API).

### Resultado Final: Instalación por el Usuario

Una vez publicado, cualquier persona en el mundo puede usar `pip` para instalar y usar su paquete modular:

```bash
# ¡Listo para ser usado globalmente!
pip install mini-geom-calculator
```
!!! note
    Hemos aprendido a lo largo de este flujo completo (Estructura interna → Configuración TOML → Construcción → Publicación) cómo no solo implementar la modularidad, sino también cómo crear software reutilizable y distribuible. Esta comprensión integral nos permite desarrollar paquetes Python que otros pueden instalar y utilizar fácilmente, facilitando la colaboración y el uso compartido de código en la comunidad de desarrollo.

Ya puedes empezar a trabajar en el primer ejercicio de la última tarea del curso: **Modularizando Mini-Turtle**

### 🎯 Objetivo

El objetivo de esta tarea es transformar el código inicial de las funciones `adelante()` y `abajo()` en un paquete Python distribuible llamado `mini_turtle`. Esto demostrará la comprensión de la modularidad, la separación de la lógica (el estado y las funciones) de la interfaz (`__init__.py`) y la preparación para la distribución (`pyproject.toml`).

### ⚙️ Requerimientos Funcionales

El paquete debe funcionar de la siguiente manera:

- **Lógica del Dibujo**: Debe mantener un estado global de la posición (la variable `posicion_x`).
- **Interfaz Limpia**: Los usuarios deben poder importar las funciones directamente desde el nombre del paquete.

    ```python
    from mini_turtle import adelante, abajo
    ```

- **Nueva Funcionalidad**: Debe añadir una función `reiniciar()` que resetee la posición a `posicion_x = 0`.

### 📦 Estructura del Proyecto Requerida

Su entrega debe seguir esta estructura de directorios exacta:

```plaintext
mini_turtle_task/
├── mini_turtle/             <-- Carpeta del Paquete
│   ├── __init__.py          <-- La Interfaz
│   └── drawer_logic.py      <-- La Lógica y el Estado
├── main.py                  <-- Script de prueba del usuario
├── pyproject.toml           <-- Metadatos y Configuración
└── README.md                <-- Documentación
```

### 📝 Implementación Paso a Paso

**Paso 1: Módulo de Lógica (`mini_turtle/drawer_logic.py`)**

Cree este archivo. Debe contener el estado global y todas las funciones de dibujo (`adelante`, `abajo`) y la nueva función `reiniciar`.

**Contenido Clave**:

- La variable `posicion_x` (estado global).
- Las funciones `adelante(pasos)` y `abajo(pasos)`.
- La nueva función `reiniciar()` para poner `posicion_x = 0`. Recuerde usar `global posicion_x`.

**Paso 2: Archivo de Interfaz (`mini_turtle/__init__.py`)**

Este archivo es la puerta de entrada. Debe importar las funciones públicas desde el archivo `drawer_logic.py` para exponerlas al usuario.

**Contenido Clave**:

- Use `from .drawer_logic import adelante, abajo, reiniciar`.
- Defina la lista `__all__` y la variable `__version__`.

**Paso 3: Script de Prueba (`main.py`)**

Cree este archivo fuera del paquete `mini_turtle`. Este script demostrará que su paquete funciona y que el estado se mantiene a lo largo de las llamadas.

**Contenido Requerido**:

- Importe las tres funciones: `from mini_turtle import adelante, abajo, reiniciar`.
- Dibuje una escalera de 2 escalones para acumular la posición.
- Llame a `reiniciar()`.
- Dibuje otro objeto (ej: un poste) para demostrar que la posición se reseteó a la columna 0.

**Paso 4: Configuración y Documentación**

- **`pyproject.toml`**: Cree el archivo de configuración con los metadatos del paquete (nombre, versión, autor, etc.). Puede usar el ejemplo de `mini-geom-calculator` como plantilla, cambiando el nombre del proyecto a `mini-turtle-drawer`.
- **`README.md`**: Escriba una breve documentación que explique qué hace el paquete y muestre un ejemplo de uso (como el contenido de `main.py`).

!!! note
    Hemos aprendido a lo largo de este flujo completo (Estructura interna → Configuración TOML → Construcción → Publicación) cómo no solo implementar la modularidad, sino también cómo crear software reutilizable y distribuible. Esta comprensión integral nos permite desarrollar paquetes Python que otros pueden instalar y utilizar fácilmente, facilitando la colaboración y el uso compartido de código en la comunidad de desarrollo.