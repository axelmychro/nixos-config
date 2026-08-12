{
  lib,
  pkgs,
  assets,
  ...
}:
let
  bg_file_name = "priestess_moon.mp4";
in
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
    backgrounds."${bg_file_name}" = "${assets}/${bg_file_name}";

    settings = {
      "LoginScreen" = {
        background = "${bg_file_name}";
      };
      "LockScreen" = {
        background = "${bg_file_name}";
      };
      "LockScreen.Message" = {
        text = "Welcome back, Oracle.";
      };
    };
    enable = true;
  };

  imports = [ ./user/index.nix ];
}
