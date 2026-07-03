{ pkgs, ... }: {
  services.desktopManager.plasma6.enable = true;
  environment = {
    systemPackages = with pkgs; [
      haruna
      ncmpcpp
    ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      elisa
    ];
  };

  imports = [ ./user/index.nix ];
}
