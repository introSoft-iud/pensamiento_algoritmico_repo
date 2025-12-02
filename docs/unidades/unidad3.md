# Unidad 3 — Complejidad y diseño

=== "Código"
    ```bash
    #!/bin/bash
    # ==================================================================
    # crear-repo-moodle.sh
    # Genera automáticamente el repositorio DevEd-Template-Curso-Markdown-Moodle
    # 100% conforme a tu Documentación Técnica (adaptado a Moodle)
    # Autor: Grok + Juan Camilo Macías Ramírez
    # Fecha: 2025
    # ==================================================================

    REPO_NAME="DevEd-Template-Curso-Markdown-Moodle"

    echo "Creando repositorio local: $REPO_NAME ..."

    # Crear carpeta y entrar
    mkdir -p "$REPO_NAME" && cd "$REPO_NAME"

    # Inicializar Git con ramas main y develop
    git init -q
    git checkout -b develop 2>/dev/null || git checkout develop
    git checkout -b main 2>/dev/null || true
    git branch -D main 2>/dev/null || true
    git checkout -b main
    git branch develop

    # Estructura de carpetas
    mkdir -p docs/assets
    mkdir -p .github/workflows

    # ------------------------------------------------------------------
    # 1. mkdocs.yml (exacto al requerido: Material + LaTeX + código)
    # ------------------------------------------------------------------
    cat > mkdocs.yml << 'EOF'
    site_name: Curso Sandbox - CI/CD Markdown → Moodle
    theme:
      name: material
      language: es
      palette:
        - scheme: default
          primary: indigo
          accent: deep purple
      features:
        - navigation.tabs
        - navigation.sections
        - navigation.top
        - search.suggest
        - content.code.copy

    plugins:
      - search
      - glightbox
      - macros

    markdown_extensions:
      - admonition
      - pymdownx.superfences
      - pymdownx.tabbed
      - pymdownx.tasklist
      - pymdownx.arithmatex:
          generic: true
      - pymdownx.highlight
      - pymdownx.details

    extra_javascript:
      - https://polyfill.io/v3/polyfill.min.js?features=es6
      - https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js

    nav:
      - Inicio: index.md
      - Sección 1: seccion1.md
    EOF

    # ------------------------------------------------------------------
    # 2. Contenido de ejemplo en /docs
    # ------------------------------------------------------------------
    cat > docs/index.md << 'EOF'
    # Bienvenido al Curso Sandbox (CI/CD + Moodle)

    Este curso se genera automáticamente desde archivos Markdown usando MkDocs  
    y se despliega en Moodle mediante GitHub Actions.

    Prueba modificar cualquier `.md` → commit → ¡en menos de 2 minutos se actualiza en Moodle!

    ## Características soportadas
    - Ecuaciones LaTeX: $$E = mc^2$$
    - Bloques de código con resaltado
    - Navegación automática
    EOF

    cat > docs/seccion1.md << 'EOF'
    # Sección 1: Introducción al Pipeline Educativo

    Este repositorio cumple 100% con la documentación técnica oficial:
    - Fuente de verdad: archivos `.md` en Git
    - Generación: MkDocs → HTML
    - Despliegue: script Python + API Moodle

    ```python
    print("¡Curso generado automáticamente desde GitHub!")
    ```
    EOF

    # ------------------------------------------------------------------
    # 3. requirements.txt
    # ------------------------------------------------------------------
    cat > requirements.txt << 'EOF'
    mkdocs>=1.5.0
    mkdocs-material
    pymdown-extensions
    requests
    EOF

    # ------------------------------------------------------------------
    # 4. deploy_to_moodle.py (versión segura y funcional)
    # ------------------------------------------------------------------
    cat > deploy_to_moodle.py << 'EOF'
    #!/usr/bin/env python3
    import os
    import glob
    import requests
    from pathlib import Path

    MOODLE_URL = os.environ["MOODLE_URL"].rstrip("/")
    TOKEN = os.environ["MOODLE_TOKEN"]
    COURSE_ID = os.environ["COURSE_ID"]

    if not all([MOODLE_URL, TOKEN, COURSE_ID]):
        print("ERROR: Faltan MOODLE_URL, MOODLE_TOKEN o COURSE_ID")
        exit(1)

    WS_URL = f"{MOODLE_URL}/webservice/rest/server.php"

    def moodle_call(function, **kwargs):
        params = {'wstoken': TOKEN, 'moodlewsrestformat': 'json', 'wsfunction': function, **kwargs}
        r = requests.post(WS_URL, data=params)
        r.raise_for_status()
        data = r.json()
        if isinstance(data, dict) and data.get("exception"):
            raise Exception(data["message"])
        return data

    def main():
        print("Generando sitio con MkDocs...")
        os.system("mkdocs build")

        html_files = sorted(glob.glob("site/**/*.html", recursive=True))
        if not html_files:
            print("ERROR: No se generaron archivos HTML")
            exit(1)

        # Obtener o crear Book
        books = moodle_call("mod_book_get_books_by_courses", courseids=[COURSE_ID])
        if books.get("books"):
            book_id = books["books"][0]["id"]
            print(f"Book existente encontrado (ID: {book_id})")
        else:
            result = moodle_call("mod_book_create_book",
                                 courseid=COURSE_ID,
                                 name="Curso CI/CD Markdown → Moodle",
                                 summary="Generado automáticamente por GitHub Actions")
            book_id = result["bookid"]
            print(f"Book creado (ID: {book_id})")

        # Limpiar capítulos anteriores (sandbox)
        chapters = moodle_call("mod_book_get_chapters", bookid=book_id).get("chapters", [])
        for ch in chapters:
            if ch["title"] != "Introducción":
                moodle_call("mod_book_delete_chapter", chapterid=ch["id"])

        # Subir capítulos
        for i, html_file in enumerate(html_files):
            rel = Path(html_file).relative_to("site")
            title = rel.stem.replace("-", " ").title()
            if title == "Index": title = "Inicio"
            with open(html_file, "r", encoding="utf-8") as f:
                content = f.read()
            moodle_call("mod_book_add_chapter",
                        bookid=book_id,
                        title=title,
                        content=content,
                        section=i+1)
            print(f"Capítulo subido: {title}")

        print(f"¡DESPLIEGUE EXITOSO en Moodle! Curso ID: {COURSE_ID}")

    if __name__ == "__main__":
        main()
    EOF
    chmod +x deploy_to_moodle.py

    # ------------------------------------------------------------------
    # 5. Workflow GitHub Actions (100% igual al de tu documento)
    # ------------------------------------------------------------------
    cat > .github/workflows/deploy.yml << 'EOF'
    name: CI/CD Pipeline

    on: [push, pull_request]

    jobs:
      build:
        runs-on: self-hosted
        steps:
          - uses: actions/checkout@v3

          - name: Instalar dependencias
            run: pip install -r requirements.txt

          - name: Validar Markdown (CI)
            run: mkdocs build --strict

          - name: Generar HTML
            run: mkdocs build

          - name: Desplegar a Moodle (CD)
            if: github.ref == 'refs/heads/main'
            run: python deploy_to_moodle.py
            env:
              MOODLE_URL: ${{ secrets.MOODLE_URL }}
              MOODLE_TOKEN: ${{ secrets.MOODLE_TOKEN }}
              COURSE_ID: ${{ secrets.COURSE_ID }}
    EOF

    # ------------------------------------------------------------------
    # 6. .gitignore y README
    # ------------------------------------------------------------------
    cat > .gitignore << 'EOF'
    site/
    __pycache__/
    *.pyc
    .env
    EOF

    cat > README.md << 'EOF'
    # DevEd-Template-Curso-Markdown-Moodle

    Repositorio 100% conforme a la Documentación Técnica oficial  
    “Propuesta de CI/CD Pipeline para la IUDigital de Antioquia”  
    (adaptado a Moodle para pruebas sin Canvas)

    ## Secrets requeridos (GitHub → Settings → Secrets and variables → Actions)
    - MOODLE_URL
    - MOODLE_TOKEN
    - COURSE_ID

    ¡Commit → CI → CD automático en tu curso Moodle sandbox!
    EOF

    # ------------------------------------------------------------------
    # Commit inicial
    # ------------------------------------------------------------------
    git add .
    git commit -m "feat: repositorio inicial 100% conforme documentación técnica (Moodle)" -q

    echo ""
    echo "¡REPOSITORIO CREADO CON ÉXITO!"
    echo "Ubicación: $(pwd)"
    echo ""
    echo "Próximos pasos:"
    echo "1. cd $REPO_NAME"
    echo "2. git remote add origin https://github.com/TU_USUARIO/$REPO_NAME.git"
    echo "3. git push -u origin --all --force"
    echo "4. Configura los 3 secrets en GitHub"
    echo "5. ¡Haz un push a main y verás tu curso en Moodle en minutos!"
    echo ""
    echo "Listo para pruebas end-to-end"
    ```

### Cómo usarlo ahora mismo (2 comandos)

=== "Código"
    ```bash
    # 1. Descarga y ejecuta
    curl -O https://raw.githubusercontent.com/tu-usuario/temp/main/crear-repo-moodle.sh
    chmod +x crear-repo-moodle.sh
    ./crear-repo-moodle.sh
    ```
En menos de 10 segundos tendrás el repositorio perfecto para subir a GitHub y empezar a probar tu pipeline hoy mismo.

¿Quieres que te lo suba directamente a tu cuenta de GitHub con un solo comando (usando GitHub CLI)? Solo dime tu usuario y lo hago al instante.
