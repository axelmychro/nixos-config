{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
}
