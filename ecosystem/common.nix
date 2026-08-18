{ pkgs, prismlauncher, ... }:
# Shared packages for desktops
{
  programs = {
    nix-ld.enable = true;
    steam = {
      package = pkgs.millennium-steam;
      enable = true;
    };
    gamemode.enable = true;
  };
  environment = {
    systemPackages = with pkgs; [
      wl-clipboard # wl-copy

      # Terminalism
      kitty
      yazi
      fastfetch
      btop
      gdu
      wiremix

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

      # NOTE: Some programs like cosmic-player requires gstreamer
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gst_all_1.gst-vaapi

      # Binary compatibilities
      binutils
      #nix-ld
      steam-run

      # Games
      wineWow64Packages.waylandFull
      winetricks
      #gamemode
      protonplus
      #steam
      heroic
      #osu-lazer-bin
      prismlauncher.packages.${pkgs.system}.prismlauncher
    ];
    variables.GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
  };
}
