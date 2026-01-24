# My Dotfiles

## Usage

### Stow

Use Stow for symlinks

```bash
brew install stow
```


Add a package to this repo using the package name, followed by the path it should assume in the home directory. i.e, nvim needs to be placed in `~/.config/nvim/`, so it is named `nvim/.config/nvim`.

- Clone this repo to your home directory and cd into it. For each package you want to use, run `stow <package name>` (i.e, `stow nvim`)

## So Far

### Ghostty

Might need to bind the additional config file to base config file (located in `/Users/mattcarter/Library/Application Support/com.mitchellh.ghostty/config
`), by adding:

```

config-file = /Users/mattcarter/.config/ghostty/config
```

> Might work out of the box in the default location

### Alacritty

No longer using this as primary

### Nvim

### Hyprland

## What's Missing

### Cursor

### ...

## Linux Vs Apple

The `main` branch has the common/shared config, and the `linux` and `apple` branches have their own custom tweaks. ALL shared changes should be pushed to `main`. After pushing to main, run `git sync` to sync the changes on the other two branches.

For new machines, you need to run this to set the git alias:

```bash
git config --global --replace-all alias.sync '!f() { \
  echo "Syncing main to linux & apple..."; \
  if git rev-parse --verify linux >/dev/null 2>&1; then \
    git checkout linux; \
  else \
    echo "  Creating linux branch from main"; \
    git checkout -b linux main; \
  fi; \
  git merge main --no-edit && (git push -u origin linux 2>/dev/null || git push); \
  \
  if git rev-parse --verify apple >/dev/null 2>&1; then \
    git checkout apple; \
  else \
    echo "  Creating apple branch from main"; \
    git checkout -b apple main; \
  fi; \
  git merge main --no-edit && (git push -u origin apple 2>/dev/null || git push); \
  \
  git checkout main; \
  echo "Done! Both branches synced."; \
}; f'
```

Any `linux` or `apple` specific changes should only be pushed to that branch.
