{
  lib,
  pkgs,
  prismlauncher,
  ...
}:
# Shared packages for desktops
let
  binaryCompatibility = {
    environment.systemPackages = with pkgs; [
      binutils
      steam-run
    ];
    programs.nix-ld.enable = true;
  };
  myTerminalism = {
    environment.systemPackages = with pkgs; [
      kitty # Emulator
      yazi
      fastfetch
      btop
      gdu
      tree
      kew
      wiremix
      wl-clipboard # wl-copy
    ];
  };
  gstreamerFull = {
    environment = {
      systemPackages = with pkgs; [
        # NOTE: Some programs like cosmic-player requires gstreamer.
        gst_all_1.gstreamer
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-libav
        gst_all_1.gst-vaapi
      ];
      variables.GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
    };
  };
  myMultimedia = {
    environment.systemPackages = with pkgs; [
      ffmpeg
      imagemagick
      gimp
      krita
      kdePackages.kdenlive
      blender
      unityhub
      easyeffects
    ];
    programs = {
      obs-studio = {
        package = pkgs.obs-studio.override {
          cudaSupport = true;
        };
        enable = true;
        enableVirtualCamera = true;
      };
    };
  };
  myGames = {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.waylandFull
      winetricks
      protonplus
      #gamemode
      #steam
      heroic
      #osu-lazer-bin
      prismlauncher.packages.${pkgs.system}.prismlauncher
    ];
    programs = {
      gamemode.enable = true;
      steam = {
        enable = true;
        package = pkgs.millennium-steam;
      };
    };
  };
in
lib.mkMerge [
  binaryCompatibility
  myTerminalism
  {
    environment.systemPackages = with pkgs; [
      # Browser
      firefox

      # Univ & office
      libreoffice
      zoom-us
    ];

  }
  gstreamerFull
  myMultimedia
  myGames
]
