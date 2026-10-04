#!/usr/bin/env bash
set -euo pipefail

# Installs the layout(s) from this repo into zellij's layout directory.
# By default it overwrites existing layouts (keeping a .bak of the old one).
# Pass --no-overwrite to skip files that already exist.

LAYOUT_DIR="${HOME}/.config/zellij/layouts"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OVERWRITE=1
[ "${1:-}" = "--no-overwrite" ] && OVERWRITE=0

mkdir -p "$LAYOUT_DIR"

for layout in "$REPO_DIR"/layouts/*.kdl; do
    name="$(basename "$layout")"
    dest="$LAYOUT_DIR/$name"
    if [ -e "$dest" ] && [ "$OVERWRITE" -eq 0 ]; then
        echo "⚠️  $dest already exists — skipping (--no-overwrite)"
        continue
    fi
    if [ -e "$dest" ]; then
        cp "$dest" "$dest.bak"
        echo "💾 backed up old $name → $name.bak"
    fi
    cp "$layout" "$dest"
    echo "✅ installed $name → $dest"
done

echo
echo "start it with:  zellij -l dev"
