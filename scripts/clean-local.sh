#!/bin/sh

nix-collect-garbage --delete-old
nix store optimise
