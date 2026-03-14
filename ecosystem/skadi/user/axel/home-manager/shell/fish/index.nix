_: {
  programs.fish = {
    enable = true;
    shellAliases = {
      x = "exit";

      wd = "waydroid";
      wds = "waydroid show-full-ui";
      wdx = "waydroid session stop && sudo systemctl stop waydroid-container";
    };
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch";
      nrsf = "sudo nixos-rebuild switch --flake";
      nrt = "sudo nixos-rebuild test";
      nrtf = "sudo nixos-rebuild test --flake";
      nrd = "sudo nixos-rebuild dry-run";
      nrdf = "sudo nixos-rebuild dry-run --flake";
      nu = "nix flake update";

      g = "git";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";

      nf = "fd -e nix -x sh -c 'nixfmt {}'";
      kf = "fd -e kdl -x sh -c 'kdlfmt format {}'";
    };
    interactiveShellInit = ''
      set fish_greeting
      if test "$SHLVL" -le 2
        fastfetch
      end
    '';
  };
  home.shell.enableFishIntegration = true;
}
