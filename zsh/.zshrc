# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="agnoster"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Too many plugins can slow down shell startup.
plugins=(
  asdf
  git
  bundler
  dotenv
  rake
  rbenv
  ruby
)

# Add macOS-specific plugin only on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  plugins+=(macos)
fi

source $ZSH/oh-my-zsh.sh

# Aliases
alias reset='source $HOME/.zshrc'

alias home='cd ~'
alias cl='clear'
alias ls='colorls'

alias nf='/Users/mattcarter/NovemberFork/v3 && nvim'


# alias n='nvim'
alias nvimconfig='cd $HOME/.config/nvim && nvim'
alias nvimsettings='nvimconfig'
alias nvimsetup='nvimconfig'
alias nvimrc='nvimconfig'
alias nn='nvim'
alias nnn='nvim'

alias zshconfig='cd $HOME && nvim .zshrc'

alias nf='/Users/mattcarter/NovemberFork/'
alias nm='/Users/mattcarter/Work/Nethermind'
alias work='/Users/mattcarter/Work'


alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'

alias hours='/Users/mattcarter/Documents/Finances && nvim'
alias money='hours'
alias tax='hours'
alias taxes='hours'

alias pitchlake='/Users/mattcarter/Work/Nethermind/Pitchlake/Monorepo'
alias oif='/Users/mattcarter/Work/Nethermind/OIF'
alias pl='pitchlake'
alias sprouts='/Users/mattcarter/Work/Side_gigs/StarkSprouts'

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



# todo: once rbits is recloned finish
#alias rbits='/Users/mattcarter/Library/Documents/Work/Side_gigs/RabbitHoles/... && cursor .'


# . "/Users/mattcarter/.starkli/env"

# bun completions
[ -s "/Users/mattcarter/.bun/_bun" ] && source "/Users/mattcarter/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#eval "$(starship init zsh)"

# macOS-specific: Homebrew PostgreSQL
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Alias for running starkup installer
alias starkup="curl --proto '=https' --tlsv1.2 -sSf https://sh.starkup.sh | sh -s --"

# BEGIN SCARB COMPLETIONS
_scarb() {
  if ! scarb completions zsh >/dev/null 2>&1; then
    return 0
  fi
  eval "$(scarb completions zsh)"
  _scarb "$@"
}
autoload -Uz compinit && compinit
compdef _scarb scarb

# END SCARB COMPLETIONS
export PATH=$PATH:$(go env GOPATH)/bin

export PATH="$PATH:/Users/mattcarter/.risc0/bin"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
