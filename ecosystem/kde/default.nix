{
  lib,
  pkgs,
  assets,
  ...
}:
{
  services = {
    displayManager.sddm = {
      enable = lib.mkForce true;
      wayland.enable = lib.mkForce true;
    };
    desktopManager.plasma6.enable = true;
  };
  environment = {
    systemPackages = with pkgs; [
      firefox
      haruna
    ];
    plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
    ];
  };
  programs.silentSDDM = {
    theme = "rei";
    backgrounds."pries.mp4" = "${assets}/pries.mp4";

    settings = {
      "LoginScreen" = {
        background = "pries.mp4";
      };
      "LockScreen" = {
        background = "pries.mp4";
      };
      "LockScreen.Message" = {
        text = "Welcome back, Oracle.";
      };
    };
    enable = true;
  };

  imports = [ ./user/index.nix ];
}
