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

      # Audio tuner
      easyeffects

      # Image
      imagemagick
      gimp
      krita
      # Editor
      kdePackages.kdenlive

      # Modeling
      blender
      unityhub

      # Capturer
      snapshot
    ];
    programs.obs-studio = {
      package = pkgs.obs-studio.override { cudaSupport = true; };
      enableVirtualCamera = true;
      enable = true;
    };
  };
  options.common.multimedia.enable = lib.mkEnableOption "Common desktop multimedia options.";
}
