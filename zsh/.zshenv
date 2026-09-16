# Loaded for every zsh (including scripts). Keep this tiny and silent.

path_append() {
  [[ -d "$1" ]] || return 0
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$PATH:$1" ;;
  esac
}

path_append "$HOME/.local/bin"
path_append "$HOME/.dojo/bin"
path_append "$HOME/.slot/bin"
path_append "$HOME/.foundry/bin"

[[ -f "$HOME/.starkli/env" ]] && . "$HOME/.starkli/env"
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

unset -f path_append
export PATH
