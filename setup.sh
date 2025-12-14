#!/bin/bash

set -e

echo "🤖 Setting up AI Agents and Project Environment..."

# Check for existing folders that would be overwritten
if [ -d ".github" ]; then
  echo "⚠️  Warning: .github folder already exists and will be overwritten"
fi


# ==================== AGENT SETUP ====================
setup_core() {
  echo ""
  echo "📋 Copying Core Agents..."
  mkdir -p .github/agents .vscode
  cp core/agents/copilot-instructions.md .github/
  cp -r core/agents/{Q,S,P,D}-*.md .github/agents/
  cp core/agents/README.md .github/agents/
  cp core/vscode/tasks.json .vscode/
  echo "✓ Core agents ready (Q, S, P, D)"
}

# ==================== FRAMEWORK SETUP ====================
setup_flask() {
  echo ""
  echo "🔧 Setting up Flask Environment..."
  echo ""
  echo "  📎 Adding Flask-specific agent contexts..."
  echo "" >> .github/copilot-instructions.md
  cat frameworks/flask/agent-additions.md >> .github/copilot-instructions.md
  cp frameworks/flask/*additions.md .github/agents/
  echo "  ✓ Agent contexts updated"
  echo ""
  echo "  🏗️  Creating Flask project structure..."
  cp -r frameworks/flask/project-structure/* .
  cp frameworks/flask/docker-compose.yml .
  echo "  ✓ Project scaffold created"
}


setup_core

# Ask if user wants Flask additions
echo ""
read -p "$(echo -e '\033[31m')Setup Flask environment with agents and project scaffold? (y/N):$(echo -e '\033[0m') " flask_choice
if [[ "$flask_choice" =~ ^[Yy]$ ]]; then
  setup_flask
fi

# Ask about cleanup
echo ""
read -p "$(echo -e '\033[31m')Remove .git folder and clean up template files? (y/N):$(echo -e '\033[0m') " cleanup_choice
if [[ "$cleanup_choice" =~ ^[Yy]$ ]]; then
  echo ""
  echo "🧹 Cleaning up template files..."
  [ -d ".git" ] && rm -rf .git && echo "  ✓ Removed .git folder (disconnected from template repo)"
  [ -d "core" ] && rm -rf core && echo "  ✓ Removed core/"
  [ -d "frameworks" ] && rm -rf frameworks && echo "  ✓ Removed frameworks/"
  [ -f "setup.sh" ] && rm -f setup.sh && echo "  ✓ Removed setup.sh"
  [ -f "README.md" ] && rm -f README.md && echo "  ✓ Removed README.md"
  [ -f ".gitignore" ] && rm -f .gitignore && echo "  ✓ Removed .gitignore"
  [ -f "LICENSE" ] && rm -f LICENSE && echo "  ✓ Removed LICENSE"
else
  echo "Skipped cleanup. Template files remain in your project."
fi

echo ""
echo "🎉 Done! Your project is ready."
