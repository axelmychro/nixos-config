{
  version,
  config,
  pkgs,
  assets,
  nixvim,
  ...
}:
let
  user = config.nixosConfigUsers.axelmychro;
in
{
  users.users.${user.name} = {

    packages = with pkgs; [
      eza
      ripgrep
      fd
    ];
    shell = pkgs.fish;

    extraGroups = [
      "video"
      "render"
      "docker"
      "libvirtd"
    ];
  };
  programs.fish.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        ;
    };

    users.${user.name} = {
      home = {
        homeDirectory = "/home/${user.name}";
        stateVersion = version; # HM is developed against nixos-unstable
      };
      xdg.enable = true;

      imports = [
        ./bash
        ./fish
        ./git
        ./lazygit
        ./fastfetch
        ./hyfetch
        ./oh-my-posh
        ./tmux
        nixvim.homeModules.default
        ./nixvim
      ];
    };
  };
}
