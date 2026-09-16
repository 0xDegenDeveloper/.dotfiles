# Zsh

Self-contained interactive config. No Oh My Zsh. Prompt is Starship (`brew install starship`).

## Files

- `.zshenv` — tiny PATH for every zsh (including scripts)
- `.zprofile` — Homebrew on login shells (after macOS `path_helper`)
- `.zshrc` — aliases, completion, prefix+Up history, nvm, Starship
- `.zshrc.local.example` — copy to `~/.zshrc.local` for machine-specific aliases
- `.p10k.zsh` — leftover Powerlevel10k config (not sourced; safe to delete later)

`stow zsh` links the dotfiles into `$HOME`. If `~/.zprofile` already exists (Homebrew installer), move it aside first.

Tab completion and Up-arrow history search are in `.zshrc`. They work over SSH (same user) because that is still this file.

Claude Code / Keychain logins do **not** follow SSH. Unlock the login keychain once per session (`security unlock-keychain`) or attach an existing tmux session. Do not put credentials in this repo.
