{ pkgs, ... }:
{
  services = {
    desktopManager.cosmic.enable = true;
    #displayManager.cosmic-greeter.enable = true;
    system76-scheduler.enable = true;
  };
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
