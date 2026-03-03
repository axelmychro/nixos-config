{ aagl, ... }:
{
  nix.settings = aagl.nixConfig;
  programs = {
    anime-games-launcher.enable = false;
    anime-game-launcher.enable = true;
    honkers-railway-launcher.enable = false;
    honkers-launcher.enable = false;
    wavey-launcher.enable = false;
    sleepy-launcher.enable = false;
  };
}
