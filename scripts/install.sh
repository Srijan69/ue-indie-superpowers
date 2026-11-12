#!/usr/bin/env bash
# Installs the UE Indie Superpowers skills for Codex (or another agent).
# Usage: bash scripts/install.sh [target-skills-dir]
set -euo pipefail

SRC="$(cd "$(dirname "$0")/.." && pwd)/skills"
TARGET="${1:-${CODEX_HOME:-$HOME/.codex}/skills}"

mkdir -p "$TARGET"
count=0
for dir in "$SRC"/*/; do
  name="$(basename "$dir")"
  rm -rf "$TARGET/$name"
  cp -R "$dir" "$TARGET/$name"
  count=$((count + 1))
done
echo "Installed $count skills into: $TARGET"
echo "Restart your agent, then add templates/AGENTS.md to your Unreal project."
