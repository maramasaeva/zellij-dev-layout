#!/usr/bin/env bash
set -euo pipefail

# Installs the layout(s) from this repo into zellij's layout directory.

LAYOUT_DIR="${HOME}/.config/zellij/layouts"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$LAYOUT_DIR"

for layout in "$REPO_DIR"/layouts/*.kdl; do
    name="$(basename "$layout")"
    if [ -e "$LAYOUT_DIR/$name" ]; then
        echo "⚠️  $LAYOUT_DIR/$name already exists — skipping (delete it first to overwrite)"
    else
        cp "$layout" "$LAYOUT_DIR/$name"
        echo "✅ installed $name → $LAYOUT_DIR/$name"
    fi
done

echo
echo "start it with:  zellij -l dev"
