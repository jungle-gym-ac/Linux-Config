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


#pip install gpustat