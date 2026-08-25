{
  lib,
  pkgs,
  ...
}:
# Shared packages for desktops
let
  binaryCompatibility = {
    environment.systemPackages = with pkgs; [
      binutils
      steam-run
      appimage-run
    ];
    programs.nix-ld.enable = true;
  };
  commonTerminal = {
    environment.systemPackages = with pkgs; [
      # Emulator
      kitty

      # Archive
      zip
      unzip
      rar
      unrar
      p7zip
      mat2

      # CLI
      wl-clipboard # ... | wl-copy
      yazi
      btop # general system information
      gdu # disk usage
      tree # print entire directory
      wiremix # audio control
      kew

      ## Forensic
      fastfetch
      exiftool
      steghide
      stegseek
      zsteg
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
      snapshot
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
  commonGames = {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.waylandFull
      winetricks
      protonplus
      heroic
      osu-lazer-bin
      prismlauncher
    ];
    programs = {
      gamemode.enable = true;
      steam = {
        enable = true;
        package = pkgs.millennium-steam;
      };
    };
  };
  commonOffice = {
    environment.systemPackages = with pkgs; [
      monero-gui
      telegram-desktop
    ];
    programs = {
      thunderbird.enable = true;
      zoom-us.enable = true;
    };
  };
  commonNet = {
    environment.systemPackages = with pkgs; [
      # Password manager
      bitwarden-desktop

      # Browser
      librewolf
      tor-browser

      # Client
      qbittorrent
      proton-vpn
      freetube
      dorion
      localsend
    ];
  };
  commonDev = {
    services = {
      ollama = {
        package = pkgs.ollama-cuda;
        port = 11434;
        enable = true;
      };
      open-webui = {
        port = 8081;
        enable = true;
      };
    };
    environment.systemPackages = with pkgs; [
      aichat
    ];
  };
in
lib.mkMerge [
  binaryCompatibility
  commonTerminal
  gstreamerFull
  myMultimedia
  commonGames
  commonOffice
  commonNet
  commonDev
]
