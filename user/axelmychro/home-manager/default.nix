{
  assets,
  config,
  inputs,
  pkgs,
  version,
  ...
}:
let
  user = config.nixosConfigUsers.axelmychro;
in
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        inputs
        ;
    };

    users.${user.name} = {
      home = {
        homeDirectory = "/home/${user.name}";
        stateVersion = version; # HM is developed against nixos-unstable
      };
      imports = [
        ./bash
        ./cava
        ./direnv
        ./fish
        ./git
        ./kitty
        ./lazygit
        ./fastfetch
        ./hyfetch
        ./oh-my-posh
        ./tmux
        ./yazi
        inputs.nixvim.homeModules.default
        ./nixvim
        ./zed
        inputs.nixcord.homeModules.default
        ./nixcord
      ];
      xdg.enable = true;
    };
  };
  programs = {
    fish.enable = true;
    gnupg.agent.enable = true;
  };
  users.users.${user.name} = {

    extraGroups = [
      "video"
      "render"
      "docker"
      "libvirtd"
    ];
    packages = with pkgs; [
      eza
      ripgrep
      fd
      #tree
      #gdu
      #btop
      #kew
    ];
    shell = pkgs.fish;
  };
}
