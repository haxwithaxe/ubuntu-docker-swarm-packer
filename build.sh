#!/bin/bash

set -e

BUILD_DIR="build"
IMAGE_DIR="$BUILD_DIR/image"
DEPLOY_DIR="/mnt/resources/vms/"
IMG_URL="https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
IMG="ubuntu-20.04-server-cloudimg-amd64-docker-base.qcow2"
MODE=${1:-build}

if [[ "$MODE" == "build" ]]; then
	echo Building ...
	# Prebuild
	mkdir -p "$BUILD_DIR"
	if ! test -e "${BUILD_DIR}/cloud.img"; then
		 cloud-localds "${BUILD_DIR}/cloud.img" cloud.cfg
	fi
	if ! test -e "$BUILD_DIR/${IMG_URL//*\//}"; then
		 wget "$IMG_URL" -O "$BUILD_DIR/${IMG_URL//*\//}"
	fi
	rm -rf ${BUILD_DIR}/image
	# Build
	PACKER_LOG=1 packer build template.pkr.hcl
	echo Done building.
	echo -n "Deploying ... "
	sudo mv "$BUILD_DIR/image/${IMG}" "$DEPLOY_DIR/${IM}"
	echo Done deploying.
elif [[ "$MODE" == "clean" ]]; then
	echo Cleaning build environment.
	set -x
	rm -rf "$BUILD_DIR"
else
	echo "Usage: $0 [build|clean]"
	exit 1
fi
