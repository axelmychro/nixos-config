#!/usr/bin/env fish

set cmd kya
set flags '[--purge/-p] [--update/-u] [--reboot/-r]'
function log
    argparse e/error E/critical -- $argv

    set code 0
    if set -q _flag_critical
        set code 2
    else if set -q _flag_error
        set code 1
    end

    set -l msg (string join " " $argv)

    set_color blue
    if test "$code" -gt 0
        set_color red
    end

    printf "(%s) %s\n" "$code" "$msg"
    set_color normal

    test "$code" -eq 2; and exit 1
    return "$code"
end
function usage
    log -E "usage: $cmd $flags <flake> <operation>"
end

# Eval
set nixos_config_dir "$HOME/nixos-config"
if not test -d "$nixos_config_dir"
    log -E 'NixOS config directory not found'
end
set flake_file "$nixos_config_dir/flake.nix"
if not test -f "$flake_file"
    log -E "Flake file not found"
end

# Run
argparse p/purge u/update r/reboot -- $argv
set flake_opt "$argv[1]"
set operation_opt "$argv[2]"
test -z "$flake_opt"; or test -z "$operation_opt"; and usage

function kya_purge
    log Purge
    sudo -v
    sudo nix-collect-garbage --delete-old
    sudo -v
    sudo nix-store --verify --repair
    sudo -v
    sudo nix store optimise
end
function kya_update
    log Update
    sudo -v
    nix flake update --verbose
end
function kya_reboot
    while true
        log "Rebooting in 5 seconds (Ctrl+C to cancel)"
        sleep 5
        if systemctl reboot
            break
        else
            log -e 'Reboot failed'
        end
    end
    return 0
end
function kya_format
    sudo -v
    fd -e nix -X nixfmt {}
    fd -e kdl -X kdlfmt format {}
    fd -e fish -X fish_indent -w {}
    fd -e sh -e bash -X shfmt -w -s {}
end
function kya_track
    git add "$nixos_config_dir"
end
function kya_rebuild
    if sudo nixos-rebuild "$operation_opt" --flake "$nixos_config_dir#$flake_opt" --verbose --install-bootloader --upgrade-all
        log "Done $cmd $flake_opt $operation_opt"
    else
        log -E "Failed $cmd $flake $operation"
    end
end

test -n "$_flag_purge"; and kya_purge
test -n "$_flag_update"; and kya_update
kya_format
kya_track
kya_rebuild
test -n "$_flag_reboot"; and kya_reboot
