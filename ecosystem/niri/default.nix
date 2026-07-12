{
  pkgs,
  noctalia,
  ...
}:
{
  programs.niri.enable = true;
  # Niri has a screenshot!

  xdg.portal.config.niri = {
    "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    qt5.qtwayland
    qt6.qtwayland

    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    # Noctalia is a bar, notification daemon, wallpaper, and app launcher
    hyprpicker

    wl-clipboard
    cliphist

    kdePackages.dolphin
    lf

    firefox
    alacritty
    tmux
  ];

  imports = [ ./user/index.nix ];
}
