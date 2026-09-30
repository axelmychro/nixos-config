{ config, pkgs, ... }:
{
  services = {
    desktopManager.cosmic.enable = true;
    #displayManager.cosmic-greeter.enable = true;
    system76-scheduler.enable = true;
  };
  # HACK: For whatever reason, this "fixed" cosmic-screenshot not running.
  #       Not sure why it wouldn't launch in the first place.
  xdg.portal.extraPortals =
    if config.services.desktopManager.cosmic.enable then [ pkgs.xdg-desktop-portal-cosmic ] else [ ];
  environment = {
    cosmic.excludePackages = with pkgs; [
      cosmic-edit
      #cosmic-files
      cosmic-player
      cosmic-reader
      cosmic-store
      cosmic-term
    ];
  };
}
