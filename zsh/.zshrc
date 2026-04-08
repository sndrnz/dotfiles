# ====================== Config =====================

export EDITOR=nvim

# ====================== Alias =====================
alias reload="source \"$HOME/.zshrc\""

# DDEV
alias php="ddev php"
alias composer="ddev composer"
alias drush="ddev drush"

compare() {
  fileA=$1
  fileB=$2

  sumA=$(sha256 --quiet $fileA)
  sumB=$(sha256 --quiet $fileB)

  if [[ $sumA == $sumB ]]; then
    echo "The same"
  else
    echo "Not the same"
  fi
}

# ===================== Scripts ====================

export PATH="$PATH:$HOME/Developer/Scripts/bin"

# ===================== Zoxide =====================

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# ======================= NVM ======================

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completionon

autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# ======================= Bun ======================

export PATH="/Users/sndrnz/.bun/bin:$PATH"

# ==================== Composer ====================

export PATH="/Users/sndrnz/.composer/vendor/bin:$PATH"

source ~/.oh-my-posh/init

# ==================== VI Mode ====================

bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

export KEYTIMEOUT=1

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} 

# ==================== FZF ====================

export FZF_DEFAULT_OPTS=" \
--tmux \
--preview \"bat --color=always --style=numbers --line-range=:500 {}\" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
source <(fzf --zsh)
