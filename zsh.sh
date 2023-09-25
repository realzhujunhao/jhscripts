#!/bin/bash

# Update package lists
sudo yum update -y

# Install Zsh
sudo yum install -y zsh

# Set Zsh as the default shell for the current user
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone zsh-autosuggestions and zsh-syntax-highlighting
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Overwrite ~/.zshrc with the specified content
cat <<THISISDELIMITER > ~/.zshrc
export ZSH="\$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source \$ZSH/oh-my-zsh.sh

export DEFAULT_USER=\$USER

prompt_end() {
  if [[ -n \$CURRENT_BG ]]; then
      print -n "%{%k%F{\$CURRENT_BG}%}\$SEGMENT_SEPARATOR"
  else
      print -n "%{%k%}"
  fi

  print -n "%{%f%}"
  CURRENT_BG='' 

  # Adds the new line and ➜ as the start character.
  printf "\n ➜";
}
THISISDELIMITER

# Reload Zsh configuration
source ~/.zshrc

cd ~

echo "done, plz restart terminal"

