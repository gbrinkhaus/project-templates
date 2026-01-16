#!/bin/bash

set -e

# Find the template repo (script is in template-repo/scripts/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_REPO="$(dirname "$SCRIPT_DIR")"

echo "📦 Adding AI Agents to existing project..."
echo "   Source: $TEMPLATE_REPO"
echo ""

# Verify template repo exists
if [ ! -d "$TEMPLATE_REPO/.github/agents" ] || [ ! -f "$TEMPLATE_REPO/copilot-instructions.md" ]; then
  echo "❌ Error: Not a valid template repository"
  echo "   Expected to find:"
  echo "     - $TEMPLATE_REPO/.github/agents/"
  echo "     - $TEMPLATE_REPO/copilot-instructions.md"
  exit 1
fi

# ==================== CONFLICT CHECKS ====================
echo ""
echo "🔍 Checking for existing contents..."

conflicts=0

# Check for .github/agents
if [ -d ".github/agents" ]; then
  echo "⚠️  .github/agents/ already exists"
  conflicts=$((conflicts + 1))
fi

# Check for copilot-instructions.md
if [ -f "copilot-instructions.md" ]; then
  echo "⚠️  copilot-instructions.md already exists"
  conflicts=$((conflicts + 1))
fi



if [ $conflicts -gt 0 ]; then
  echo ""
  echo "❌ Found $conflicts existing file(s)/folder(s) that would be overwritten."
  read -p "$(echo -e '\033[31m')Continue and overwrite? (y/N):$(echo -e '\033[0m') " overwrite_choice
  if [[ ! "$overwrite_choice" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
  fi
fi

# ==================== UPDATE GITIGNORE (FIRST!) ====================
echo ""
echo "📝 Setting up .gitignore..."

if [ -f ".gitignore" ]; then
  if ! grep -q ".github/agents/" .gitignore; then
    echo "" >> .gitignore
    echo "# Agent files synced from project-templates" >> .gitignore
    echo ".github/agents/" >> .gitignore
    echo "sync-agents.sh" >> .gitignore
  fi
else
  echo "# Agent files synced from project-templates" > .gitignore
  echo ".github/agents/" >> .gitignore
  echo "sync-agents.sh" >> .gitignore
fi

echo "✓ .gitignore configured"

# ==================== SETUP AGENTS ====================
echo ""
echo "📋 Setting up agents..."
mkdir -p .github/agents

# Backup existing files if they exist
[ -d ".github/agents" ] && rm -rf .github/agents

# Copy agent files
mkdir -p .github/agents
cp "$TEMPLATE_REPO/copilot-instructions.md" .
cp "$TEMPLATE_REPO/.github/agents"/[A-Z]-*.md .github/agents/ 2>/dev/null || true
cp "$TEMPLATE_REPO/.github/agents/README.md" .github/agents/

echo "✓ Agent files copied"
echo "✓ Backups created (*.backup)"

# ==================== ADD SYNC SCRIPT ====================
echo ""
echo "📥 Creating sync script for future updates..."

# Copy and customize the sync script with hardcoded template path
sed "s|TEMPLATE_REPO=.*|TEMPLATE_REPO=\"$TEMPLATE_REPO\"|" "$TEMPLATE_REPO/scripts/sync-agents.sh" > sync-agents.sh
chmod +x sync-agents.sh

echo "✓ sync-agents.sh created in project root (source path hardcoded)"
echo "   Use: ./sync-agents.sh"

# ==================== UPDATE GITIGNORE ====================
echo ""
echo "📝 Adding synced files to .gitignore..."

if [ -f ".gitignore" ]; then
  if ! grep -q ".github/agents/" .gitignore; then
    echo "" >> .gitignore
    echo "# Agent files synced from project-templates" >> .gitignore
    echo ".github/agents/" >> .gitignore
    echo "sync-agents.sh" >> .gitignore
  fi
else
  echo "# Agent files synced from project-templates" > .gitignore
  echo ".github/agents/" >> .gitignore
  echo "sync-agents.sh" >> .gitignore
fi

echo "✓ .gitignore updated"

echo ""
echo "🎉 Done! Agents added to project."
