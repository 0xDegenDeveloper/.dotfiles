# Minimal bash (zsh is primary). Keep in sync with nvm-as-source-of-truth.

path_append() {
  [ -d "$1" ] || return 0
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$PATH:$1" ;;
  esac
}

path_append "$HOME/.bb"
if command -v go >/dev/null 2>&1; then
  path_append "$(go env GOPATH)/bin"
fi
unset -f path_append

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
