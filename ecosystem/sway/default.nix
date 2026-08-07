{ pkgs, ... }:
{

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  services = {
    gnome.gnome-keyring.enable = true;
    greetd = {
      enable = true;
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
    gdu

    # Screenshot
    grim
    slurp
    sway-contrib.grimshot

    # Clipboard
    wl-clipboard
    cliphist

    # Notification
    mako
    # Browser
    firefox
    # Documents
    libreoffice
    # Audio player
    decibels
    # Image viewer
    loupe

    # File explorer
    yazi
  ];

  imports = [ ./user/index.nix ];
}
