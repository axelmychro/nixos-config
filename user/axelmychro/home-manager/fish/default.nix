{ nixpkgs_options, pkgs, ... }: {
  programs.fish = {
    enable = nixpkgs_options.user_shell == pkgs.fish;
    interactiveShellInit = builtins.readFile ./config.fish;
  };
  imports = [
    ./abbrs.nix
    ./aliases.nix
    ./functions/index.nix
  ];
}
