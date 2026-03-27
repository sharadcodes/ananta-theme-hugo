#!/usr/bin/env bash
set -e

# Vercel build script for exampleSite
# This script runs from exampleSite/ directory

echo "Setting up theme..."
THEME_DIR="themes/ananta-theme-hugo"
mkdir -p "$THEME_DIR"

echo "Copying theme files from parent directory..."

# Copy layouts directory (preserves all subdirectories)
echo "  Copying layouts..."
cp -r ../layouts "$THEME_DIR/"

# Copy static directory
echo "  Copying static..."
cp -r ../static "$THEME_DIR/"

# Copy theme.toml
echo "  Copying theme.toml..."
cp ../theme.toml "$THEME_DIR/"

echo "Building site with Hugo..."
hugo --gc --minify

echo "Build completed successfully!"
