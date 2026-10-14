{ config, pkgs, ... }:
{

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  services = {
    gnome.gnome-keyring.enable = true;
    greetd = {
      enable = !config.services.displayManager.sddm.enable;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };
  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    swaylock.enableGnomeKeyring = true;
  };
  environment.systemPackages = with pkgs; [
    swaynotificationcenter
    # Screenshot
    grim
    slurp
    sway-contrib.grimshot
  ];
}
