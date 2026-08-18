function install-osu-bin
    set -l src 'https://github.com/ppy/osu/releases/latest/download/osu.AppImage'
    set -l out "$HOME/.local/bin/osu"

    rm -f "$out"
    curl -L "$src" --output "$out"
    chmod +x "$out"
end
