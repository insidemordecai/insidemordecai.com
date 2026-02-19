#!/bin/bash
set -e

# Pin to a specific Hugo version (update when needed)
HUGO_VERSION="0.155.3"
HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"

curl -sL "$HUGO_URL" | tar xz hugo
chmod +x hugo
HUGO_ENV=production ./hugo --gc --minify
