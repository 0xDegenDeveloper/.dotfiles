# Raycast

[Download](https://www.raycast.com/) or `brew install --cask raycast`. Replaces Spotlight; Hyper opens apps.

## Export / import (tracked in git)

`.rayconfig` files in this folder are Raycast **Export Settings & Data** dumps. They are **encrypted**. Passphrase lives in **Obsidian**, not in git.

**New machine:** Raycast → Import Settings & Data → pick the newest `*.rayconfig` here → passphrase.

**After changing settings on a daily driver:** Export Settings & Data into this folder, commit the new file (keep old ones if you want history, or replace).

Do not stow these. Raycast does not read them from `~/.config`; import is the workflow.
