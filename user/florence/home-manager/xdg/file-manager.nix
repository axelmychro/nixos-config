{
  config,
  lib,
  pkgs,
  ...
}:
let
  file_managers = {
    cosmic-files = {
      command = "cosmic-files";
      entry = "com.system76.CosmicFiles.desktop";
      package = pkgs.cosmic-files;
    };
    dolphin = {
      command = "dolphin";
      entry = "org.kde.dolphin.desktop";
      package = pkgs.dolphin;
    };
    nautilus = {
      command = "nautilus";
      entry = "org.gnome.Nautilus.desktop";
      package = pkgs.nautilus;
    };
  };
  default_file_manager = file_managers.${config.defaultApplications.fileManager.program};
in
{
  options.defaultApplications.fileManager = lib.mkOption {
    type = lib.types.submodule {
      options = {
        program = lib.mkOption {
          type = lib.types.enum [
            "cosmic-files"
            "nautilus"
            "dolphin"
          ];
          description = "Default file manager.";
        };
        command = lib.mkOption { type = lib.types.str; };
        entry = lib.mkOption { type = lib.types.str; };
      };
    };
  };
  config = {
    defaultApplications.fileManager.command = default_file_manager.command;
    defaultApplications.fileManager.entry = default_file_manager.entry;
    home.packages = [ default_file_manager.package ];
  };
}
