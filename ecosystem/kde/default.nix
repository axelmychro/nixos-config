{
  lib,
  pkgs,
  assets,
  ...
}:
{
  services.desktopManager.plasma6.enable = true;
  environment = {
    systemPackages = with pkgs; [
      firefox
      haruna

      vscode
      fpc

      # Binary compatibilities
      nix-ld
      steam-run
    ];
    plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
    ];
  };

  imports = [ ./user/index.nix ];

  services.displayManager.sddm = {
    enable = lib.mkForce true;
    wayland.enable = lib.mkForce true;
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
}
