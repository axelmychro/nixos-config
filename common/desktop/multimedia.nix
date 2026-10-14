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
      yt-dlp
      gallery-dl
      spotdl

      # capturer
      snapshot

      # audio
      amberol
      eartag
      easyeffects

      # image
      imagemagick

      # video
      haruna
      kdePackages.kdenlive
    ];
    programs.obs-studio = {
      package = pkgs.obs-studio.override { cudaSupport = true; };
      enableVirtualCamera = true;
      enable = true;
    };
  };
  options.common.multimedia.enable = lib.mkEnableOption "Common desktop multimedia packages.";
}
