set fish_greeting
set -l EDITOR nvim
command -v "$EDITOR" >/dev/null 2>&1; and set -g EDITOR "$EDITOR"
