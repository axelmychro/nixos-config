#!/bin/sh

git add --all
nixos-rebuild --sudo switch --install-bootloader --flake ".#${1:-kde}"
