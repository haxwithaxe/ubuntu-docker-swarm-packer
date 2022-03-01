#!/bin/bash

set -ex
export DEBIAN_FRONTEND=noninteractive 
 
apt-get -y update
apt-get -y upgrade
apt-get install -y -qq screen neovim bash-completion net-tools dnsutils
