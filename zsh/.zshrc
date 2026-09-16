# Interactive zsh only. Self-contained: no Oh My Zsh, no Powerlevel10k.

# --- history ---
HISTFILE="${HISTFILE:-$HOME/.zsh_history}"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_VERIFY EXTENDED_HISTORY

# --- completion (case-insensitive Tab) ---
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
setopt AUTO_MENU COMPLETE_IN_WORD ALWAYS_TO_END

# --- prefix + Up/Down searches history ---
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# emacs-style line editing (Ctrl-A/E, etc.)
bindkey -e

# --- helpers ---
path_prepend() {
  [[ -d "$1" ]] || return 0
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1:$PATH" ;;
  esac
}

path_append() {
  [[ -d "$1" ]] || return 0
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$PATH:$1" ;;
  esac
}

# --- aliases ---
alias reload='source "$HOME/.zshrc"'
alias home='cd ~'
alias cl='clear'
#alias ls='colorls'

alias nvimconfig='cd "$HOME/.config/nvim" && nvim'
alias nvimsettings='nvimconfig'
alias nvimsetup='nvimconfig'
alias nvimrc='nvimconfig'
alias nn='nvim'
alias nnn='nvim'

alias zshconfig='nvim "$HOME/.zshrc"'

alias gs='git status -sb'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'

alias sb='scarb build'
alias st='scarb test'
alias sf='scarb fmt'

alias cr='cargo run'
alias cf='cargo fmt'
alias rrr='cl && cf && cr'

alias tact='npx blueprint'
alias tt='npx blueprint'
alias ttt='npx blueprint test'
alias ttb='npx blueprint build --all'

alias starkup="curl --proto '=https' --tlsv1.2 -sSf https://sh.starkup.sh | sh -s --"

# --- tools on PATH ---
export BUN_INSTALL="$HOME/.bun"
path_prepend "$BUN_INSTALL/bin"
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

if [[ "$OSTYPE" == darwin* ]]; then
  path_prepend "/opt/homebrew/opt/postgresql@16/bin"
fi

if command -v go >/dev/null 2>&1; then
  path_append "$(go env GOPATH)/bin"
fi

path_append "$HOME/.risc0/bin"
export NARGO_HOME="${NARGO_HOME:-$HOME/.nargo}"
path_append "$NARGO_HOME/bin"
path_prepend "$HOME/.bb"
path_prepend "$HOME/.kimi-code/bin"

# nvm last so its node wins over Homebrew/system
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"

# prompt after PATH so Starship sees the same env you type with
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

unset -f path_prepend path_append

# machine-specific aliases (not in git)
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
