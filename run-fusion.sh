#!/bin/bash

# run-fusion.sh — Launch Fusion Studio with local zlib shim

export LD_LIBRARY_PATH=~/fusion-runtime/lib64:$LD_LIBRARY_PATH

if [ ! -x /opt/BlackmagicDesign/Fusion20/Fusion ]; then
    echo "❌ Fusion Studio binary not found at /opt/BlackmagicDesign/Fusion20/Fusion"
    echo "➡️ Make sure it's installed and try again."
    exit 1
fi

echo "🚀 Launching Fusion Studio 20..."
/opt/BlackmagicDesign/Fusion20/Fusion
