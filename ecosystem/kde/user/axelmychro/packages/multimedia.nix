{ pkgs, ... }:
let
  obs-cuda = pkgs.obs-studio.override { cudaSupport = true; };
in
{
  environment.systemPackages = with pkgs; [
    imagemagick

    gimp
    krita
    kdePackages.kdenlive

    lmms

    blender
    #(blender.override {
    #  config.cudaSupport = true;
    #  config.rocmSupport = true;
    #})
  ];

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;

    package = obs-cuda;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };
}
