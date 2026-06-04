{
  lib,
  pkgs,
  nixvim,
  ...
}:
{
  home-manager.users.axel = {
    home = {
      homeDirectory = "/home/axel";
      stateVersion = "26.05"; # HM is developed against nixos-unstable
      pointerCursor = {
        enable = false;
        package = lib.mkDefault pkgs.nordzy-cursor-theme;
        name = lib.mkDefault "Nordzy-cursors-white";
        size = 48;

        x11 = {
          enable = true;
          defaultCursor = "left_ptr";
        };
        gtk.enable = true;
      };
    };
    xdg.enable = true;
    gtk = {
      enable = false;
      theme = {
        name = "Nordic";
        package = pkgs.nordic;
      };
      iconTheme = {
        name = "Nordzy";
        package = pkgs.nordzy-icon-theme;
      };
    };
    qt = {
      enable = true;
      # platformTheme.name = "gtk";
      # style.name = "Nordic";
    };
    imports = [
      nixvim.homeModules.default
      #./default-apps/index.nix
      ./programs/index.nix
    ];
  };
}
