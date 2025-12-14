
# Project Templates: Modular AI Agent Setup

Sharing my standard dev setup with 4 specialized agents (*Q*, *S*, *P*, *D*) that work alongside your default coding assistant.

---

## Setup Instructions

### Clone or Download the Template

```sh
# Clone the template repo
git clone https://github.com/gbrinkhaus/project-templates.git

# Or download as ZIP and extract
```

### Create a New Project from This Template

1. **Create a new project folder** (e.g., `my-new-app`):
   ```sh
   mkdir my-new-app
   cd my-new-app
   ```

2. **Copy the template files** (do not clone):
   ```sh
   cp -r ../project-templates/* ../project-templates/.[!.]* .
   ```
   Or download the template as ZIP and extract into your folder.

3. **Run the setup script**:
   ```sh
   ./setup.sh
   ```
   
   The script will:
   - Ask if you want Flask-specific agent context
   - Ask if you want to disconnect from the template repo (.git removal)
   - Configure your project with base agents and optional framework additions

4. **Initialize your own git repo**:
   ```sh
   git init
   git add .
   git commit -m "Initial commit from template"
   ```

---

## Usage Instructions

### Agent Triggers

Use the specialized agents by prefixing your message in Copilot Chat with:

- *Q* - Code Quality review
- *S* - Security audit
- *P* - Performance analysis
- *D* - Deployment readiness check

### Examples

```
*Q* review this function for maintainability

*S* audit this authentication code for vulnerabilities

*P* optimize this database query

*D* is this ready for production?
```

### What Each Agent Does

| Agent | Focus | Example |
|-------|-------|----------|
| *Q* | Code structure, testing, refactoring | "Check for dead code and suggest improvements" |
| *S* | Secrets, injection, auth, dependencies | "Verify no hardcoded credentials" |
| *P* | Algorithms, database queries, caching, async | "Identify N+1 queries" |
| *D* | Config, CI/CD, logging, containers, migrations | "Verify production readiness" |

---

## Project Structure

```
project-templates/
├── core/
│   ├── agents/
│   │   └── copilot-instructions.md       # Base + 4 specialized agents
│   └── vscode/
│       └── tasks.json                     # Development tasks
├── frameworks/
│   └── flask/
│       ├── agent-additions.md             # Flask-specific contexts
│       ├── project-structure/             # Blueprint templates
│       └── docker-compose.yml             # Docker setup
├── setup.sh                                # Interactive setup script
└── README.md
```

---

## Notes

- **Do not clone** the template repo into your new project folder—always copy/download
- The setup script handles disconnecting from the template automatically
- Framework-specific additions are optional during setup
- Each new project gets its own git history and remote
