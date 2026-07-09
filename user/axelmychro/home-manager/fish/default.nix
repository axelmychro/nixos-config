_: {
  programs.fish = {
    enable = true;
    interactiveShellInit = builtins.readFile ./config.fish;
  };
  imports = [
    ./abbrs.nix
    ./aliases.nix
    ./functions/index.nix
  ];
}
