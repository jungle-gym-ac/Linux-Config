#!/bin/bash
set -x #调试

# Define the version of ZSH, set it to "latest" to install the latest version
ZSH_VERSION="latest" #ZSH_VERSION="5.8"

# Set the installation directory
INSTALL_DIR=$HOME/usr

# Create the necessary directories for temporary files
mkdir -p $INSTALL_DIR $HOME/tmp

# Download ZSH source code
if [ "$ZSH_VERSION" = "latest" ]; then
    ZSH_URL="https://sourceforge.net/projects/zsh/files/latest/download"
else
    ZSH_URL="https://sourceforge.net/projects/zsh/files/zsh/${ZSH_VERSION}/${ZSH_FILE}/download"
fi

ZSH_FILE="zsh-${ZSH_VERSION}.tar.gz"

cd $HOME/tmp
wget -O "$ZSH_FILE" "$ZSH_URL"

# Extract the tar file, although its name is *.tar.gz, it is actually only a tar packed file(not gzipped)
mkdir "./zsh-${ZSH_VERSION}" && tar -xf "$ZSH_FILE" -C "./zsh-${ZSH_VERSION}" --strip-components 1
# Go into the source directory
cd "./zsh-${ZSH_VERSION}"

# Configure the installation path, zsh will bie installed to /bin/zsh
./configure --prefix=$INSTALL_DIR

# Compile the source code
make

# Install zsh
make install

if [ -f $INSTALL_DIR/bin/zsh ]; then
    # Add the binary to path
    echo "export PATH=$INSTALL_DIR/bin:\$PATH" >> $HOME/.bashrc
    #\$ syntax is used to escape the $ character so that it is interpreted as a literal character, 从而使$PATH作为字符串输入，而不是将$PATH变量的真实值输入。

    # Change default shell to zsh, refer to https://zsh.sourceforge.io/FAQ/zshfaq01.html#l7
    echo "[ -f $INSTALL_DIR/bin/zsh ] && exec $INSTALL_DIR/bin/zsh -l" >> $HOME/.bashrc
    # "chsh -s $INSTALL_DIR/bin/zsh" needs root access
fi

# Clean up
cd $HOME
rm -rf $HOME/tmp

source $HOME/.bashrc

set +x
