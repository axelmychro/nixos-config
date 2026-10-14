{
  config,
  lib,
  pkgs,
  ...
}:
let
  video_players = {
    haruna = {
      command = "haruna";
      entry = "org.kde.haruna.desktop";
      package = pkgs.haruna;
    };
    mpv = {
      command = "mpv";
      entry = "mpv.desktop";
      package = pkgs.mpv;
    };
    vlc = {
      command = "vlc";
      entry = "vlc.desktop";
      package = pkgs.vlc;
    };
  };
  default_video_player = video_players.${config.defaultApplications.videoPlayer.program};
in
{
  options.defaultApplications.videoPlayer = lib.mkOption {
    type = lib.types.submodule {
      options = {
        program = lib.mkOption {
          type = lib.types.enum [
            "haruna"
            "vlc"
            "mpv"
          ];
          description = "Default video player.";
        };
        command = lib.mkOption { type = lib.types.str; };
        entry = lib.mkOption { type = lib.types.str; };
      };
    };
  };
  config = {
    defaultApplications.videoPlayer.command = default_video_player.command;
    defaultApplications.videoPlayer.entry = default_video_player.entry;
    home.packages = [ default_video_player.package ];
  };
}
