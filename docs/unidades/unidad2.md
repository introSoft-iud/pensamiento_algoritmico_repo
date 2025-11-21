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

!!! warning "Precaución: Asignación vs Igualdad" Es especialmente importante distinguir entre una sentencia de asignación y una expresión booleana que prueba igualdad.
