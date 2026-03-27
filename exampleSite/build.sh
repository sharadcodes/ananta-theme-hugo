#!/usr/bin/env bash
set -euo pipefail

# Vercel build script for exampleSite
# This script runs from exampleSite/ directory

# Create themes directory
mkdir -p themes

# Link theme from parent directory
ln -sfn .. themes/ananta-theme-hugo

# Build with Hugo
hugo --gc --minify

echo "Build completed successfully!"
