# Unidad 1

Bienvenido a la primera unidad de tu curso en *Pensamiento Algorítmico*. En esta unidad comenzaremos estudiando las variables y las principales estructuras de datos en Python.
## El Hardware

Sección en construcción. Para entender cómo funciona el hardware, te invito a que veas el siguiente video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/QZwneRb-zqA" frameborder="0" allowfullscreen></iframe>

Una vez veas el video anterior, es bueno echar un vistazo a la forma moderna de estas tecnologías. Para esto, te invito a ver este video donde se recrea la estructura microscópica de una memoria SSD moderna:

<iframe width="560" height="315" src="https://www.youtube.com/embed/5Mh3o886qpg?t=51s" frameborder="0" allowfullscreen></iframe>
## Software

La conexión entre software y hardware puede ser entendida a partir del siguiente video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/HjneAhCy2N4" frameborder="0" allowfullscreen></iframe>

## Sesión 2: Variables y estructuras de datos
## Los Lenguajes de Programación

En este curso usaremos Python como nuestra puerta de entrada al mundo de la programación. Sin embargo, Python es solo uno de los posibles lenguajes en los que podemos dar instrucciones a los computadores. Python forma parte de lo que conocemos como lenguajes formales. 

Los lenguajes formales son lenguajes diseñados por personas para aplicaciones específicas. Por ejemplo, la notación que utilizan los matemáticos es un lenguaje formal particularmente bueno para denotar relaciones entre números y símbolos. Los químicos usan un lenguaje formal para representar la estructura química de las moléculas. Y lo más importante:

Los lenguajes de programación son lenguajes formales diseñados para expresar cálculos. Las reglas de sintaxis vienen en dos tipos, relacionadas con los tokens y la estructura. Los tokens son los elementos básicos del lenguaje, como palabras, números, paréntesis, comas, etc. En Python, una declaración como `print("Feliz Año Nuevo para ", 2013)` tiene 6 tokens: un nombre de función, un paréntesis de apertura, una cadena de texto, una coma, un número y un paréntesis de cierre.

Es posible cometer errores en la forma en que se construyen los tokens. Uno de los problemas con `3=+6$` es que `$` no es un token legal en matemáticas (al menos hasta donde sabemos). De manera similar, `2Zz` no es un token legal en notación química porque no hay un elemento con la abreviatura Zz.

El segundo tipo de regla de sintaxis se refiere a la estructura de una declaración, es decir, la forma en que se organizan los tokens. La declaración `3=+6$` es estructuralmente ilegal porque no se puede colocar un signo más inmediatamente después de un signo igual. De manera similar, las fórmulas moleculares deben tener subíndices después del nombre del elemento, no antes. Y en nuestro ejemplo de Python, si omitiéramos la coma, o si cambiáramos los dos paréntesis para decir `print)"Feliz Año Nuevo para ", 2013(`, nuestra declaración seguiría teniendo seis tokens legales y válidos, pero la estructura sería ilegal.

Cuando lees una oración en inglés o una declaración en un lenguaje formal, tienes que averiguar cuál es la estructura de la oración (aunque en un lenguaje natural lo haces de manera subconsciente). Este proceso se llama análisis sintáctico o parsing.

Por ejemplo, cuando escuchas la oración, "El otro zapato cayó", entiendes que "el otro zapato" es el sujeto y "cayó" es el verbo. Una vez que has analizado una oración, puedes averiguar qué significa, o la semántica de la oración. Suponiendo que sabes qué es un zapato y qué significa caer, entenderás la implicación general de esta oración.

Aunque los lenguajes formales y naturales tienen muchas características en común —tokens, estructura, sintaxis y semántica—, existen muchas diferencias:

- **Ambigüedad:** Los lenguajes naturales están llenos de ambigüedad, que las personas manejan utilizando pistas contextuales y otra información. Los lenguajes formales están diseñados para ser casi o completamente no ambiguos, lo que significa que cualquier declaración tiene exactamente un significado, independientemente del contexto.
  
- **Redundancia:** Para compensar la ambigüedad y reducir malentendidos, los lenguajes naturales emplean mucha redundancia. Como resultado, a menudo son verbosos. Los lenguajes formales son menos redundantes y más concisos.
  
- **Literalidad:** Los lenguajes formales significan exactamente lo que dicen. Por otro lado, los lenguajes naturales están llenos de modismos y metáforas. Si alguien dice, "El otro zapato cayó", probablemente no hay ningún zapato ni nada cayendo. Necesitarás encontrar la broma original para entender el significado idiomático de "el otro zapato cayendo". ¡Yahoo! Respuestas cree que lo sabe.

Las personas que crecen hablando un lenguaje natural —todos— a menudo tienen dificultades para adaptarse a los lenguajes formales. En algunos aspectos, la diferencia entre el lenguaje formal y natural es como la diferencia entre poesía y prosa, pero más aún.

Finalmente, para más información, puedes consultar la referencia: [The Way of the Program](https://openbookproject.net/thinkcs/python/english3e/way_of_the_program.html).
