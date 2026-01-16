# Clean Setup

Apple Silicon macOS bootstrap that installs Xcode Command Line Tools, Homebrew, apps, and preferences.

## Clean install (copy/paste)

```sh
git clone https://github.com/CrackerFormula/Mac.git
cd Mac
./scripts/bootstrap.sh
```

## One-step install

```sh
./scripts/bootstrap.sh
```

Notes:
- The script installs Xcode Command Line Tools via `softwareupdate` when possible (may prompt for your password).
- If the update label is unavailable, it falls back to the GUI installer.

## Manual steps

```sh
brew bundle --file ./Brewfile
./scripts/set-preferences.sh
```

## Notes

- Brew installs:
  - bitwarden
  - coteditor
  - firefox
  - steam
  - visual-studio-code
  - cloudflare-warp
  - discord
  - plex
  - trilium-notes
- If you need Mac App Store apps, we can add a `mas` section to the `Brewfile`.
- If you want Homebrew `git`, add `brew "git"` to the `Brewfile`.
