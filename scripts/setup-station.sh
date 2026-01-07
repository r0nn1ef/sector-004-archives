#!/bin/bash
# setup-station.sh - Initializes LCARS logging for this node

echo "Initializing Sector 004 Archive Hook..."

# Path to our sample and the target hook
SAMPLE="scripts/prepare-commit-msg.sample"
TARGET=".git/hooks/prepare-commit-msg"

if [ -f "$SAMPLE" ]; then
    cp "$SAMPLE" "$TARGET"
    chmod +x "$TARGET"
    echo "SUCCESS: Station $(hostname) is now reporting to Starfleet Command."
else
    echo "ERROR: Sample file not found. Ensure you are in the repo root."
fi