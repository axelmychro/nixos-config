#!/bin/sh

nixos-rebuild switch --install-bootloader --ask-sudo-password --flake .#web --target-host axelmychro@prts-web
