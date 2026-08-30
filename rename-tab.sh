#!/usr/bin/env bash
set -euo pipefail

# Rename a tab in the layout without opening an editor.
#
#   ./rename-tab.sh <old-name> <new-name>
#
# Example:
#   ./rename-tab.sh messier main
#
# Edits both the repo copy (layouts/dev.kdl) and your installed copy
# (~/.config/zellij/layouts/dev.kdl) if it exists.

if [ $# -ne 2 ]; then
    echo "usage: $0 <old-name> <new-name>"
    echo "current tab names:"
    grep -o 'tab name="[^"]*"' "$(dirname "${BASH_SOURCE[0]}")/layouts/dev.kdl" | sed 's/tab name="\(.*\)"/  - \1/'
    exit 1
fi

OLD="$1"
NEW="$2"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

renamed=0
for file in "$REPO_DIR/layouts/dev.kdl" "$HOME/.config/zellij/layouts/dev.kdl"; do
    [ -f "$file" ] || continue
    if grep -q "tab name=\"$OLD\"" "$file"; then
        sed -i '' "s/tab name=\"$OLD\"/tab name=\"$NEW\"/" "$file" 2>/dev/null \
            || sed -i "s/tab name=\"$OLD\"/tab name=\"$NEW\"/" "$file"
        echo "✅ renamed \"$OLD\" → \"$NEW\" in $file"
        renamed=1
    fi
done

if [ "$renamed" -eq 0 ]; then
    echo "⚠️  no tab named \"$OLD\" found. current tab names:"
    grep -o 'tab name="[^"]*"' "$REPO_DIR/layouts/dev.kdl" | sed 's/tab name="\(.*\)"/  - \1/'
    exit 1
fi
