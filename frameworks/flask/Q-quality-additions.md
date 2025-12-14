# Q: Code Quality Agent - Flask Additions

Apply these additional checks when reviewing Flask projects:

## Architecture Checks
- Verify Dependency Injection via `Container` class is used properly
- Ensure Repository Pattern is followed (no direct SQL or `core/db.py` in business logic)
- Check Service Layer for single-responsibility principle
- Validate MVC separation (routes = controller, services = logic, templates = view)
- Verify that all styling is done via Bootstrap classes

## Flask-Specific Code Quality
- Verify Blueprints are organized by feature
- Check that business logic is separated from route handlers
- Ensure factory pattern is used for app creation
