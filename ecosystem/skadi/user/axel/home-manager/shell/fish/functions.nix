_: {
  programs.fish.functions = {
    generate = {
      body = ''
        argparse r/reboot u/update w/wipe -- $argv
        or return

        if set -q _flag_update
          nix flake update
        end
        if set -q _flag_wipe
            nix profile wipe-history
            nix store gc
            nix store optimise
        end

        fd -e nix -x nixfmt {}
        fd -e kdl -x kdlfmt format {}
        git add .

        if sudo nixos-rebuild switch --flake .#skadi
          if set -q _flag_reboot
            echo "Rebooting in 5 seconds... (Ctrl+C to cancel)"
            sleep 5
            systemctl reboot
          end
          return 0
        else
          echo "generate failed."
          return 1
        end
      '';
    };
  };
}
