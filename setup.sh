#!/bin/bash

set -e

echo "🤖 Setting up AI Agents..."


setup_core() {
  mkdir -p .github .vscode
  cp core/agents/copilot-instructions.md .github/
  cp core/vscode/tasks.json .vscode/
  echo "✓ Base agents configured"
}

setup_flask() {
  echo "" >> .github/copilot-instructions.md
  cat frameworks/flask/agent-additions.md >> .github/copilot-instructions.md
  cp -r frameworks/flask/project-structure/* .
  cp frameworks/flask/docker-compose.yml .
  echo "✓ Flask-specific agents configured"
}


setup_core

# Ask if user wants Flask additions
read -p "Add Flask-specific agent context? (y/N): " flask_choice
if [[ "$flask_choice" =~ ^[Yy]$ ]]; then
  setup_flask
fi

# Ask if user wants to remove .git folder
if [ -d .git ]; then
  read -p "Remove .git folder to disconnect from template repo? (y/N): " git_choice
  if [[ "$git_choice" =~ ^[Yy]$ ]]; then
    rm -rf .git
    echo "✓ Removed .git folder (disconnected from template repo)"
  else
    echo "Skipped .git folder removal."
  fi
fi

echo "🎉 Done! Your agents are ready."
