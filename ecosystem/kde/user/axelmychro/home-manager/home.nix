{
  pkgs,
  nixvim,
  assets,
  plasma-manager,
  them,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        plasma-manager
        ;
    };
    sharedModules = [ plasma-manager.homeModules.plasma-manager ];

    users.${them} = {
      home = {
        homeDirectory = "/home/${them}";
        stateVersion = "26.05"; # HM is developed against nixos-unstable
        pointerCursor = {
          enable = true;
          package = pkgs.vanilla-dmz;
          name = "Vanilla-DMZ";
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
        ./programs/index.nix
        ./plasma-manager/index.nix
      ];
    };
  };
}
