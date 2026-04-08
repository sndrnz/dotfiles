# ====================== Config =====================

export EDITOR=nvim

# ====================== Alias =====================

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




