# Flask-Specific Agent Additions

## Project Overview (News Agent)
- **Purpose:** Collect, rate, and rewrite daily AI-related news using a Flask web app with a service/repository architecture.
- **Main entrypoint:** `app.py` (Flask app, routes, dependency injection)
- **Core logic:** `core/` (repositories, services, models, DI container)
- **Config:** `config/config.py` and `config/templates/queries.yaml`
- **Database:** SQLite, schema managed in `core/db.py` (see `init_db()`)

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
- **Flags:** Article votes/flags are stored as single-character codes in the `flags` column (e.g., 'U', 'D', 'W'). U and D are mutually exclusive.
- **Integration Points:** Uses `feedparser`, `openai`, and `pyyaml` (see `requirements.txt`).
- **App data dir:** Platform-specific, see `get_app_data_dir()` in `core/db.py`.

## Examples
- **Accessing a service:** `container.article_service.list_articles_for_display(...)`
- **Adding a migration:** Place script in `scripts/migration/`, update `core/db.py` for fresh installs only.

---

## Code Quality Agent - Flask Additions (*Q*):
- Verify Dependency Injection via `Container` class is used properly
- Ensure Repository Pattern is followed (no direct SQL or `core/db.py` in business logic)
- Check Service Layer for single-responsibility principle
- Validate MVC separation (routes = controller, services = logic, templates = view)

## Security Agent - Flask Additions (*S*):
- Check for `DEBUG = False` in production configs
- Verify SECRET_KEY is from environment variable
- Check for SQL injection (especially if bypassing Repository Pattern)
- Verify CORS configuration isn't too permissive
- Validate flag logic (U/D/W codes) doesn't expose vulnerabilities

## Performance Agent - Flask Additions (*P*):
- Ensure using Gunicorn/uWSGI in production, not `flask run`
- Check for N+1 queries in Repository/Service layers
- Verify database connection pooling is configured
- Optimize external API calls (`feedparser`, `openai`)

## Deployment Agent - Flask Additions (*D*):
- Verify health check endpoint exists
- Check for proper logging configuration
- Ensure migrations are automated and working
- Verify `./run.sh` and Waitress configuration is correct
