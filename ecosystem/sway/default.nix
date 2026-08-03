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

  environment = {
    systemPackages = with pkgs; [
      gdu

      gimp
      krita
      kdePackages.kdenlive
      blender

      # Binary compatibilities
      binutils
      nix-ld
      steam-run

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

      # gstreamer
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gst_all_1.gst-vaapi
    ];
    variables = {
      GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0";
      SWAY_UNSUPPPORTED_GPU = "TRUE";
    };
  };

  imports = [ ./user/index.nix ];
}
