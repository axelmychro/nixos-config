{
  assets,
  inputs,
  pkgs,
  user,
  version,
  theme,
  wallpaper-file,
  ...
}:
{
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
      ripgrep
      fd
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
    };
    sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

    users.${user} = {
      home = {
        homeDirectory = "/home/${user}";
        stateVersion = version; # HM is developed against nixos-unstable

        pointerCursor = {
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePineDawn-Linux";
          size = 64;
          enable = true;
          x11.enable = true;
          gtk.enable = true;
        };
      };
      xdg.enable = true;

      editorconfig = {
        enable = true;
        settings = {
          "*" = {
            charset = "utf-8";
            end_of_line = "lf";
            trim_trailing_whitespace = true;
            insert_final_newline = true;
            max_line_width = 80;
          };
        };
      };

      imports = [
        ./bash
        ./cava
        ./cosmic-manager
        ./direnv
        ./fastfetch
        ./fish
        ./git
        ./glow
        ./hyfetch
        ./kitty
        ./konsole
        ./lazygit
        ./nixcord
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
}
