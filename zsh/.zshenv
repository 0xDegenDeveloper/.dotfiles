# Environment variables loaded before .zshrc
# Cleaned up duplicate PATH entries

# Local bin
export PATH="$PATH:$HOME/.local/bin"

# Development tools
export PATH="$PATH:$HOME/.dojo/bin"
export PATH="$PATH:$HOME/.slot/bin"
export PATH="$PATH:$HOME/.foundry/bin"

# Starkli environment
if [ -f "$HOME/.starkli/env" ]; then
  . "$HOME/.starkli/env"
fi

# Cargo environment
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
