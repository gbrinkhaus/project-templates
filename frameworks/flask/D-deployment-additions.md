# D: Deployment Agent - Flask Additions

Apply these additional checks when assessing Flask project deployment readiness:

## Flask-Specific Deployment
- Verify `./run.sh` uses Waitress or production-grade server properly
- Check for proper logging configuration
- Ensure migrations are automated and working
- Verify health check endpoint exists
- Validate environment variables are properly documented

## Architecture Deployment
- Ensure `core/db.py` handles schema initialization for fresh installs
- Check database migration scripts are in place
