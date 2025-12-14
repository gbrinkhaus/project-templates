# S: Security Agent - Flask Additions

Apply these additional checks when auditing Flask projects:

## Flask-Specific Security
- Check for `DEBUG = False` in production configs
- Verify SECRET_KEY is loaded from environment variable
- Check for SQL injection (especially if bypassing Repository Pattern)
- Verify CORS configuration isn't too permissive
- Validate that no temp, payload, or other files are written to the repository tree

## Project-Specific
- Validate flag logic (U/D/W codes) doesn't expose vulnerabilities
