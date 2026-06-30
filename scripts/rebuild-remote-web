#!/bin/sh
set -eu

git add --all
target='axelmychro@prts-web'
nixos-rebuild switch \
	--ask-sudo-password \
	--install-bootloader \
	--flake .#web \
	--target-host $target \
	--build-host $target
