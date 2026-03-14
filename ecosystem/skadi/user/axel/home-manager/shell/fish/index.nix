_: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      if test "$SHLVL" -le 2
        fastfetch
      end
    '';
  };
  home.shell.enableFishIntegration = true;

  imports = [
    ./abbrs.nix
    ./aliases.nix
    ./functions.nix
  ];
}
