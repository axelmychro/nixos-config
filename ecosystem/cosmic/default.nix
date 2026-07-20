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

      # Term
      kitty
      # Browser
      firefox-bin
      # Documents
      libreoffice
      # Audio player
      decibels
      # Image viewer
      loupe

      # Else
      vscode
      fpc

      # Binary compatibilities
      binutils
      nix-ld
      steam-run

      easyeffects
      zoom-us

      # File explorer
      yazi
      # NOTE: cosmic-player requires gstreamer
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gst_all_1.gst-vaapi
    ];
    variables.GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0";
  };
}
