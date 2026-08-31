{
  lib,
  pkgs,
  config,
  ...
}:
# NOTE: Some programs like cosmic-player requires GStreamer.
{
  config = lib.mkIf config.common.gstreamer.enable {
    environment = {
      systemPackages = with pkgs.gst_all_1; [
        gstreamer
        gst-plugins-base
        gst-plugins-good
        gst-plugins-bad
        gst-plugins-ugly
        gst-libav
        gst-vaapi
      ];
      variables.GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
    };
  };
  options.common.gstreamer.enable = lib.mkEnableOption "GStreamer multimedia library options.";
}
