# Login shells (Ghostty tabs, SSH). Homebrew belongs here so it runs after
# macOS /etc/zprofile path_helper.

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# PATH folders (Obsidian, bun, nargo, …) belong in ~/.zshrc, not here.
# Installers that append to this file should be moved there.
