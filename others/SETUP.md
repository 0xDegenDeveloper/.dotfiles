# New machine setup

Use this file plus **Obsidian** (licenses, Raycast export passphrase, accounts). Stow only links config files. Everything below is installed separately.

Copy a row when you add something you care about. Uncheck on a fresh Mac, check it off as you go.

Template:

```
- [ ] Name — `brew install --cask foo` or https://… — why / notes
```

Almost every GUI app on the main Mac has a Homebrew **cask**. Prefer `brew install --cask …` so a new machine is mostly one terminal session. If something has no cask, put the download URL on the same line.

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
stow zsh nvim ghostty tmux starship hammerspoon
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

## 3. Apps (casks — not stowed)

Install, then import configs where noted. One shot for the daily set (edit the list if you do not want something):

```bash
brew install --cask \
  brave-browser \
  discord \
  claude \
  cursor \
  docker-desktop \
  flux-app \
  font-adwaita-mono-nerd-font \
  ghostty \
  granola \
  github \
  google-chrome \
  hammerspoon \
  hiddenbar \
  itsycal \
  karabiner-elements \
  key-codes \
  localsend \
  notion \
  obsidian \
  raycast \
  rectangle-pro \
  stats \
  signal \
  slack \
  spotify \
  tailscale-app \
  zoom
```

| App | Cask | Notes |
| --- | --- | --- |
| Ghostty | `ghostty` | then `stow ghostty` |
| Hammerspoon | `hammerspoon` | then `stow hammerspoon` (`~/.hammerspoon`) |
| Obsidian | `obsidian` | vaults/sync in Obsidian itself; CLI PATH is in `.zshrc` if the app exists |
| Raycast | `raycast` | [raycast/](raycast/README.md) — import `.rayconfig` |
| Karabiner-Elements | `karabiner-elements` | [karabiner/elements/README.md](karabiner/elements/README.md) |
| Rectangle Pro | `rectangle-pro` | [rectangle-pro/](rectangle-pro/README.md) + Obsidian license |
| Nerd font (optional) | `font-adwaita-mono-nerd-font` | Starship works without it |
| Stats | `stats` | menu bar |
| Hidden Bar | `hiddenbar` | menu bar |
| Itsycal | `itsycal` | menu bar calendar |
| AltTab | `alt-tab` | |
| LocalSend | `localsend` | |
| Docker Desktop | `docker-desktop` | |
| Tailscale | `tailscale-app` | GUI. CLI is `brew install tailscale` if you want `tailscale` in the terminal |
| Brave | `brave-browser` | |
| GitHub Desktop | `github` | |
| Signal | `signal` | |
| Cursor | `cursor` | |
| Discord | `discord` | |
| Slack | `slack` | |
| Spotify | `spotify` | |
| Chrome | `google-chrome` | |
| Notion | `notion` | |
| Zoom | `zoom` | |

No-cask / website-only (add here when you hit one):

- [ ]

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
- [ ] Obsidian: enable CLI if you want `Obsidian` in the terminal (PATH already points at the `.app` when it exists)
- [ ] Raycast: Import Settings & Data → latest `others/raycast/*.rayconfig` → passphrase from Obsidian
- [ ] Karabiner simple mods (caps → control, right option → caps) + Hyper from JSON
- [ ] Rectangle Pro: import `others/rectangle-pro/config.json`
- [ ] Hammerspoon: enable Accessibility if prompted; Reload Config

---

## 6. Add later

When you confirm an app on the main machine, add a checkbox here with the brew cask or download URL.

- [ ]
