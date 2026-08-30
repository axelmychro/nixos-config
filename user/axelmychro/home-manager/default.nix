{
  config,
  assets,
  inputs,
  pkgs,
  version,
  user,
  ...
}:
let
  file_name = "kiana-rose_pine_dawn_iris.png";
  wallpaper_file = "${assets}/wallpaper-${file_name}";
  out = "${config.home-manager.users.${user}.home.homeDirectory}/Pictures/Wallpapers";
in
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        inputs
        ;
    };
    users.${user} = {
      home = {
        homeDirectory = "/home/${user}";
        stateVersion = version; # HM is developed against nixos-unstable
        pointerCursor = {
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePineDawn-Linux";
          size = 48;
          enable = true;
          x11.enable = true;
          gtk.enable = true;
        };
        activation.wallpaper = ''
          mkdir -p "${out}"
          cp -f "${wallpaper_file}" "${out}/${file_name}"
        '';
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
  users.users.${user} = {
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
    ];
    shell = pkgs.fish;
  };
}
