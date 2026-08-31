{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.binaryCompatibility.enable {
    environment.systemPackages = with pkgs; [
      binutils
      steam-run
    ];
    programs.nix-ld.enable = true;
  };
  options.common.binaryCompatibility.enable = lib.mkEnableOption "Common binary compatibility options.";
}
