#!/bin/bash
# install zsh/oh-my-zsh plugins, and the zsh PowerLevel10K Scene

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):\n\
plugins=(\n\
    # other plugins...\n\
    zsh-autosuggestions\n\
)\
"

#https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Activate the plugin in ~/.zshrc:\n\
plugins=( [plugins...] zsh-syntax-highlighting)
"

git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ohmyzsh-full-autoupdate
echo "Add the plugin to the Oh My Zsh plugin list in the ~/.zshrc file:\n\
plugins=(... ohmyzsh-full-autoupdate)"


echo "Please install the font on your system before installing powerlevel10k theme"
#https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc"