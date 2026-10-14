{
  config,
  lib,
  pkgs,
  ...
}:
let
  calendars = {
    thunderbird = {
      command = "thunderbird";
      entry = "thunderbird.desktop";
      package = pkgs.thunderbird;
    };
    gnome-calendar = {
      command = "gnome-calendar";
      entry = "org.gnome.Calendar.desktop";
      package = pkgs.gnome-calendar;
    };
  };
  default_calendar = calendars.${config.defaultApplications.calendar.program};
in
{
  options.defaultApplications.calendar = lib.mkOption {
    type = lib.types.submodule {
      options = {
        program = lib.mkOption {
          type = lib.types.enum [
            "thunderbird"
            "gnome-calendar"
          ];
          description = "Default calendar.";
        };
        command = lib.mkOption { type = lib.types.str; };
        entry = lib.mkOption { type = lib.types.str; };
      };
    };
  };
  config = {
    defaultApplications.calendar.command = default_calendar.command;
    defaultApplications.calendar.entry = default_calendar.entry;
    home.packages = [ default_calendar.package ];
  };
}
