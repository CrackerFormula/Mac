#!/usr/bin/env bash
set -euo pipefail

# Dock autohide

defaults write com.apple.dock autohide -bool true

# Clean Dock with Finder, Launchpad (Apps), Firefox, Messages, and System Settings
defaults write com.apple.dock persistent-apps -array \
  "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Library/CoreServices/Finder.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>" \
  "<dict><key>tile-type</key><string>launchpad-tile</string></dict>" \
  "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Firefox.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>" \
  "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Messages.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>" \
  "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/System Settings.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

# Applications folder stack (right side of Dock)
defaults write com.apple.dock persistent-others -array \
  "<dict><key>tile-data</key><dict><key>arrangement</key><integer>1</integer><key>displayas</key><integer>1</integer><key>showas</key><integer>1</integer><key>file-data</key><dict><key>_CFURLString</key><string>/Applications</string><key>_CFURLStringType</key><integer>0</integer></dict></dict><key>tile-type</key><string>directory-tile</string></dict>"

# Show battery percentage in menu bar (macOS 12+ uses ByHost)
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Restart Dock and Control Center to apply settings
killall Dock >/dev/null 2>&1 || true
killall ControlCenter >/dev/null 2>&1 || true

echo "Preferences updated."
