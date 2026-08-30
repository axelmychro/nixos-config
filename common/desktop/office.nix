{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.office.enable {
    environment.systemPackages = with pkgs; [
      monero-gui
      libreoffice
      inkscape
      telegram-desktop
    ];
    programs.thunderbird.enable = true;
    programs.zoom-us.enable = true;
  };
  options.common.office.enable = lib.mkEnableOption "Common office suite options.";
}
