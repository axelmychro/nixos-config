{
  config,
  lib,
  pkgs,
  ...
}:
let
  mail_clients = {
    evolution = {
      command = "evolution";
      entry = "org.gnome.Evolution.desktop";
      package = pkgs.evolution;
    };
    thunderbird = {
      command = "thunderbird";
      entry = "thunderbird.desktop";
      package = pkgs.thunderbird;
    };
  };
  default_mail_client = mail_clients.${config.defaultApplications.mailClient.program};
in
{
  options.defaultApplications.mailClient = lib.mkOption {
    type = lib.types.submodule {
      options = {
        program = lib.mkOption {
          type = lib.types.enum [
            "thunderbird"
            "evolution"
          ];
          description = "Default mail client.";
        };
        command = lib.mkOption { type = lib.types.str; };
        entry = lib.mkOption { type = lib.types.str; };
      };
    };
  };
  config = {
    defaultApplications.mailClient.command = default_mail_client.command;
    defaultApplications.mailClient.entry = default_mail_client.entry;
    home.packages = [ default_mail_client.package ];
    programs.thunderbird.enable = config.defaultApplications.mailClient.program == "thunderbird";
  };
}
