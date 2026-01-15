# Clean Setup

Apple Silicon macOS bootstrap that installs Homebrew, apps, and preferences.

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
