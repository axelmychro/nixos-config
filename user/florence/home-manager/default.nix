{
  assets,
  config,
  inputs,
  pkgs,
  theme,
  user,
  wallpaper-file,
  ...
}:
{
  programs.fish.enable = true;
  users.users.${user.name} = {
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
    ];
  };
  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        inputs
        theme
        user
        wallpaper-file
        ;
      nixpkgs_options = {
        user_shell = config.users.users.${user.name}.shell;
        hyprland = {
          is_enabled = config.programs.hyprland.enable;
          uwsm.is_enabled = config.programs.hyprland.withUWSM;
        };
      };
    };

    users.${user.name} = {
      home = {
        homeDirectory = user.home_dir;
        sessionVariables.EDITOR = "${pkgs.neovim}/bin/nvim";

        # NOTE: This is hardcoded because I like dawn pointer cursor.
        pointerCursor = {
          enable = true;
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePineDawn-Linux";
          size = 64;
        };
      };
      services.keybase.enable = true;

      imports = [
        # Foundational
        ./xdg
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
        ./zoxide
      ];
    };
  };
}
