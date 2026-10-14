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
      age
      peazip
      bitwarden-desktop
      ente-auth

      # file manager
      cosmic-files

      # system information
      gparted

      # clipboaard manager
      wl-clipboard # useful "... | wl-copy" pipe
      cliphist
    ];
    programs.gnupg.agent.enable = true;
  };
  options.common.utilities.enable = lib.mkEnableOption "Common desktop utility packages.";
}
