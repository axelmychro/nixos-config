argparse r/reboot u/update w/wipe -- $argv
or return

if set -q _flag_wipe
    echo "generate: wipe history, clean garbage, optimise store"
    nix profile wipe-history --verbose
    nix store gc --verbose
    nix store optimise --verbose
end

if set -q _flag_update
    echo "generate: update flake"
    nix flake update --verbose
end

echo "generate: format nix, kdl, and fish"
fd -e nix -x nixfmt {}
fd -e kdl -x kdlfmt format {}
fd -e fish -x fish_indent -w {}
git add .

set root .
set out "$root/overview.md"
rm -f "$out"

begin
    echo "# Overview"
    echo
    echo "Generated on: $(date)"
    echo

    set last_dir ""

    fd -t f -e nix -e sh -e fish -e kdl . "$root" \
        -E hardware-configuration.nix -E flake.lock | sort | while read -l file

        set -l rel_path (string replace -r "^$root/" "" $file)
        set -l rel_dir (dirname $rel_path)
        set -l filename (basename $file)
        set -l ext (string split -r -m1 . $file)[2]

        set -l lang $ext
        switch $ext
            case sh
                set lang bash
            case fish
                set lang fish
            case kdl
                set lang kdl
            case '*'
                set lang nix
        end

        if test "$rel_dir" != "$last_dir"
            if test "$rel_dir" = "."
                echo "## mynixos"
            else
                echo "## ./$rel_dir"
            end
            echo
            set last_dir "$rel_dir"
        end

        echo "### $filename"
        echo
        echo "```$lang"
        cat "$file"
        echo "```"
        echo
    end
end >"$out"

set_color blue
echo "generate: created $out"
set_color normal

echo "generate: switch"
if sudo nixos-rebuild switch --verbose --flake .#skadi
    if set -q _flag_reboot
        set_color yellow
        echo "rebooting in 5 seconds. (Ctrl+C to cancel)"
        set_color normal
        sleep 5
        systemctl reboot
    end
    return 0
else
    set_color red
    echo "generate failed"
    set_color normal
    return 1
end
