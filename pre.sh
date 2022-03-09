#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive
apt update
apt dist-upgrade -y -q --force-yes
reboot
