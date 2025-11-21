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