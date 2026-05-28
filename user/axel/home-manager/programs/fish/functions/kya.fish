function kya
    argparse W/wipe u/update -- $argv
    or return

    set nixos_config_dir "$HOME/nixos-config"
    set flake_file "$nixos_config_dir/flake.nix"

    set flake_opt skadi
    set operation_opt boot

    if set -q -- _flag_wipe
        log Purge
        sudo -v
        sudo nix-collect-garbage --delete-old
        sudo -v
        sudo nix-store --verify --repair
        sudo -v
        sudo nix store optimise
    end
    if set -q -- _flag_update
        log Update
        sudo -v
        nix flake update --verbose
    end

    sudo -v
    fd -e nix -X nixfmt {}
    fd -e kdl -X kdlfmt format {}
    fd -e fish -X fish_indent -w {}
    fd -e sh -e bash -X shfmt -w -s {}

    git -C "$nixos_config_dir" add .
    rm -f "$HOME/.gtkrc-2.0"
    if sudo nixos-rebuild "$operation_opt" --flake "$nixos_config_dir#$flake_opt" --verbose --install-bootloader --upgrade-all
        log "Done $THE_CMD $flake_opt $operation_opt"
    else
        log -e "Failed $THE_CMD $flake_opt $operation_opt"
        return 1
    end
end
