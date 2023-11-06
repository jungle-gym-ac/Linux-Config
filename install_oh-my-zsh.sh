#!/bin/bash
set -x #调试

# check if zsh is installed
if ! which zsh &> /dev/null; then
    # zsh not installed
    echo "zsh is not installed. Installing now..."
    sh install_zsh.sh
    # check again
    if ! which zsh &> /dev/null; then
        echo "zsh cannot be installed."
        exit -1
    else
        echo "zsh is now installed."
    fi

else
  echo "zsh is already installed."
fi


# install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

set +x