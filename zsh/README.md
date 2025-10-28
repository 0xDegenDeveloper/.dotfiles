# Zsh Configuration

This directory contains my zsh shell configuration with Powerlevel10k theme.

## Files Included

- `.zshrc` - Main zsh configuration with aliases and plugins
- `.p10k.zsh` - Powerlevel10k theme configuration
- `.zshenv` - Environment variables (PATH configurations)

## Prerequisites

### 1. Install Zsh
**macOS:**
```bash
brew install zsh
```

**Linux (Arch):**
```bash
sudo pacman -S zsh
```

### 2. Install Oh-My-Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 3. Install Powerlevel10k Theme
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### 4. Install Required Fonts
**macOS:**
```bash
brew install --cask font-adwaita-mono-nerd-font
```

**Linux (Arch):**
```bash
# Via AUR (using yay or paru)
yay -S ttf-adwaita-mono-nerd
# or
paru -S ttf-adwaita-mono-nerd
```

### 5. Optional: Install colorls (for colored ls output)
```bash
gem install colorls
```

## Installation with Stow

From the dotfiles directory:
```bash
cd ~/.dotfiles
stow zsh
```

This will create symlinks:
- `~/.zshrc` → `~/.dotfiles/zsh/.zshrc`
- `~/.p10k.zsh` → `~/.dotfiles/zsh/.p10k.zsh`
- `~/.zshenv` → `~/.dotfiles/zsh/.zshenv`

## Notes

- **Powerlevel10k maintenance**: While no longer actively maintained, it still works great and is feature-complete
- **Platform differences**: The `macos` plugin in `.zshrc` won't work on Linux - you may want to conditionally load it
- **Absolute paths**: Some aliases contain macOS-specific paths - adjust as needed per machine

## Reconfiguring Powerlevel10k

To regenerate the p10k config:
```bash
p10k configure
```

