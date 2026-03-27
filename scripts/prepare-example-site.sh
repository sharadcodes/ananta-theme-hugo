#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
THEMES_DIR="$ROOT/exampleSite/themes"
NAME="ananta-theme-hugo"
LINK="$THEMES_DIR/$NAME"
mkdir -p "$THEMES_DIR"
rm -rf "$LINK"
ln -sfn "$ROOT" "$LINK"
echo "Linked $LINK -> $ROOT"
