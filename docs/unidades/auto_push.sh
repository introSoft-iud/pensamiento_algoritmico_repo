#!/bin/bash

# Script para agregar, commitear y hacer push automáticamente

DEFAULT_MESSAGE="mensaje por defecto: shores"

echo "Agregando cambios..."
git add .

echo "Haciendo commit..."
git commit -m "$DEFAULT_MESSAGE"

echo "Enviando a origin/main..."
git push origin main

echo "✔ Proceso completado."
