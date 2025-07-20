#!/bin/bash

# extract-fusion-installer.sh — Extracts Fusion Studio .run installer manually

set -e

INSTALLER="$1"

if [ -z "$INSTALLER" ]; then
  echo "❌ Please provide the path to the .run installer."
  echo "Usage: ./extract-fusion-installer.sh Blackmagic_Fusion_Studio_Linux_20.0.1_installer.run"
  exit 1
fi

if [ ! -f "$INSTALLER" ]; then
  echo "❌ File not found: $INSTALLER"
  exit 1
fi

echo "🔍 Extracting SquashFS from installer: $INSTALLER"
WORKDIR="_${INSTALLER##*/}.extracted"
mkdir -p "$WORKDIR"
binwalk -e "$INSTALLER" --directory "$WORKDIR"

SQUASHFS=$(find "$WORKDIR" -name "*.squashfs" | head -n 1)

if [ ! -f "$SQUASHFS" ]; then
  echo "❌ Could not find .squashfs in extracted data."
  exit 1
fi

echo "📦 Unsquashing filesystem..."
unsquashfs -d fusion-unpacked "$SQUASHFS"

echo "📁 Ready to install to /opt/BlackmagicDesign/Fusion20/"

if [ -d /opt/BlackmagicDesign/Fusion20/ ]; then
  read -p "⚠️  Folder already exists. Overwrite existing Fusion install? [y/N]: " confirm
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "❌ Installation cancelled."
    exit 1
  fi
  echo "🧹 Removing old install..."
  sudo rm -rf /opt/BlackmagicDesign/Fusion20/
fi

echo "📁 Copying files (this may take a moment)..."
sudo mkdir -p /opt/BlackmagicDesign/Fusion20/
sudo cp -r fusion-unpacked/* /opt/BlackmagicDesign/Fusion20/

echo "✅ Fusion Studio extracted to /opt/BlackmagicDesign/Fusion20/"
