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
      imports = [ ./index.nix ];
    };
  };
}
