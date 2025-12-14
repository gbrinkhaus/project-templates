
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
   
   The script will guide you through:
   - **Step 1:** Copy core agents (Q, S, P, D) to your project
   - **Step 2:** Optional—add Flask environment with framework-specific agents and project scaffold
   - **Step 3:** Optional—disconnect from the template repo and clean up

4. **Initialize your own git repo**:
   ```sh
   git init
   git add .
   git commit -m "Initial commit from template"
   ```

---

## What You Get After Setup

### ✅ Agent Configuration
After running setup, your `.github/agents/` folder contains:
- **Q-quality.md** - Code structure, testing, refactoring
- **S-security.md** - Secrets, injection, auth, dependencies
- **P-performance.md** - Algorithms, database queries, caching, async
- **D-deployment.md** - Config, CI/CD, logging, containers, migrations

### ✅ Framework Scaffold (if Flask selected)
If you chose Flask during setup, your project also includes:
- **app/** - Application structure with blueprints template
- **docker-compose.yml** - Docker setup for local development
- **Framework-specific agent contexts** - Added to each agent file

---

## Using the Specialized Agents

Each agent is a separate file in `.github/agents/`. Open the file you need in your editor:

### How It Works

1. When you need a specific agent review, **open its file** in your editor
2. Copilot will read only that focused agent guidance (not the entire instruction set)
3. Ask your question - Copilot will apply that agent's specialized perspective
4. Close the file when done

### Examples

```
# Open .github/agents/Q-quality.md, then ask:
Review this function for code smells and maintainability issues

# Open .github/agents/S-security.md, then ask:
Audit this authentication code for vulnerabilities

# Open .github/agents/P-performance.md, then ask:
Optimize this database query

# Open .github/agents/D-deployment.md, then ask:
Is this application ready for production?
```

---

## Project Structure

```
project-templates/
├── core/
│   ├── agents/
│   │   ├── README.md                     # How to use agents
│   │   ├── Q-quality.md                  # Code quality agent
│   │   ├── S-security.md                 # Security agent
│   │   ├── P-performance.md              # Performance agent
│   │   └── D-deployment.md               # Deployment agent
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
