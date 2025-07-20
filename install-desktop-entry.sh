#!/bin/bash

# install-desktop-entry.sh — Installs the Fusion Studio launcher icon

set -e

DESKTOP_FILE="fusion20.desktop"
TARGET_DIR="$HOME/.local/share/applications"

echo "📦 Installing $DESKTOP_FILE to your application menu..."

# Check if the .desktop file exists
if [ ! -f "$DESKTOP_FILE" ]; then
  echo "❌ Could not find $DESKTOP_FILE in the current directory."
  exit 1
fi

# Create the applications directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Copy and set permissions
cp "$DESKTOP_FILE" "$TARGET_DIR/"
chmod +x "$TARGET_DIR/$DESKTOP_FILE"

# Refresh KDE app launcher
echo "🔄 Refreshing KDE launcher database..."
kbuildsycoca6 > /dev/null 2>&1

echo "✅ Done! Search for 'Fusion Studio 20' in your application launcher."
