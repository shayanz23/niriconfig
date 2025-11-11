#!/bin/bash

THEME="${1:-Papirus}"
SOURCE="$HOME/niriconfig/themes/$THEME"
TARGET="$HOME/.local/share/icons/$THEME"

# Validate source exists
if [[ ! -d "$SOURCE" ]]; then
    echo "Error: Theme not found at $SOURCE"
    exit 1
fi

# Remove existing target if it exists
if [[ -e "$TARGET" ]]; then
    echo "Removing existing $TARGET"
    rm -rf "$TARGET"
fi

# Create parent directory
mkdir -p "$(dirname "$TARGET")"

# Create symlink
ln -s "$SOURCE" "$TARGET"

echo "✓ Linked $TARGET → $SOURCE"

# Update icon cache
if command -v gtk-update-icon-cache &> /dev/null; then
    gtk-update-icon-cache "$TARGET" 2>/dev/null && echo "✓ Icon cache updated"
fi