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

## Implementación POO: La Calculadora Geométrica

Aplicaremos estos conceptos para crear clases que modelen las figuras geométricas, llevando la lógica de `calculations.py` al interior de los objetos.

### 3.1. Módulo `shape_models.py` (La Lógica con Clases)

```python
# mini_geom_oo/shape_models.py
import math

class Circulo:
    """Modela un círculo, encapsulando su radio y fórmulas."""

    # CONSTRUCTOR: Define el estado inicial del objeto
    def __init__(self, radio):
        if radio < 0:
            raise ValueError("El radio no puede ser negativo.")
        self.radio = radio  # Atributo de la instancia

    # MÉTODO: Calcula el área usando el atributo 'self.radio'
    def calcular_area(self):
        return math.pi * self.radio**2

class Rectangulo:
    """Modela un rectángulo, encapsulando sus lados."""

    # CONSTRUCTOR: Define el estado inicial del objeto
    def __init__(self, lado_a, lado_b):
        if lado_a < 0 or lado_b < 0:
            raise ValueError("Los lados no pueden ser negativos.")
        self.lado_a = lado_a  # Atributo de la instancia
        self.lado_b = lado_b  # Atributo de la instancia

    # MÉTODO: Calcula el área
    def calcular_area(self):
        return self.lado_a * self.lado_b

    # MÉTODO: Calcula el perímetro
    def calcular_perimetro(self):
        return 2 * (self.lado_a + self.lado_b)
```

### 4. 📦 Estructura del Paquete POO (mini_geom_oo)

Para empaquetar y distribuir esta nueva versión POO, seguimos la misma estructura modular que aprendimos la clase pasada.

#### 4.1. Estructura de Archivos

```
mini_geom_oo_project/
├── mini_geom_oo/      <-- Carpeta del Paquete
│   ├── __init__.py      <-- Interfaz (Exporta las Clases)
│   └── shape_models.py  <-- Lógica (Contiene las Clases Circulo y Rectangulo)
├── main.py              <-- Script de prueba
└── pyproject.toml       <-- Configuración
```

#### 4.2. Interfaz Pública (`mini_geom_oo/__init__.py`)

El archivo de interfaz solo necesita importar las Clases desde el módulo de lógica interna.

```python
# mini_geom_oo/__init__.py

# Importamos y exportamos las clases completas
from .shape_models import Circulo, Rectangulo

__version__ = "2.0.0"
__all__ = ["Circulo", "Rectangulo"]
```

#### 4.3. Uso por el Usuario (`main.py`)

El usuario final interactúa únicamente con las clases importadas, reforzando la abstracción.

```python
# main.py

# 1. Importamos las Clases
from mini_geom_oo import Circulo, Rectangulo

print("--- Uso de Objetos Geométricos ---")

# Creamos un objeto, el constructor se encarga de almacenar el radio=5
mi_circulo = Circulo(radio=5) 

# Invocamos el comportamiento del objeto
area_c = mi_circulo.calcular_area()

print(f"Área del círculo (Radio {mi_circulo.radio}): {area_c:.2f}")

# Creamos otro objeto, el constructor almacena lado_a=10 y lado_b=4
mi_cancha = Rectangulo(lado_a=10, lado_b=4)

# Invocamos el comportamiento del objeto
perimetro_r = mi_cancha.calcular_perimetro()

print(f"Perímetro del rectángulo (Lados {mi_cancha.lado_a}x{mi_cancha.lado_b}): {perimetro_r}")
```

Este enfoque convierte las variables de entrada de las funciones anteriores (`radio`, `lado_a`, `lado_b`) en atributos de los nuevos objetos, logrando el objetivo de estructurar el material usando clases y encapsulamiento.

## Explicación de los Archivos Restantes para Construir el Paquete Final

### 1. 📄 `pyproject.toml`: La Cédula del Proyecto

Este archivo es crucial para definir qué es el paquete y qué necesita para funcionar. Es el estándar moderno de Python.

**Analogía:** Es como el documento de identidad o la etiqueta de envío de una caja. Le dice a `pip`: "Este paquete se llama así, es la versión X, y lo hizo tal persona".

**Estructura para `mini_geom_oo`:**

Guarde este contenido en la raíz del proyecto (`mini_geom_oo_project/pyproject.toml`):

```ini
[build-system]
# Define qué herramientas se usan para "construir" la caja.
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
# --- Metadatos Generales ---
name = "mini-geom-oo"              # El nombre para pip install
version = "2.0.0"                  # Versión (coincide con __init__.py)
description = "Calculadora geométrica usando POO y Clases."
readme = "README.md"               # El archivo que describe el proyecto
authors = [
    {name = "Tu Nombre", email = "tu@email.com"},
]
license = {text = "MIT License"}
requires-python = ">=3.7"          # Versión mínima de Python necesaria

# --- Palabras Clave para Búsqueda ---
keywords = ["geometria", "poo", "educacion"]
```

### 2. 📖 `README.md`: El Manual de Instrucciones

Es la cara del proyecto. Cuando alguien entra a su repositorio o descarga el paquete, esto es lo primero que lee.

**Importancia:** Un buen código sin documentación es inútil para otros.

**Contenido Clave:** Debe mostrar cómo instalar y cómo instanciar los objetos (ya que ahora usamos clases).

Guarde esto en la raíz (`mini_geom_oo_project/README.md`):

```markdown
# Mini Geom OO 📐

Una librería educativa que modela figuras geométricas usando Programación Orientada a Objetos (POO).

## 🚀 Instalación

```bash
pip install mini-geom-oo
```

## ✨ Cómo Usar (Ejemplo con Objetos)

A diferencia de las versiones anteriores, aquí debes crear objetos (instancias) de las figuras.

```python
from mini_geom_oo import Circulo, Rectangulo

# 1. Crear un objeto Círculo (instanciación)
mi_circulo = Circulo(radio=10)

# 2. Usar sus métodos
print(f"Área: {mi_circulo.calcular_area()}")

# 3. Crear un objeto Rectángulo
mi_cancha = Rectangulo(lado_a=20, lado_b=10)
print(f"Perímetro: {mi_cancha.calcular_perimetro()}")
```
```

### 3. ⚖️ `LICENSE` y `.gitignore`: Higiene del Proyecto

Aunque son simples, son vitales para un proyecto profesional.

#### `LICENSE` (Permisos)

Es un archivo de texto simple que dice qué pueden hacer otros con tu código. Para educación, solemos usar la licencia **MIT** (libre uso).

**Contenido:** Simplemente pegue el texto de la licencia MIT estándar en un archivo llamado `LICENSE`.

#### `.gitignore` (Limpieza)

Le dice a Git: "No guardes estos archivos basura". Es crucial para no subir archivos compilados o temporales al repositorio.

Guarde esto en `.gitignore`:

```text
__pycache__/
dist/
*.egg-info/
.venv/
```

### 4. 🛠️ Cómo Usar Estos Archivos (El Flujo de Construcción)

Una vez que todos los archivos están creados, el proceso para convertir esa carpeta en un paquete distribuible es el siguiente. Explique esto como una "receta de cocina":

#### Paso A: Instalar el Constructor

Necesitamos la herramienta que sabe leer el `pyproject.toml`.

```bash
pip install build
```

#### Paso B: Generar el Paquete ("Build")

Este comando lee el `pyproject.toml`, toma el código de `mini_geom_oo/` y crea los archivos empaquetados.

```bash
# Ejecutar desde la carpeta raíz (donde está pyproject.toml)
python -m build
```

**Resultado:** Se creará automáticamente una carpeta `dist/` con dos archivos:

- `.tar.gz` (Código fuente comprimido).
- `.whl` (Wheel: El formato listo para instalar).

#### Paso C: Instalación y Prueba

Ahora, sus estudiantes pueden simular que descargaron el paquete de internet instalándolo desde su carpeta `dist/`.

```bash
# Instalar el archivo .whl generado
pip install ./dist/mini_geom_oo-2.0.0-py3-none-any.whl
```

#### Paso D: Verificación

Ahora pueden ejecutar el `main.py` original. Si funciona, ¡felicidades! Han creado, empaquetado e instalado su propia librería orientada a objetos.

### 🎓 Resumen para la Clase

| Archivo           | Rol                | Pregunta que responde                           |
|-------------------|--------------------|-------------------------------------------------|
| `__init__.py`     | Interfaz           | ¿Qué clases exporto al usuario?                 |
| `shape_models.py` | Lógica             | ¿Cómo funcionan mis objetos internamente?       |
| `pyproject.toml`  | Configuración      | ¿Cómo se llama y versiona mi paquete?           |
| `README.md`       | Documentación      | ¿Cómo uso estos objetos?                        |
| `dist/*.whl`      | Producto Final     | ¿Qué archivo le envío a mis usuarios?           |