{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.games.enable {
    environment.systemPackages = with pkgs; [
      # Winery
      wineWow64Packages.waylandFull
      winetricks
      protonplus

      # Launcher
      heroic
      prismlauncher
      osu-lazer-bin
    ];
    programs.steam = {
      package = pkgs.millennium-steam;
      enable = true;
    };
    programs.gamemode.enable = true;
  };
  options.common.games.enable = lib.mkEnableOption "Common games options.";
}
