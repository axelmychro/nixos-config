_: {
  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;

    shellInit = ''
      ${builtins.readFile ./functions/log.fish}
      ${builtins.readFile ./functions/kya.fish}
    '';
    interactiveShellInit = builtins.readFile ./config.fish;
  };
  imports = [
    ./abbrs/index.nix
    ./aliases/index.nix
  ];
}
