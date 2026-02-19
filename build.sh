#!/bin/bash
set -e

# Get latest Hugo extended Linux-64bit URL from GitHub API
HUGO_URL=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest |
  grep '"browser_download_url"' |
  grep 'hugo_extended.*Linux-64bit.tar.gz' |
  grep -v 'withdeploy' |
  cut -d '"' -f 4)

# Download & extract
curl -sL "$HUGO_URL" | tar xz hugo
chmod +x hugo

# Build production site
HUGO_ENV=production ./hugo --gc --minify
