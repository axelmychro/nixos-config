{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.utilities.enable {
    environment.systemPackages = with pkgs; [
      mpvpaper
      wvkbd
      calcurse
      gnome-clocks
      peazip
      bitwarden-desktop
      ente-auth

      # system information
      cpu-x
      gparted
      usbview
      gpu-viewer

      # clipboaard manager
      wl-clipboard # useful "... | wl-copy" pipe
      wl-clip-persist
    ];
  };
  options.common.utilities.enable = lib.mkEnableOption "Common desktop utility packages.";
}
