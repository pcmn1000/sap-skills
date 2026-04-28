#!/usr/bin/env bash
set -euo pipefail

DESTINATION="${1:-$HOME/.claude/skills}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE="$REPO_ROOT/skills"

if [ ! -d "$SOURCE" ]; then
  echo "Skills folder not found: $SOURCE" >&2
  exit 1
fi

mkdir -p "$DESTINATION"

for skill_dir in "$SOURCE"/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  rm -rf "$DESTINATION/$skill_name"
  cp -R "$skill_dir" "$DESTINATION/$skill_name"
  echo "Installed $skill_name -> $DESTINATION/$skill_name"
done

echo "Claude Code skills installed to $DESTINATION"
