{ pkgs, ... }:
# Shared packages for desktops
{
  environment = {
    systemPackages = with pkgs; [
      # Terminal emulator
      kitty
      # System information
      yazi
      fastfetch
      btop
      gdu

      # Browser
      firefox
      # Documents
      libreoffice

      # Multimedia
      gimp
      krita
      kdePackages.kdenlive
      blender
      zoom-us
      easyeffects

      # Binary compatibilities
      binutils
      nix-ld
      steam-run

      # NOTE: some programs like cosmic-player requires gstreamer
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gst_all_1.gst-vaapi
    ];
    variables = {
      GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
    };
  };
}
