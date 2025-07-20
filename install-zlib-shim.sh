#!/bin/bash

# install-zlib-shim.sh — Sets up zlib 1.2.13 in an isolated runtime

set -e

echo "📦 Creating runtime folder..."
mkdir -p ~/fusion-runtime/lib64
cd ~/fusion-runtime/lib64

echo "🌐 Downloading zlib 1.2.13 (Fedora 38 RPM)..."
wget https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/38/Everything/x86_64/os/Packages/z/zlib-1.2.13-3.fc38.x86_64.rpm

echo "📦 Extracting zlib from RPM..."
rpm2cpio zlib-1.2.13-3.fc38.x86_64.rpm | cpio -idmv

echo "🔗 Setting up symlink..."
ln -sf lib64/libz.so.1.2.13 libz.so.1

echo "✅ zlib shim installed to ~/fusion-runtime/lib64"
echo "➡️ Use run-fusion.sh to launch Fusion with this runtime."
