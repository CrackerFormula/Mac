# Clean Setup

Apple Silicon macOS bootstrap that installs Homebrew, apps, and preferences.

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

- If you need Mac App Store apps, we can add a `mas` section to the `Brewfile`.
- If you want Homebrew `git`, add `brew "git"` to the `Brewfile`.
