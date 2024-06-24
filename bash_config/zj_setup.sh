#!/bin/bash
set -x

#######GIT Configuration
if [ -z "$(git config --global user.name)" ]; then
    git config --global user.name jungle-gym-ac
fi

if [ -z "$(git config --global user.email)" ]; then
    git config --global user.email junzhang00@foxmail.com
fi


######## .bashrc configuration
read -p "Do you want to config Bash? (y/n) " configBash

if [ "$configBash" == "y" ]; then
    cat "bash_config/bashrc_content.sh" >> ~/.bashrc
    echo "Bash Configuration Done."
fi


############## SSH Configuration

# Prompt the user to enter if ssh configuration is neede
read -p "Do you want to configure ssh, so that you can connect to this machine remotely through ssh? (y/n) " isRemoteServer

if [ "$isRemoteServer" == "y" ]; then
    echo "You need to generate an SSH Key Pair on your local device, and copy the public key to this remote server."

    if [ ! -d ~/.ssh ]; then
        mkdir ~/.ssh
    fi

    if [ ! -f ~/.ssh/authorized_keys ]; then
        touch ~/.ssh/authorized_keys
    fi

    # Prompt the user to enter the SSH public key location
    while true; do
        read -p "Enter the SSH public key location, for example .ssh/id_rsa.pub. Location:" publicKeyLocation

        if [ -f "$publicKeyLocation" ]; then
            break
        else
            echo "File does not exist. Please enter a valid file location."
        fi
    done

    echo "Append the content of the public key to authorized_keys."
    cat "$publicKeyLocation" >> ~/.ssh/authorized_keys
    echo "Done."
fi



# Conda Installation
read -p "Do you want to install Miniconda? (y/n) " installMiniConda

if [ "$installMiniConda" == "y" ]; then
    echo "Intalling Miniconda."

    # https://docs.anaconda.com/miniconda/#quick-command-line-install
    mkdir -p ~/Software/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Software/miniconda3/miniconda.sh
    bash ~/Software/miniconda3/miniconda.sh -b -u -p ~/Software/miniconda3
    rm -rf ~/Software/miniconda3/miniconda.sh

    ~/Software/miniconda3/bin/conda init bash

    echo "Done."
fi