{
  config,
  lib,
  pkgs,
  ...
}:
let
  image_viewers = {
    eog = {
      command = "eog";
      entry = "org.gnome.eog.desktop";
      package = pkgs.eog;
    };
    loupe = {
      command = "loupe";
      entry = "org.gnome.Loupe.desktop";
      package = pkgs.loupe;
    };
    ristretto = {
      command = "ristretto";
      entry = "org.xfce.ristretto.desktop";
      package = pkgs.ristretto;
    };
  };
  default_image_viewer = image_viewers.${config.defaultApplications.imageViewer.program};
in
{
  options.defaultApplications.imageViewer = lib.mkOption {
    type = lib.types.submodule {
      options = {
        program = lib.mkOption {
          type = lib.types.enum [
            "loupe"
            "ristretto"
            "eog"
          ];
          description = "Default image viewer.";
        };
        command = lib.mkOption { type = lib.types.str; };
        entry = lib.mkOption { type = lib.types.str; };
      };
    };
  };
  config = {
    defaultApplications.imageViewer.command = default_image_viewer.command;
    defaultApplications.imageViewer.entry = default_image_viewer.entry;
    home.packages = [ default_image_viewer.package ];
  };
}
