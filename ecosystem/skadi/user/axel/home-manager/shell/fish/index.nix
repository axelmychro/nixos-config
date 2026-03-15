_: {
  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      if status is-interactive
        clear -x
      end
      if test "$SHLVL" -le 2
        fastfetch
      end
    '';
  };
  imports = [
    ./abbrs/index.nix
    ./aliases/index.nix
    ./functions/index.nix
  ];
}
