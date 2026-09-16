# Loaded for every zsh (including scripts). Keep this tiny and silent.

path_add() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$PATH:$1" ;;
  esac
}

path_add "$HOME/.local/bin"
[[ -d "$HOME/.dojo/bin" ]] && path_add "$HOME/.dojo/bin"
[[ -d "$HOME/.slot/bin" ]] && path_add "$HOME/.slot/bin"
[[ -d "$HOME/.foundry/bin" ]] && path_add "$HOME/.foundry/bin"

[[ -f "$HOME/.starkli/env" ]] && . "$HOME/.starkli/env"
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

unset -f path_add
export PATH
