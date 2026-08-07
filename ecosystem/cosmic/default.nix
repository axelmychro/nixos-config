{ pkgs, ... }:
{
  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
    system76-scheduler.enable = true;
  };

  environment = {
    cosmic.excludePackages = with pkgs; [
      cosmic-term
    ];
    systemPackages = with pkgs; [
      # Multimedia
      ## Audio player
      decibels
      ## Image viewer
      loupe
    ];
  };
  imports = [
    ./user/index.nix
  ];
}
