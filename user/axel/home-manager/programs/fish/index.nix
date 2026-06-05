_: {
  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;

    shellInit = ''
      ${builtins.readFile ./functions/log.fish}
      ${builtins.readFile ./functions/kya.fish}
      ${builtins.readFile ./functions/mount-git.fish}
      ${builtins.readFile ./functions/dl.fish}
    '';
    interactiveShellInit = builtins.readFile ./config.fish;
  };
  imports = [
    ./abbrs.nix
    ./aliases.nix
  ];
}
