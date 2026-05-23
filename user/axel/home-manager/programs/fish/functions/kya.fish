#!/usr/bin/env fish

set THE_CMD kya
set THE_FLAGS '[--purge/-p] [--update/-u] [--reboot/-r]'
function log
    argparse e/error -- $argv

    set code 0
    set -q _flag_error; and set code 1

    set_color blue
    test "$code" -gt 0; and set_color red

    set -l msg (string join " " $argv)

    printf "(%s) %s\n" "$code" "$msg"
    set_color normal

    return "$code"
end
function usage
    log -e "usage: $THE_CMD $THE_FLAGS <flake> <operation>"
end

# Eval
set nixos_config_dir "$HOME/nixos-config"
if not test -d "$nixos_config_dir"
    log -e 'NixOS config directory not found'
    return 1
end

set flake_file "$nixos_config_dir/flake.nix"
if not test -f "$flake_file"
    log -e "Flake file not found"
    return 1
end

# Run
argparse p/purge u/update r/reboot -- $argv
set flake_opt "$argv[1]"
set operation_opt "$argv[2]"
if test -z "$flake_opt"; or test -z "$operation_opt"
    usage
    return 1
end

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
    git -C "$nixos_config_dir" add .
end
function kya_rebuild
    rm -f "$HOME/.gtkrc-2.0"
    if sudo nixos-rebuild "$operation_opt" --flake "$nixos_config_dir#$flake_opt" --verbose --install-bootloader --upgrade-all
        log "Done $THE_CMD $flake_opt $operation_opt"
    else
        log -e "Failed $THE_CMD $flake_opt $operation_opt"
        return 1
    end
end

test -n "$_flag_purge"; and kya_purge
test -n "$_flag_update"; and kya_update
kya_format
kya_track
kya_rebuild; or return 1
test -n "$_flag_reboot"; and kya_reboot
