{
  imports = [
    ./display-manager.nix

    ./binary-compatibility.nix
    ./development.nix
    ./games.nix
    ./graphics.nix
    ./gstreamer.nix
    ./internet.nix
    ./multimedia.nix
    ./office.nix
    ./terminal.nix
    ./utilities.nix
  ];
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common.default = [
        "gtk"
      ];
      cosmic = {
        default = [
          "cosmic"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
      kde = {
        default = [
          "kde"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "kwallet"
        ];
      };
      gnome = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
      pantheon = {
        default = [
          "pantheon"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
      x-cinnamon = {
        default = [
          "xapp"
          "gtk"
        ];
      };
    };
  };
  common = {
    binaryCompatibility.enable = true;
    development = {
      enable = true;
      ai.enable = true;
    };
    games.enable = true;
    graphics.enable = true;
    gstreamer.enable = false;
    internet.enable = true;
    multimedia.enable = true;
    office.enable = true;
    terminal.enable = true;
    utilities.enable = true;
  };
}
