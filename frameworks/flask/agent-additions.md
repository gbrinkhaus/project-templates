# Flask-Specific Project Context

## Project Overview 
- **Purpose:** Put app purpose here

## Architecture & Patterns
- **Dependency Injection:** All business logic and data access is managed via the `Container` class (`core/container.py`). Always use the container to access services and repositories.
- **Repository Pattern:** Data access is abstracted in `core/repositories.py`. Avoid direct SQL or using `core/db.py` in new code.
- **Service Layer:** Business logic is in `core/services/`. Each service is single-responsibility (e.g., `article_service`, `job_service`).
- **Models:** Defined in `core/models.py`.
- **Templates:** Jinja2 templates in `templates/`.
- **Static assets:** `static/` (Bootstrap, FontAwesome, custom CSS/JS).

## Developer Workflows
- **Run app (dev):** `python app.py` (debug mode)
- **Run app (prod):** `./run.sh` (uses Waitress)
- **Run tests:** `./run_tests.sh [unit|integration|smoke|all]` (prefers venv, uses pytest)
- **Database migrations:** Use scripts in `scripts/migration/`. Never add migration logic to core app code.
- **Fresh install:** `core/db.py` ensures DB and schema are created if missing.

## Conventions & Practices
- **App data dir:** Platform-specific, set via `get_app_data_dir()` in `core/db.py`.

## Examples
- **Adding a migration:** Place script in `scripts/migration/`, update `core/db.py` for fresh installs only.

---

## Specialized Agent Additions for Flask

When using the specialized agents, also reference the Flask-specific additions:

- **Q-quality-additions.md** - Flask code quality checks
- **S-security-additions.md** - Flask security checks
- **P-performance-additions.md** - Flask performance checks
- **D-deployment-additions.md** - Flask deployment checks
