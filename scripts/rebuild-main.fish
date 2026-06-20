#!/usr/bin/env fish

git add --all
nixos-rebuild --sudo switch --install-bootloader --flake .#main
