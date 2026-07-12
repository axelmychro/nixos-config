{
  pkgs,
  ...
}:
{
  home = {
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
    ./plasma-manager
    ./programs/index.nix
  ];
}
