{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.kdenlive
    krita
    imagemagick
  ];
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    package = (
      pkgs.obs-studio.override {
        cudaSupport = false;
      }
    );
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };
}
