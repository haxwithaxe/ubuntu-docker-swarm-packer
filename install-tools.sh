#!/bin/bash

set -ex

export DEBIAN_FRONTEND=noninteractive  
apt install -y -qq screen neovim bash-completion net-tools dnsutils

# Set default editor
update-alternatives --set vi /usr/bin/nvim
update-alternatives --set vim /usr/bin/nvim
update-alternatives --set editor /usr/bin/nvim
