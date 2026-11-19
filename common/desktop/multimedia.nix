{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.multimedia.enable {
    environment.systemPackages = with pkgs; [
      ffmpeg
      ffmpegthumbnailer
      yt-dlp
      gallery-dl
      spotdl
      anki

      # Capturer
      snapshot

      # Audio
      #amberol
      eartag
      easyeffects

      # Image
      imagemagick

      # Video
      #haruna
      kdePackages.kdenlive
    ];
    services.tumbler.enable = true;
    programs.obs-studio = {
      package = pkgs.obs-studio.override { cudaSupport = true; };
      enableVirtualCamera = true;
      enable = true;
    };
  };
  options.common.multimedia.enable = lib.mkEnableOption "Common desktop multimedia packages.";
}
