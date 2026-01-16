#!/usr/bin/env bash
set -euo pipefail

ensure_command_line_tools() {
  if xcode-select -p >/dev/null 2>&1; then
    return 0
  fi

  echo "Installing Xcode Command Line Tools..."
  local marker="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress"
  sudo touch "$marker"

  local label
  local su_output
  if ! su_output="$(softwareupdate -l 2>/dev/null)"; then
    echo "softwareupdate failed; falling back to GUI installer."
    xcode-select --install
    echo "Re-run this script after the installer completes."
    exit 1
  fi

  label="$(printf '%s' "$su_output" | awk -F'*' '/Command Line Tools/ {print $2}' | sed 's/^ *//' | head -n 1)"
  sudo rm -f "$marker"

  if [ -n "$label" ]; then
    sudo softwareupdate --install "$label" --verbose
    sudo xcode-select --switch /Library/Developer/CommandLineTools
    return 0
  fi

  echo "Command Line Tools update not found via softwareupdate. Starting GUI installer."
  xcode-select --install
  echo "Re-run this script after the installer completes."
  exit 1
}

# Ensure Xcode Command Line Tools (git) are available
ensure_command_line_tools

# Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Load Homebrew for current shell session
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# Ensure Homebrew is on PATH for future shells
if [ -x /opt/homebrew/bin/brew ]; then
  if ! grep -q 'brew shellenv' "$HOME/.zprofile" 2>/dev/null; then
    {
      echo
      echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"'
    } >> "$HOME/.zprofile"
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install apps
brew bundle --file "$(dirname "$0")/../Brewfile"

# Apply preferences
"$(dirname "$0")/set-preferences.sh"
