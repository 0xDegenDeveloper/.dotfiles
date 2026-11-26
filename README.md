# Dotfiles

Configs linked with [GNU Stow](https://www.gnu.org/software/stow/). Use `main` for the shared tmux setup on macOS and Omarchy. The `linux` and `apple` branches are historical.

**New Mac:** follow **[others/SETUP.md](others/SETUP.md)** (installs, casks, nvm, Raycast import). Passwords and licenses stay in Obsidian. Add new apps to that checklist when you decide they should persist.

### Ghostty

Real config is `~/.config/ghostty/config` (this repo). On macOS Ghostty *also* loads `~/Library/Application Support/com.mitchellh.ghostty/config` **after** that, and Cmd+, often opens the App Support file. Delete the App Support `config` so only the stowed file remains.

### Neovim / Node

GUI Neovim does not load `.zshrc`. `init.lua` prepends nvm’s default Node onto `PATH` so `:!node -v` matches Ghostty.

### SSH (Termius)

Same user, same home: aliases, Tab completion, and prefix+Up history come from `.zshrc` (no Oh My Zsh). A running Claude Code in Ghostty is a different process — use tmux if you want the same session. Claude OAuth on macOS lives in Keychain and often fails over SSH; `security unlock-keychain` once per session, never commit `~/.claude/.credentials.json`.

### tmux on macOS and Omarchy

Move aside any existing `~/.config/tmux/tmux.conf` before stowing. On Omarchy, use a backup filename such as `tmux.conf.omarchy.bak` for the stock file. If you have a standalone `~/.tmux.conf`, back it up too. tmux can read both paths. If your old `~/.tmux.conf` was stowed from this repo, `stow -R tmux` removes the old link.

```bash
cd ~/.dotfiles
stow -R tmux
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start a fresh tmux server, then press `Ctrl+b` followed by uppercase `I` to install the tmux plugins. To try the setup while your existing sessions are open, use `tmux -L shared-preview new-session`.

The repo's Neovim package already declares `vim-tmux-navigator`. If you use Omarchy's existing LazyVim config, link the plugin spec below, then run `:Lazy install vim-tmux-navigator` in Neovim.

```bash
ln -s ~/.dotfiles/nvim/.config/nvim/lua/plugins/vim-tmux-navigator.lua ~/.config/nvim/lua/plugins/vim-tmux-navigator.lua
```

Use `Ctrl+b` then `-` or `|` to split, `r` to rename a window, `R` to rename a session, and comma to reload. In copy mode, `v` selects and `y` or Enter copies. Remote clipboard forwarding uses OSC 52 and requires terminal support.

## Stow layout

Package name, then the path as it should appear under `$HOME`:

- `nvim/.config/nvim` → `~/.config/nvim`
- `tmux/.config/tmux/tmux.conf` → `~/.config/tmux/tmux.conf`
- `theme/.config/theme` → `~/.config/theme`
- `theme/.local/bin/theme-set` → `~/.local/bin/theme-set`

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
- **theme** — Catppuccin flavor for Ghostty, Neovim, and Starship (`theme-set frappe`)
- **hammerspoon** — `~/.hammerspoon` (MouseFollowsFocus spoon)

Karabiner, Rectangle, and Raycast live under `others/` (notes + imports, not Stow). Encrypted Raycast `.rayconfig` exports are tracked; passphrase is in Obsidian.
