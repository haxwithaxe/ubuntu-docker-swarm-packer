#!/bin/bash

set -ex

export DEBIAN_FRONTEND=noninteractive  
apt install -y -qq screen neovim bash-completion net-tools dnsutils
