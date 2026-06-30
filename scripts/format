#!/bin/sh

find . -type f -name '*.nix' -exec nixfmt {} +
find . -type f \( -name '*.sh' -o -name '*.bash' \) -exec shfmt -w -- {} +
