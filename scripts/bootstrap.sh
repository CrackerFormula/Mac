#!/usr/bin/env bash
set -euo pipefail

# Ensure Xcode Command Line Tools (git) are available
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "Command Line Tools install started. Re-run this script after it completes."
  exit 1
fi

# Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Load Homebrew for current shell session
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# Install apps
brew bundle --file "$(dirname "$0")/../Brewfile"

# Apply preferences
"$(dirname "$0")/set-preferences.sh"

