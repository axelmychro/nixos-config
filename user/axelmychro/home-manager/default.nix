{
  assets,
  config,
  inputs,
  pkgs,
  user,
  version,
  wallpaper-file,
  ...
}:
let
  file_name = "kiana-rose_pine_dawn_iris.png";
  wallpaper_file = "${assets}/wallpaper-${file_name}";
  out = "${config.home-manager.users.${user}.home.homeDirectory}/Pictures/Wallpapers";
in
{
  _module.args.wallpaper-file = wallpaper_file;

  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        inputs
        wallpaper-file
        ;
    };
    sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

    users.${user} = {
      home = {
        homeDirectory = "/home/${user}";
        stateVersion = version; # HM is developed against nixos-unstable
        activation.wallpaper = ''
          mkdir -p "${out}"
          cp -f "${wallpaper-file}" "${out}/${file_name}"
        '';
        pointerCursor = {
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePineDawn-Linux";
          size = 48;
          enable = true;
          x11.enable = true;
          gtk.enable = true;
        };
      };
      xdg.enable = true;
      qt.enable = false;
      gtk.enable = false;
      imports = [
        ./bash
        ./cava
        ./direnv
        ./fastfetch
        ./fish
        ./git
        ./hyfetch
        ./kitty
        ./konsole
        ./lazygit
        inputs.nixcord.homeModules.default
        ./nixcord
        inputs.nixvim.homeModules.default
        ./nixvim
        ./oh-my-posh
        ./plasma-manager
        ./tmux
        ./yazi
        ./zed
      ];
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
