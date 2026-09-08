{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.utilities.enable {
    environment.systemPackages = with pkgs; [
      bitwarden-desktop
      gnome-clocks
      peazip
      sherlock
      cpu-x
      gparted
      gpu-viewer
      usbview
    ];
  };
  options.common.utilities.enable = lib.mkEnableOption "Common desktop utility packages.";
}
