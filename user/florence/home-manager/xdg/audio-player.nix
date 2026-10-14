{
  config,
  lib,
  pkgs,
  ...
}:
let
  audio_players = {
    amberol = {
      command = "amberol";
      entry = "io.bassi.Amberol.desktop";
      package = pkgs.amberol;
    };
    elisa = {
      command = "elisa";
      entry = "org.kde.elisa.desktop";
      package = pkgs.elisa;
    };
    rhythmbox = {
      command = "rhythmbox";
      entry = "rhythmbox.desktop";
      package = pkgs.rhythmbox;
    };
  };
  default_audio_player = audio_players.${config.defaultApplications.audioPlayer.program};
in
{
  options.defaultApplications.audioPlayer = lib.mkOption {
    type = lib.types.submodule {
      options = {
        program = lib.mkOption {
          type = lib.types.enum [
            "amberol"
            "rhythmbox"
            "elisa"
          ];
          description = "Default audio player.";
        };
        command = lib.mkOption { type = lib.types.str; };
        entry = lib.mkOption { type = lib.types.str; };
      };
    };
  };
  config = {
    defaultApplications.audioPlayer.command = default_audio_player.command;
    defaultApplications.audioPlayer.entry = default_audio_player.entry;
    home.packages = [ default_audio_player.package ];
    services.amberol.enable = config.defaultApplications.audioPlayer.program == "amberol";
  };
}
