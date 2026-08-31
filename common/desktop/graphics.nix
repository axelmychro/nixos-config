{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.graphics.enable {
    environment.systemPackages = with pkgs; [
      blender
      gimp
      inkscape
      krita
      unityhub
    ];
  };
  options.common.graphics.enable = lib.mkEnableOption "Common desktop graphics packages.";
}
