# Copilot Agent Instructions (Base)

## Code Quality Agent
- Enforce PEP8/code style
- Ensure tests exist for all business logic
- Check for dead code and unused imports
- Verify type hints are used where possible

## Security Agent
- Check for hardcoded secrets/credentials
- Ensure dependencies are up to date
- Validate input sanitization
- Check for common vulnerabilities (OWASP Top 10)

## Performance Agent
- Identify inefficient code (N+1 queries, etc.)
- Recommend caching where appropriate
- Check for unnecessary memory usage
- Suggest async where beneficial

## Deployment Agent
- Ensure Dockerfile exists (if applicable)
- Check for CI/CD configuration
- Validate environment variable usage
- Ensure production settings are enabled
