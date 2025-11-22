#!/bin/bash
# Simple syntax checker

echo "[*] Checking JavaScript syntax..."

# Fail if any JS file has syntax errors
for file in $(find . -type f -name "*.js"); do
  echo "Checking $file"
  node --check "$file" || exit 1
done

echo "[✓] Syntax OK"
