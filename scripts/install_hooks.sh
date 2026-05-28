#!/usr/bin/env bash
# ============================================================
# scripts/install_hooks.sh
# ============================================================
set -euo pipefail

HOOKS_DIR=".git/hooks"
SCRIPTS_DIR="scripts"

if [[ ! -d "$HOOKS_DIR" ]]; then
    echo "ERROR: .git/hooks not found. Run from the repo root."
    exit 1
fi

echo "Installing git hooks..."

cp "$SCRIPTS_DIR/pre-commit" "$HOOKS_DIR/pre-commit"
chmod +x "$HOOKS_DIR/pre-commit"
echo "  ✓ pre-commit installed"

echo ""
echo "All hooks installed."
echo "To skip a commit: git commit --no-verify"
echo "To test:          bash .git/hooks/pre-commit"
