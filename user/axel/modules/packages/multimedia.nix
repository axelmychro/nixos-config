{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.kdenlive
    imagemagick
    #qview
  ];
  programs.obs-studio = {
    enable = false;
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
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
