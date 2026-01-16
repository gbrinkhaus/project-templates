#!/bin/bash

set -e

# Template repo path (hardcoded when script is copied)
TEMPLATE_REPO="/path/to/project-templates"

echo "🔄 Syncing agents from template repository..."
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

echo "🔄 Syncing agents from template repository..."
echo "   Source: $TEMPLATE_REPO"
echo ""

# ==================== SYNC AGENTS ====================
echo "📋 Syncing agents..."
mkdir -p .github/agents

# Check and sync copilot-instructions.md
if [ -f "copilot-instructions.md" ]; then
  echo ""
  echo "⚠️  copilot-instructions.md exists"
  read -p "$(echo -e '\033[31m')Overwrite? (y/N):$(echo -e '\033[0m') " overwrite_ci
  if [[ "$overwrite_ci" =~ ^[Yy]$ ]]; then
    cp "$TEMPLATE_REPO/copilot-instructions.md" .
    echo "  ✓ Updated"
  else
    echo "  ⊘ Skipped"
  fi
else
  cp "$TEMPLATE_REPO/copilot-instructions.md" .
  echo "✓ copilot-instructions.md synced"
fi

# Check and sync .github/agents/ - ask about each file
mkdir -p .github/agents

for agent_file in "$TEMPLATE_REPO"/.github/agents/[A-Z]-*.md; do
  filename=$(basename "$agent_file")
  target_file=".github/agents/$filename"
  
  if [ -f "$target_file" ]; then
    echo ""
    echo "⚠️  $filename exists"
    read -p "$(echo -e '\033[31m')Overwrite? (y/N):$(echo -e '\033[0m') " overwrite_agent
    if [[ "$overwrite_agent" =~ ^[Yy]$ ]]; then
      cp "$agent_file" "$target_file"
      echo "  ✓ Updated"
    else
      echo "  ⊘ Skipped"
    fi
  else
    cp "$agent_file" "$target_file"
    echo "✓ $filename synced"
  fi
done

# Sync README
cp "$TEMPLATE_REPO/.github/agents/README.md" .github/agents/
echo "✓ README synced"

# Sync README
cp "$TEMPLATE_REPO/core/agents/README.md" .github/agents/
echo "✓ README synced"

echo ""
echo "🎉 Sync complete!"
echo ""
echo "Review any changes with:"
echo "  git diff"
