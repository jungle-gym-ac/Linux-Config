#!/bin/bash


#######GIT Configuration
if [ -z "$(git config --global user.name)" ]; then
    git config --global user.name jungle-gym-ac
fi

if [ -z "$(git config --global user.email)" ]; then
    git config --global user.email junzhang00@foxmail.com
fi


######## .bashrc configuration
echo '
# Conda command shortcuts
alias act="conda activate"
alias envl="conda env list"
alias dift="cd /home/zhangjun/dift && act dift"

#gpu monitor
alias gpu="watch -d -n 0.5 nvidia-smi"

# hugging face mirror, see https://hf-mirror.com/
export HF_ENDPOINT=https://hf-mirror.com
' >> ~/.bashrc

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
