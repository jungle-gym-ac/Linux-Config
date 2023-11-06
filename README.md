My Linux Configuration Scripts.

- [Usage](#usage)
- [zsh installation(without root access)](#zsh-installationwithout-root-access)
- [oh-my-zsh installation](#oh-my-zsh-installation)
- [install zsh/oh-my-zsh plugins and the powerlevel10k scene](#install-zshoh-my-zsh-plugins-and-the-powerlevel10k-scene)
- [Other configurations](#other-configurations)
  - [Terminal Choice](#terminal-choice)
  - [aliases](#aliases)
  - [WSL 使用Windows Clash 代理](#wsl-使用windows-clash-代理)
  - [TODO](#todo)

# Usage
Simply clone the repository, modify some variables in the scripts, and run the scripts.

If you run scripts by `./xxx.sh`, you might need to run `chmod +x xxx.sh` first. You can also run by `bash xxx.sh`.

# [zsh](https://sourceforge.net/projects/zsh/) installation(without root access)
set version and install_dir in install_zsh.sh, then run
```
./install_zsh.sh
```

Then launch a new shell, and you will be prompted to configure zsh(create a .zshrc), however, I use oh-my-zsh for zsh management, and .zshrc will be automatically created by oh-my-zsh later. So I ignore the notification.

Zsh installation in this way(without root access) actually takes effect by this line in `~/.bashsrc` :
```[ -f $INSTALL_DIR/bin/zsh ] && exec $INSTALL_DIR/bin/zsh -l```

Every time a new shell is launched, bash will be launched first, and when loading `~/.bashrc` and executing the above line of code, zsh is launced.

# oh-my-zsh installation
simply run
```
./oh-my-zsh.sh
```

Configure Zsh/Oh-My-Zsh in .zshrc file.

# install zsh/oh-my-zsh plugins and the powerlevel10k scene
Before intalling powerlevel10k, you should install the fonts on your system and set the font for your terminal(VSCode terminal, Windows Terminal, etc)

Simply run `./install_oh-my-zsh_plugins.sh`.

# Other configurations

## Terminal Choice
- For windows, you can use Windows Terminal.
- For MacOS, you can use iTerm2.

## aliases
Create some aliases in `.zshrc`. You can also create and store aliases in `.bash_alias`.

Aliases for projects:
```
alias qpic_project= "cd ... && act ..."
```
## WSL 使用Windows Clash 代理
使用.proxy文件，注意事项：https://wph.im/199.html

## TODO
- learn shortcuts and customization for my shell.
- add more aliases
- learn tmux
- sync dotfiles via chezmoi or yadm, or other dotfile managers in https://dotfiles.github.io/utilities/