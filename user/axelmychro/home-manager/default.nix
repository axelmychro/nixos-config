{
  assets,
  config,
  inputs,
  pkgs,
  theme,
  user,
  version,
  wallpaper-file,
  ...
}:
{
  programs = {
    fish.enable = true;
    gnupg.agent.enable = true;
  };
  users.users.${user} = {
    shell = pkgs.fish;
    extraGroups = [
      "video"
      "render"
      "docker"
      "libvirtd"
    ];
    packages = with pkgs; [
      eza
      fd
      ripgrep
      trash-cli
      zoxide
    ];
  };
  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        inputs
        theme
        wallpaper-file
        ;
      system_hyprland = {
        is_enabled = config.programs.hyprland.enable;
        uwsm.is_enabled = config.programs.hyprland.withUWSM;
      };
    };
    sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

    users.${user} = {
      home = {
        homeDirectory = "/home/${user}";
        stateVersion = version; # HM is developed against nixos-unstable

        pointerCursor = {
          enable = true;
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePineDawn-Linux";
          size = 64;
        };
      };
      xdg.enable = true;

      imports = [
        ./mimeapps
        ./stylix
        ./cosmic-manager
        ./plasma-manager
        ./nixvim
        ./noctalia

        # Supplementary
        ./bash
        ./cava
        ./direnv
        ./editorconfig
        ./fastfetch
        ./fish
        ./git
        ./glow
        ./hyfetch
        ./hypr
        ./kitty
        ./konsole
        ./lazygit
        ./nixcord
        ./oh-my-posh
        ./tmux
        ./yazi
        ./zed
      ];
    };
  };
}
