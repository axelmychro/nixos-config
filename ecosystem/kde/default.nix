{ pkgs, ... }:
{
  services = {
    desktopManager.plasma6.enable = true;
  };
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      ark
      #dolphin
      elisa
      gwenview
      kate
      konsole
      okular
      plasma-browser-integration
    ];
  };
}
