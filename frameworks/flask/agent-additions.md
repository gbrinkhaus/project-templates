# Flask-Specific Agent Additions

## Security Agent - Flask Additions:
- Check for `DEBUG = False` in production configs
- Verify SECRET_KEY is from environment variable
- Check for SQL injection in raw queries
- Verify CORS configuration isn't too permissive

## Performance Agent - Flask Additions:
- Ensure using Gunicorn/uWSGI, not `flask run`
- Check for N+1 queries in SQLAlchemy
- Verify database connection pooling is configured

## Deployment Agent - Flask Additions:
- Verify health check endpoint exists
- Check for proper logging configuration
- Ensure migrations are automated (Alembic/Flask-Migrate)

## Code Quality Agent - Flask Additions:
- Verify Blueprints are used for organization
- Check that business logic is separated from routes
- Ensure factory pattern is used (`create_app()`)
