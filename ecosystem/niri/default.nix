{
  pkgs,
  noctalia,
  ...
}:
{
  programs.niri.enable = true;

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite
    cliphist
  ];

  xdg.portal.config.niri = {
    "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
  };

  imports = [ ./user/index.nix ];
}
