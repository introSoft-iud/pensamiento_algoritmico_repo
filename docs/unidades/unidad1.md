# Unidad 1

Bienvenido a la primera unidad de tu curso en *Pensamiento Algorítmico*. En esta unidad comenzaremos estudiando las variables y las principales estructuras de datos en Python.
## El Hardware

Sección en construcción. Para entender cómo funciona el hardware, te invito a que veas el siguiente video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/QZwneRb-zqA" frameborder="0" allowfullscreen></iframe>

Una vez veas el video anterior, es bueno echar un vistazo a la forma moderna de estas tecnologías. Para esto, te invito a ver este video donde se recrea la estructura microscópica de una memoria SSD moderna:
<iframe width="560" height="315"
  src="https://www.youtube.com/embed/5Mh3o886qpg?start=51"
  title="Video de YouTube"
  frameborder="0"
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
  allowfullscreen>
</iframe>

## Software

La conexión entre software y hardware puede ser entendida a partir del siguiente video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/HjneAhCy2N4" frameborder="0" allowfullscreen></iframe>

## Sesión 2: Variables y estructuras de datos

### Los Lenguajes de Programación

En este curso usaremos Python como nuestra puerta de entrada al mundo de la programación. Sin embargo, Python es solo uno de los posibles lenguajes en los que podemos dar instrucciones a los computadores. Python forma parte de lo que conocemos como lenguajes formales.

Los lenguajes formales aparecen en áreas como las matemáticas. Por ejemplo, la expresión $( \int f(x) \, dx = U $) tiene un significado preciso y una sintaxis y unos símbolos "tokens" particulares. En particular, un lenguaje de programación 
*es un lenguaje formal diseñado para expresar computaciones*

Por su parte, los lenguajes naturales, como el español o el francés, son creaciones culturales que reflejan en parte la complejidad de la experiencia humana. Por tanto, tienen la capacidad de expresar muchas cosas de manera ambigua, redundante, con doble sentido, chistes, poesía, etc.

!!! admonition "Consulta más detalles"
    Puedes consultar la referencia para más detalles: [The Way of the Program](https://openbookproject.net/thinkcs/python/english3e/way_of_the_program.html).

Hoy en día, los modelos de lenguaje LLM en los que se basan los sistemas de inteligencia artificial más populares están haciendo posible que creemos instrucciones para los computadores en lenguaje natural. Pero esto no significa que aprender a hablar en Python y similares no sea importante. Primero, es la herramienta que te permitirá pensar computacionalmente, y segundo, el paradigma que se impone es una mezcla de los dos lenguajes. Construiremos código para ciertas instrucciones y veremos que en otras partes será más apropiado crear la instrucción en lenguaje natural.

La buena noticia es que aprender un lenguaje de programación resulta más fácil que aprender francés o español. De hecho, un lenguaje de programación y toda la magia que se deriva de ellos, como el internet y el machine learning, se basa en los siguientes elementos básicos:

![alt text](image.png)

- **Entrada:** Obtener datos desde el teclado, un archivo u otro dispositivo.
- **Salida:** Mostrar datos en la pantalla o enviar datos a un archivo u otro dispositivo.
- **Matemáticas:** Realizar operaciones matemáticas básicas como la suma y la multiplicación.
- **Ejecución condicional:** Verificar ciertas condiciones y ejecutar la secuencia de instrucciones apropiada.
- **Repetición:** Realizar una acción repetidamente, usualmente con alguna variación.

Créelo o no, eso es prácticamente todo. Cada programa que has usado, sin importar cuán complicado sea, está compuesto de instrucciones que se parecen más o menos a estas. Así, podemos describir la programación como el proceso de descomponer una tarea grande y compleja en subtareas cada vez más pequeñas hasta que las subtareas sean lo suficientemente simples como para ser realizadas con secuencias de estas instrucciones básicas.

Aunque esto puede parecer un poco vago, volveremos a este tema más adelante cuando hablemos de algoritmos. 

### Variables, expressions and statements
Una variable es un nombre que usamos para hacer referencia a un valor que guardamos en la memoria del computador.

Para imaginarlo mejor, supongamos que la memoria de un computador es tan grande como la ciudad de Medellín, que tiene aproximadamente 2.5 millones de habitantes y una superficie de 380 km².

Ahora bien, piensa en una unidad SSD (unidad de estado sólido) expandida hasta cubrir toda esa área. Si cada celda de memoria (trampa de electrones que almacena un bit) fuera del tamaño de un apartamento de 20 nm × 20 nm, y se construyeran 1000 pisos de estos apartamentos uno sobre otro (como edificios), esa “Medellín‑SSD” estaría completamente cubierta por edificios de memoria.

En total, una SSD de ese tamaño y configuración podría almacenar aproximadamente:

$$
30 \text{ trillones de trillones} = 2.97 \times 10^{25} \text{ enteros de 32 bits}
$$

Es decir, una ciudad poblada por más de 30 sextillones de “habitantes‑dato”, donde cada uno representa un valor almacenado en la memoria.
La cuestión es cómo llevar un registro de dónde viven las personas (valores, datos) que habitan una ciudad tan descomunalmente grande.
![alt text](image-1.png)

!!! admonition "Piensa en esto"
    ¿Cómo guardarías de manera eficiente un registro de dónde están almacenadas las cosas en la memoria?

Una idea sería, por ejemplo, tener una carpeta de sobres apilados en orden alfabético. Cada sobre tiene el nombre de la persona y dentro del sobre está la dirección. Entonces, por ejemplo, "don_juan" vive en Edificio Torre Malibú, Carrera 68 #32c-24, Int. 301.

En programación, esto se asemeja a cómo se utilizan las variables para hacer referencia a direcciones en memoria. Aquí tienes un ejemplo en Python:

```python
&aqui quiero ver eejeplos de variables y su direccion en la memoria&
```

En este ejemplo, `don_juan` es el nombre de la variable que hace referencia a una dirección específica en la memoria, similar a cómo un nombre en un sobre hace referencia a una dirección en la ciudad.

