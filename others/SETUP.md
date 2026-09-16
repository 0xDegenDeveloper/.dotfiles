# New machine setup

Use this file plus **Obsidian** (licenses, Raycast export passphrase, accounts). Stow only links config files. Everything below is installed separately.

Copy a row when you add something you care about. Uncheck on a fresh Mac, check it off as you go.

Template:

```
- [ ] Name — install command — why / notes
```

---

## 0. Credentials (Obsidian, not git)

- [ ] GitHub SSH key / `gh auth login`
- [ ] Raycast `.rayconfig` passphrase
- [ ] Rectangle Pro license
- [ ] Cursor / Claude / other logins (Keychain does not follow SSH)

---

## 1. Homebrew, clone, stow

- [ ] [Homebrew](https://brew.sh)
- [ ] `brew install stow starship neovim tmux gh ripgrep fzf jq`
- [ ] Clone this repo to `~/.dotfiles`
- [ ] If Homebrew already wrote `~/.zprofile`, move it aside, then:

```bash
cd ~/.dotfiles
stow zsh nvim ghostty tmux starship
cp ~/.dotfiles/zsh/.zshrc.local.example ~/.zshrc.local
# edit ~/.zshrc.local for this machine's folders
```

- [ ] Delete Ghostty’s extra macOS file if it exists: `~/Library/Application Support/com.mitchellh.ghostty/config` (stowed file is `~/.config/ghostty/config`)

---

## 2. Shell / Node (required for this config)

- [ ] **Starship** — `brew install starship` (prompt; config is stowed)
- [ ] **nvm** — [install script](https://github.com/nvm-sh/nvm#installing-and-updating) (not Homebrew `node`). Then:

```bash
nvm install 22
nvm alias default 22
```

Neovim prepends this nvm default onto `PATH` so GUI nvim matches the terminal.

---

## 3. Apps (not stowed — install, then import)

| App | Install | Config in this repo |
| --- | --- | --- |
| Ghostty | `brew install --cask ghostty` | `stow ghostty` |
| Raycast | `brew install --cask raycast` | [raycast/](raycast/README.md) — import `.rayconfig` |
| Karabiner-Elements | `brew install --cask karabiner-elements` | [karabiner/elements/README.md](karabiner/elements/README.md) |
| Rectangle Pro | `brew install --cask rectangle-pro` | [rectangle-pro/](rectangle-pro/README.md) + Obsidian license |
| Font (optional) | `brew install --cask font-adwaita-mono-nerd-font` | Starship works without it |

Menu bar (confirmed on the main Mac, 2026-09):

- [ ] **Stats** — `brew install --cask stats`
- [ ] **Hidden Bar** — `brew install --cask hiddenbar`
- [ ] **Itsycal** — `brew install --cask itsycal`

Also on the main Mac (keep / drop as you like):

- [ ] AltTab — `brew install --cask alt-tab`
- [ ] LocalSend — `brew install --cask localsend`
- [ ] Docker Desktop — `brew install --cask docker-desktop`

---

## 4. Toolchains (optional — shell no-ops until installed)

Install when you need them. `.zshrc` / `.zshenv` only add PATH entries if the directory or binary exists.

- [ ] **Rust** — [rustup](https://rustup.rs) (`~/.cargo/env`)
- [ ] **Go** — `brew install go`
- [ ] **Foundry / Dojo / Slot** — their installers; bins under `~/.foundry`, `~/.dojo`, `~/.slot`
- [ ] **Scarb / Starkli / nargo / bb / risc0 / bun** — same pattern; PATH is skipped until the folder exists

Aliases like `cr` / `sb` still *exist* before the tools do; running them fails until the binary is installed.

---

## 5. After first login

- [ ] New Ghostty tab (Starship + nvm)
- [ ] `node -v` in terminal and in nvim (`:!node -v`) — both nvm 22
- [ ] Raycast: Import Settings & Data → latest `others/raycast/*.rayconfig` → passphrase from Obsidian
- [ ] Karabiner simple mods (caps → control, right option → caps) + Hyper from JSON
- [ ] Rectangle Pro: import `others/rectangle-pro/config.json`

---

## 6. Add later

When you confirm an app on the main machine, add a checkbox here with the brew cask or download URL.

- [ ]
