#!/usr/bin/env bash
set -e

HUGO_VERSION="0.159.1"

echo "Installing Hugo ${HUGO_VERSION}..."
# Check if Hugo is already installed with correct version
if ! command -v hugo &> /dev/null || [ "$(hugo version | grep -oP '0\.\d+\.\d+' | head -1)" != "${HUGO_VERSION}" ]; then
  echo "Downloading Hugo ${HUGO_VERSION}..."
  curl -sL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz" -o /tmp/hugo.tar.gz
  tar -xzf /tmp/hugo.tar.gz -C /usr/local/bin hugo
  rm /tmp/hugo.tar.gz
fi

hugo version

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
