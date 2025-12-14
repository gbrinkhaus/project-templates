# P: Performance Agent - Flask Additions

Apply these additional checks when analyzing Flask project performance:

## Flask-Specific Performance
- Ensure using Gunicorn/uWSGI in production, not `flask run`
- Check for N+1 queries in Repository/Service layers
- Verify database connection pooling is configured
- Optimize external API calls

## Architecture Performance
- Review Repository queries for efficiency
- Check Service Layer for batch operations vs. individual calls
