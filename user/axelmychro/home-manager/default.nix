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
      hyprland_enabled = config.programs.hyprland.enable;
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
          "*.{css,html,json,nix,xml}" = {
            indent_style = "space";
            indent_size = 2;
          };
        };
      };
      imports = [
        ./mimeapps
        ./stylix
        ./cosmic-manager
        ./plasma-manager
        ./nixvim
        ./noctalia

        ./bash
        ./cava
        ./direnv
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
