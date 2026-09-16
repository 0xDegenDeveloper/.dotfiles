# Dotfiles

Mac-first configs, linked with [GNU Stow](https://www.gnu.org/software/stow/). Branch `main` is this machine. `linux` is leftover and ignored. `apple` is unused.

**New Mac:** follow **[others/SETUP.md](others/SETUP.md)** (installs, casks, nvm, Raycast import). Passwords and licenses stay in Obsidian. Add new apps to that checklist when you decide they should persist.

### Ghostty

Real config is `~/.config/ghostty/config` (this repo). On macOS Ghostty *also* loads `~/Library/Application Support/com.mitchellh.ghostty/config` **after** that, and Cmd+, often opens the App Support file. Delete the App Support `config` so only the stowed file remains.

### Neovim / Node

GUI Neovim does not load `.zshrc`. `init.lua` prepends nvm’s default Node onto `PATH` so `:!node -v` matches Ghostty.

### SSH (Termius)

Same user, same home: aliases, Tab completion, and prefix+Up history come from `.zshrc` (no Oh My Zsh). A running Claude Code in Ghostty is a different process — use tmux if you want the same session. Claude OAuth on macOS lives in Keychain and often fails over SSH; `security unlock-keychain` once per session, never commit `~/.claude/.credentials.json`.

## Stow layout

Package name, then the path as it should appear under `$HOME`:

- `nvim/.config/nvim` → `~/.config/nvim`
- `tmux/.tmux.conf` → `~/.tmux.conf`

```bash
brew install stow
cd ~/.dotfiles
stow nvim
```

## Packages

- **zsh** — self-contained (completion, history search, nvm last). No Oh My Zsh. Prompt: Starship.
- **starship** — `~/.config/starship.toml`
- **ghostty** — `~/.config/ghostty/config` only
- **nvim** — LazyVim
- **tmux** — optional; attach from the phone to keep a live CLI session
- **hammerspoon** — `~/.hammerspoon` (MouseFollowsFocus spoon)

Karabiner, Rectangle, and Raycast live under `others/` (notes + imports, not Stow). Encrypted Raycast `.rayconfig` exports are tracked; passphrase is in Obsidian.
